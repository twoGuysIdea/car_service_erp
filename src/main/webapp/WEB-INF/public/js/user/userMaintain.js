function showModal(id){
	getGoodsList("#goodsId",null,goodsId);
	$('#id').val("");
	$('#maintainDate').val("");
	$('#goodsId').val("");
	$('#myModal').modal('show');
}

function getGoodsList(selector, callback, val) {
	$(selector).find('option').remove();
	$(selector).append('<option value="">请选择</option>');
    var url = path + "/goods/loadGoodsByCategory?goodsCategory=机油";
    ajaxWrap({
        url: url,
        success: function (data) {
            if (data.status) {
                if ($.isFunction(callback)) {
                    callback(data);
                } else {
                	if (data.rows && data.rows.length > 0) {
                        var objects = data.rows;
                        var arr = [];
                        var $option = $("<option></option>");
                        $.each(objects, function (i, obj) {
                            var temp = $($option).val(obj.id).text(obj.goodsName);
                            arr.push(temp.prop("outerHTML"));
                        });
                        $(selector).append(arr.join(" "));
                        if (val) {
                            $(selector).selectpicker('val', val);
                        }
                        $(selector).selectpicker('refresh');
                    }
                }
            }
        }
    })
}

//初始化年月日、日期 控件
$(".form_datetime").datetimepicker({
    format: "yyyy-mm-dd",
    autoclose: true,
    clearBtn: true,
    todayBtn: true,
    todayHighlight: true,
    showMeridian: true,
    pickerPosition: "bottom-right",
    language: 'zh-CN',//中文，需要引用zh-CN.js包
    startView: 2,//月视图
    minView: 2,//日期时间选择器所能够提供的最精确的时间选择视图
    showMeridian: 1
})

//删除
function remove(id) {
    layer.confirm('确定要删除该条数据吗？', {
        btn: ['确定','取消'] //按钮
    }, function(){
        var url = path+ "/user/deleteMaintain?masterId="+$('#masterId').val()+"&id="+id;
        $.ajax({
            type: "get",
            url:url,
            async: false,
            dataType:"json",
            success: function(res) {
                if (res.status === true) {
                    layer.msg("操作成功", {icon: 1});
                    refreshDelay();
                } else {
                    layer.alert(res.msg);
                }
            }
        });
    }, function(){

    });
}

function validata(){
	var tip = "";
	if($('#maintainDate').val() == ''){
		tip += "保养日期不能为空!</br>"
	}
	if($('#goodsId').val() == ''){
		tip += "保养机油不能为空!</br>"
	}
	if(tip == ""){
		return true;
	}else{
		myLayer.msgErrorDef(tip);
		return false;
	}
}

function formSubmit(){
	if(validata()){
		var params = {
			masterId : $("#masterId").val(),
			maintainDate : $('#maintainDate').val(),
			goodsId : $('#goodsId').val()
		};
		var url = path + "/user/addMaintain";
		$.ajax({
	        type: "POST",
	        url:url,
	        async: false,
	        data : params,
	        dataType:"json",
	        success: function(res) {
	            if (res.status === true) {
	                layer.msg("操作成功", {icon: 1});
	                refreshDelay();
	            } else {
	                layer.alert(res.msg);
	            }
	        }
	    });
	}
}

//bootstrap-table
function buildTable(){
    var  url = path + "/user/getMaintainList"; // 请求的网址
    //先销毁表格
    $('#tableBody').BootTableInit({
        //在服务端直接通过 @RequestParam参数映射是获取不到的。
        contentType: "application/x-www-form-urlencoded",
        url: url,  //服务器数据的加载地址
        method: 'post',   //服务器数据的请求方式 'get' or 'post'
        queryParams:function (params){
            var pageSize;
            var pageNumber;
            if(params.pageSize){
      			pageSize = params.pageSize;
      			pageNumber = params.pageNumber;
      		}else{
      			pageSize = 1000000;//每一页的数据行数，默认是上面设置的10(pageSize)
      	        pageNumber = 1;
      		}
            return {
                pageSize : pageSize, //每一页的数据行数，默认是上面设置的5(pageSize)
                pageNumber : pageNumber, //当前页面,默认是上面设置的1(pageNumber)
                masterId : $("#masterId").val()
            }
        },
        exportDataType:'all',
        showExport: true,  //是否显示导出按钮
        buttonsAlign:"right",  //按钮位置
        exportTypes:['excel'],  //导出文件类型
        Icons:'glyphicon-export',
        exportOptions:{
            ignoreColumn: [0],//忽略操作
            fileName: '保养信息',  //文件名称设置
            worksheetName: 'sheet1',  //表格工作区名称
            tableName: '保养信息',
            excelstyles: ['background-color', 'color', 'font-size', 'font-weight'],
            onMsoNumberFormat: function (cell, row, col) {
                var result = "";
                if (row > 0 && col == 0)
                    result = "\\@";
                return result;
            }
        },
        columns: [{
            field: "", 
            title: "操作",
            formatter:function(value,row,index){
            	if(index == 0){
            		return '&nbsp;<button type="button" onclick="remove('+row.id+');" class="btn btn-default">删除</button>';
            	}else{
            		return "";
            	}
            }
        }, {
            field: "userName",
            title: "车主"
        }, {
            field: "carNum",
            title: "车牌号"
        },  {
            field: "maintainDate",
            title: "保养时间"
        }, {
            field: "goodsName",
            title: "保养机油"
        }]
    });
}

function goBackUserIndex(){
	window.location.href = path + "/user/index"
}

$(document).ready(function() {
	
    //初始化表格
    buildTable();

    $("#searchtBtn").click(function(){
    	$('#tableBody').BootTableRefresh();
    });
    
    //刷新按钮
    $("#refresh").click(function(){
        window.location.reload();
    });
});