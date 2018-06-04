//全局变量存放编辑当前的data对象
var dataInfo;
//弹出模态框  如果传了ID弹出编辑模态框  没有传则弹出添加
var isCarNum = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
var isPhone = /^1[3|4|5|8][0-9]\d{4,8}$/;
function showModal(id){
	if(!id){
		$('#id').val("");
		$('#userName').val("");
		$('#saveCarNum').val("");
		$('#phone').val("");
		$('#birthday').val("");
		$('#buyDate').val("");
        $('#safeDate').val("");
        $('#auditDate').val("");
        $('#isAudit').selectpicker('val', "");
	}else{
		var url = path+ "/user/loadUserById?id="+id;
        $.ajax({
            type: "get",
            url:url,
            async: false,
            dataType:"json",
            success: function(data) {
                if (data.status === true) {
                	dataInfo = data.object;
                	$('#id').val(dataInfo.id);
                	$('#userName').val(dataInfo.userName);
            		$('#saveCarNum').val(dataInfo.carNum);
            		$('#phone').val(dataInfo.phone);
            		$('#birthday').val(dataInfo.birthday);
            		$('#buyDate').val(dataInfo.buyDate);
            		$('#safeDate').val(dataInfo.safeDate);
            		$('#auditDate').val(dataInfo.auditDate);
            		$('#isAudit').selectpicker('val',dataInfo.isAudit);
                } else {
                    layer.alert(res.msg);
                }
            }
        });
	}
	$('#myModal').modal('show');
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
        var url = path+ "/user/delete?id="+id;
        $.ajax({
            type: "POST",
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

function addAudit(id) {
    var url = path+ "/user/addAudit?id="+id;
    $.ajax({
        type: "POST",
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
}

function validata(){
	var tip = "";
	if($('#userName').val() == ''){
		tip += "车主姓名不能为空!</br>"
	}
	if($('#saveCarNum').val() == ''){
		tip += "车牌号不能为空!</br>"
	}else if(!isCarNum.test($('#saveCarNum').val())){
		tip += "车牌号格式不正确!</br>"
	}
	if($('#phone').val() == ''){
		tip += "手机号码不能为空!</br>"
	}else if(!isPhone.test($('#phone').val())){
		tip += "请输入正确的手机号码!</br>"
	}
	if($('#buyDate').val() == ''){
		tip += "购车时间不能为空!</br>"
	}
	if($('#isAudit').val() == ''){
		tip += "是否购保必选!</br>"
	}
	if($('#isAudit').val() == 2){
		if($('#auditDate').val() == ''){
			tip += "购保时间不能为空!</br>"
		}
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
			id : $('#id').val(),
			userName : $('#userName').val(),
			carNum : $('#saveCarNum').val(),
			phone : $('#phone').val(),
			birthday : $('#birthday').val(),
			buyDate : $('#buyDate').val(),
			safeDate : $('#safeDate').val(),
			auditDate : $('#auditDate').val(),
			isAudit : $('#isAudit').val()
		};
		var url = path;
		if($('#id').val() !== ''){
			url += '/user/update';
		}else{
			url += '/user/save';
		}
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

//获取当前时期年月日时分秒
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    return currentdate;
}


//bootstrap-table
function buildTable(){
    var  url = path + "/user/getList"; // 请求的网址
    //先销毁表格
    $('#tableBody').BootTableInit({
        //在服务端直接通过 @RequestParam参数映射是获取不到的。
        contentType: "application/x-www-form-urlencoded",
        url: url,  //服务器数据的加载地址
        method: 'post',   //服务器数据的请求方式 'get' or 'post'
        queryParams:function (params){
            var pageSize;
            var pageNumber;
            console.log();
            if(params.pageSize){
      			pageSize = params.pageSize;
      			pageNumber = params.pageNumber;
      		}else{
      			pageSize = $('#tableBody').bootstrapTable('getOptions').totalRows;//每一页的数据行数，默认是上面设置的10(pageSize)
      	        pageNumber = 1;
      		}
            return {
                pageSize : pageSize, //每一页的数据行数，默认是上面设置的5(pageSize)
                pageNumber : pageNumber, //当前页面,默认是上面设置的1(pageNumber)
                ownerName : $('#ownerName').val(),
                carNum : $('#carNum').val()
            }
        },
        exportDataType:'all',
        showExport: true,  //是否显示导出按钮
        buttonsAlign:'right',  //按钮位置
        exportTypes:['excel'],  //导出文件类型
        Icons:'glyphicon-export',
        exportOptions:{
            ignoreColumn: [0],//忽略操作
            fileName: '车主信息',  //文件名称设置
            worksheetName: 'sheet1',  //表格工作区名称
            tableName: '车主信息',
            excelstyles: ['background-color', 'color', 'font-size', 'font-weight'],
            onMsoNumberFormat: function (cell, row, col) {
                var result = "";
                if (row > 0 && col === 0)
                    result = "\\@";
                return result;
            }
        },
        columns: [{
            field: "", 
            title: "操作",
            formatter:function(value,row,index){
            	var btn = '<button type="button" onclick="showModal('+row.id+');" class="btn btn-default">编辑</button>';
            	btn += '&nbsp;<button type="button" onclick="remove('+row.id+');" class="btn btn-default">删除</button>';
            	if(row.isAudit === 1){
            		btn += '&nbsp;<button type="button" onclick="addAudit('+row.id+');" class="btn btn-default">添加保险</button>';
            	}
			    return btn;
            }
        }, {
            field: "userName",
            title: "车主"
        }, {
            field: "carNum",
            title: "车牌号"
        }, {
            field: "phone",
            title: "手机号码"
        }, {
            field: "safeDate",
            title: "年审时间"
        }, {
            field: "isAudit",
            title: "是否购保",
            formatter:function(value,row,index){
			    return value == 1?"否":"是";
            }
        }, {
            field: "auditDate",
            title: "保险时间"
        }, {
            field: "maintainDate",
            title: "保养时间"
        }, {
            field: "buyDate",
            title: "购车时间"
        }, {
            field: "maintainCount",
            title: "保养次数",
            formatter:function(value,row,index){
			    return "<a href='"+path+"/user/auditDetail?id="+row.id+"'>"+value+"</a>";
            }
        },{
            field: "birthday",
            title: "生日"
        }]
    });
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

    //重置
    $("#resetForm").bind("click", function() {
    	if($('#id').val != ''){
        	$('#userName').val(dataInfo.userName);
    		$('#saveCarNum').val(dataInfo.carNum);
    		$('#phone').val(dataInfo.phone);
    		$('#birthday').val(dataInfo.birthday);
    		$('#buyDate').val(dataInfo.buyDate);
    		$('#safeDate').val(dataInfo.safeDate);
    		$('#auditDate').val(dataInfo.auditDate);
    		$('#isAudit').selectpicker('val',dataInfo.isAudit);
    	}else{
    		$('#userName').val("");
    		$('#saveCarNum').val("");
    		$('#phone').val("");
    		$('#birthday').val("");
    		$('#buyDate').val("");
            $('#safeDate').val("");
            $('#auditDate').val("");
            $('#isAudit').selectpicker('val', "");
    	}
    });
});