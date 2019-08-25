package com.fc.crm.dao;

import com.fc.crm.domain.WorkPlanDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author fengchi
 * @email
 * @date 2019-08-24 18:23:38
 */
@Mapper
public interface WorkPlanDao {

    WorkPlanDO get(Integer id);

    List<WorkPlanDO> list(Map<String, Object> map);

    List<Map<String, Object>> findDatas(Map<String, Object> map);

    int save(WorkPlanDO workPlan);

    int update(WorkPlanDO workPlan);

    int remove(Integer id);

    int batchRemove(Integer[] ids);
}