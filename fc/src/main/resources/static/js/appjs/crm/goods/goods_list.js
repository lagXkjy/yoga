
var prefix = ctx+ "/crm/goods"
$(function() {
	load();
});

function load() {
	$('#dataTable')
			.bootstrapTable(
					{
						method : 'get', // 服务器数据的请求方式 get or post
						url : prefix + "/listPage", // 服务器数据的加载地址
						// showRefresh : true,
						// showToggle : true,
						// showColumns : true,
						clickToSelect : true,
						iconSize : 'outline',
						toolbar : '#exampleToolbar',
						pagination : true, // 设置为true会在底部显示分页条
						striped : true, // 设置为true会有隔行变色效果
						dataType : "json", // 服务器返回的数据类型
						pagination : true, // 设置为true会在底部显示分页条
						singleSelect : false, // 设置为true将禁止多选
						pageNumber : 1, // 如果设置了分布，首页页码
						pageSize : 10, // 如果设置了分页，每页数据条数
						pageList: [5,10, 50, 100, 500],  //记录数可选列表
						sortStable:true,
                        sortable: true,                     //是否启用排序
                        sortOrder: "asc",                   //排序方式
						showColumns : true, // 是否显示内容下拉框（选择显示的列）
						showRefresh:true,
                        showToggle: true,
                        search: false,
						showExport: true,                     //是否显示导出
						exportDataType: "all",              //basic', 'all', 'selected'.
                        exportTypes:['excel'],
                        exportOptions:{
                            ignoreColumn: [0],  //忽略某一列的索引
                            fileName: '报表',  //文件名称设置
                            worksheetName: 'sheet1',  //表格工作区名称
                            tableName: '报表'
                            //excelstyles: ['background-color', 'color', 'font-size', 'font-weight'],
                            //onMsoNumberFormat: DoOnMsoNumberFormat
                        },
						sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
						queryParams : function(params) {
							var formData = $('#formSearch').serializeObject();
							if(!formData){
								formData = {};
							}
							formData.limit = params.limit;
							formData.offset = params.offset;
							formData.sort = this.sortName;
							formData.order = this.sortOrder;
							return formData;
						}
						
						// //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
						// queryParamsType = 'limit' ,返回参数必须包含
						// limit, offset, search, sort, order 否则, 需要包含:
						// pageSize, pageNumber, searchText, sortName, sortOrder.
						// 返回false将会终止请求
                        
						// 设置为limit则会发送符合RESTFull格式的参数
						// queryParamsType : "limit",
						// 发送到服务器的数据编码类型
						// contentType : "application/x-www-form-urlencoded",
						//search : true, // 是否显示搜索框
						//showPaginationSwitch:true, //是否显示 分页控件
					});
}

/*格式化"操作"按钮列*/
function operateFormatter(value, row, index){
	var e = '<a class="btn btn-primary btn-sm '+s_edit_h+'" href="#" mce_href="#" title="编辑" onclick="edit(\''
		+ row.id
		+ '\' , '+ index +')"><i class="fa fa-edit"></i></a> ';
	var d = '<a class="btn btn-warning btn-sm '+s_remove_h+'" href="#" title="删除"  mce_href="#" onclick="remove(\''
		+ row.id
		+ '\')"><i class="fa fa-remove"></i></a> ';
    /**	var f = '<a class="btn btn-success btn-sm" href="#" title="备用"  mce_href="#" onclick="resetPwd(\''
		+ row.id
		+ '\')"><i class="fa fa-key"></i></a> ';*/
	// var e = "";
	// if(s_edit_h !="hidden"){
	// 	e = createTableEditHtml();
	// }
	// var d = "";
	// if(s_remove_h !="hidden"){
	// 	d = createTableDelHtml();
	// }
	return e + d ;
}

//操作列事件
var operateEvent={
            	   'click .check': function (e, value, row, index) {
            		   edit(row, 'check');
                   },
            	   'click .edit': function (e, value, row, index) {
            		   edit(row, 'edit');
                   },
                   'click .remove': function (e, value, row, index) {
                	   remove(row.id);
                   }
               };

function reLoad() {
	$('#dataTable').bootstrapTable('refresh');
}
function add() {
	layer.open({
		type : 2,
		title : '增加',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/add' // iframe的url
	});
}
function edit(row, type) {
	/*var row = $('#dataTable').bootstrapTable('getData')[index];*/
	if(!row || !row.id){
		alertMsg("请选择一条记录!");
		return;
	}
	setPageValue(JSON.stringify(row));
	
	layer.open({
		type : 2,
		title : '编辑',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/edit/' + row.id // iframe的url
	});
}
function remove(id) {
	alertConfirm('确定要删除选中的记录？', 
	  function() {
		$.ajax({
			url : prefix+"/remove",
			type : "post",
			data : {
				'id' : id
			},
			success : function(r) {
				if (r.code==0) {
					alertMsg(r.msg);
					reLoad();
				}else{
					alertMsg(r.msg);
				}
			}
		});
	})
}
//备用方法
function resetPwd(id) {
}
function batchRemove() {
	var rows = $('#dataTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
		alertMsg("请选择要删除的数据");
		return;
	}
	alertConfirm("确认要删除选中的'" + rows.length + "'条数据吗?",
	  function() {
		var ids = new Array();
		// 遍历所有选择的行数据，取每条数据对应的ID
		$.each(rows, function(i, row) {
			ids[i] = row['id'];
		});
		$.ajax({
			type : 'POST',
			data : {
				"ids" : ids
			},
			url : prefix + '/batchRemove',
			success : function(r) {
				if (r.code == 0) {
					alertMsg(r.msg);
					reLoad();
				} else {
					alertMsg(r.msg);
				}
			}
		});
	});
}

//重置输入框
function reSet(){
	cleardata("formSearch");
	reLoad();  
}