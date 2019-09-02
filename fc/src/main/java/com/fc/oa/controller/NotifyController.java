package com.fc.oa.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.common.config.Constant;
import com.fc.common.controller.BaseController;
import com.fc.common.controller.IPageDefine;
import com.fc.common.domain.DictDO;
import com.fc.common.service.DictService;
import com.fc.common.utils.PageUtils;
import com.fc.common.utils.Query;
import com.fc.common.utils.R;
import com.fc.oa.domain.NotifyDO;
import com.fc.oa.domain.NotifyDTO;
import com.fc.oa.domain.NotifyRecordDO;
import com.fc.oa.service.NotifyRecordService;
import com.fc.oa.service.NotifyService;
import com.github.pagehelper.PageInfo;

/**
 * 通知通告
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-10-05 17:11:16
 */

@Controller
@RequestMapping("/oa/notify")
public class NotifyController extends BaseController {
	@Autowired
	private NotifyService notifyService;
	@Autowired
	private NotifyRecordService notifyRecordService;
	@Autowired
	private DictService dictService;

	@GetMapping()
	@RequiresPermissions("oa:notify:notify")
	String oaNotify() {
		return "oa/notify/notify";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("oa:notify:notify")
	public PageUtils list(@RequestParam Map<String, Object> params) {
		//根据分页参数(格式：{limit=10, offset=0} )，然后进行分页查询
        return getPageList(params, new IPageDefine() {
			
			@Override
			public List<?> getPageRows(Query query){
				return notifyService.list(query);
			}
        });
	}

	@GetMapping("/add")
	@RequiresPermissions("oa:notify:add")
	String add() {
		return "oa/notify/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("oa:notify:edit")
	String edit(@PathVariable("id") Long id, Model model) {
		NotifyDO notify = notifyService.get(id);
		List<DictDO> dictDOS = dictService.listByType("oa_notify_type");
		String type = notify.getType();
		for (DictDO dictDO:dictDOS){
			if(type.equals(dictDO.getValue())){
				dictDO.setRemarks("checked");
			}
		}
		model.addAttribute("oaNotifyTypes",dictDOS);
		model.addAttribute("notify", notify);
		return "oa/notify/edit";
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("oa:notify:add")
	public R save(NotifyDO notify) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		notify.setCreateBy(getUserId());
		if (notifyService.save(notify) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("oa:notify:edit")
	public R update(NotifyDO notify) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		notifyService.update(notify);
		return R.ok();
	}

	/**
	 * 删除
	 */
	@PostMapping("/remove")
	@ResponseBody
	@RequiresPermissions("oa:notify:remove")
	public R remove(Long id) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (notifyService.remove(id) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 删除
	 */
	@PostMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("oa:notify:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		notifyService.batchRemove(ids);
		return R.ok();
	}

	@ResponseBody
	@GetMapping("/message")
	PageUtils message() {
		PageUtils pageUtils = null;
        try {
			//查询列表数据
        	Map<String, Object> params = new HashMap<>(16);
    		params.put("offset", 0);
    		params.put("limit", 3);
    		Query query = new Query(params);
            query.put("userId", getUserId());
            query.put("isRead",Constant.OA_NOTIFY_READ_NO);
            
			List<NotifyDTO> list = notifyService.selfList(query);
			//获取页码参数
			PageInfo<NotifyDTO> pageInfo = new PageInfo<>(list, query.getLimit());
			pageUtils = new PageUtils(pageInfo.getList(), pageInfo.getTotal());
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return pageUtils;
	}

	@GetMapping("/selfNotify")
	String selefNotify() {
		return "oa/notify/selfNotify";
	}

	@ResponseBody
	@GetMapping("/selfList")
	PageUtils selfList(@RequestParam Map<String, Object> params) {
		PageUtils pageUtils = null;
        try {
			//查询列表数据
	        Query query = new Query(params);
			query.put("userId", getUserId());
			List<NotifyDTO> list = notifyService.selfList(query);
			
			//获取页码参数
			PageInfo<NotifyDTO> pageInfo = new PageInfo<>(list, query.getLimit());
			pageUtils = new PageUtils(pageInfo.getList(), pageInfo.getTotal());
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return pageUtils;
	}

	@GetMapping("/read/{id}")
	@RequiresPermissions("oa:notify:edit")
	String read(@PathVariable("id") Long id, Model model) {
		NotifyDO notify = notifyService.get(id);
		//更改阅读状态
		NotifyRecordDO notifyRecordDO = new NotifyRecordDO();
		notifyRecordDO.setNotifyId(id);
		notifyRecordDO.setUserId(getUserId());
		notifyRecordDO.setReadDate(new Date());
		notifyRecordDO.setIsRead(Constant.OA_NOTIFY_READ_YES);
		notifyRecordService.changeRead(notifyRecordDO);
		model.addAttribute("notify", notify);
		return "crm/workPlan/workPlan_list";
	}



}
