//全局变量存放编辑当前的data对象
var dataInfo;

var isNum = /^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;
//弹出模态框  如果传了ID弹出编辑模态框  没有传则弹出添加
function showModal(id){
	if(!id){
		$('#id').val('');
		$('#saveGoodsName').val('');
        $('#savePrice').val('');
        $('#goodsCategory').val('');
	}else{
		var url = path+ "/goods/getOne?id="+id;
        $.ajax({
            type: "POST",
            url:url,
            async: false,
            dataType:"json",
            success: function(data) {
                if (data.status === true) {
                	dataInfo = data.object;
                	$('#id').val(dataInfo.id);
                	$('#saveGoodsName').val(dataInfo.goodsName);
                    $('#savePrice').val(dataInfo.price);
                    $('#goodsCategory').val(dataInfo.goodsCategory);
                } else {
                    layer.alert(data.msg);
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
    minView: 2//日期时间选择器所能够提供的最精确的时间选择视图
});

//删除
function remove(id) {
    layer.confirm('确定要删除该条数据吗？', {
        btn: ['确定','取消'] //按钮
    }, function(){
        var url = path+ "/goods/delete?id="+id;
        $.ajax({
            type: "POST",
            url:url,
            async: false,
            dataType:"json",
            success: function(res) {
                if (res.status === true) {
                    layer.msg("删除成功", {icon: 1});
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
	if($('#saveGoodsName').val() == ''){
		tip += "商品名称不能为空!</br>"
	}
	if($('#savePrice').val() == ''){
		tip += "商品价格不能为空!</br>"
	}else if(!isNum.test($('#savePrice').val())){
		tip += "商品价格只能为数字!</br>"
	}
	if($('#goodsCategory').val() == ''){
		tip += "商品分类不能为空!</br>";
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
			goodsName : $('#saveGoodsName').val(),
			price : $('#savePrice').val(),
			goodsCategory : $('#goodsCategory').val()
		};
		var url = path;
		if($('#id').val() != ""){
			url += '/goods/update';
		}else{
			url += '/goods/save';
		}
		$.ajax({
	        type: "POST",
	        url:url,
	        async: false,
	        data : params,
	        dataType:"json",
	        success: function(res) {
	            if (res.status === true) {
	            	layer.msg("保存成功", {icon: 1});
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
    var  url = path + "/goods/getList"; // 请求的网址
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
      			pageSize = $('#tableBody').bootstrapTable('getOptions').totalRows;//每一页的数据行数，默认是上面设置的10(pageSize)
      	        pageNumber = 1;
      		}
            return {
                pageSize : pageSize, //每一页的数据行数，默认是上面设置的5(pageSize)
                pageNumber : pageNumber, //当前页面,默认是上面设置的1(pageNumber)
                queryStr : $('#inputText').val()
            }
        },
        exportDataType:'all',
        showExport: true,  //是否显示导出按钮
        buttonsAlign:"right",  //按钮位置
        exportTypes:['excel'],  //导出文件类型
        Icons:'glyphicon-export',
        exportOptions:{
            ignoreColumn: [0],//忽略操作
            fileName: '商品信息',  //文件名称设置
            worksheetName: 'sheet1',  //表格工作区名称
            tableName: '商品信息',
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
            	var btn = '<button type="button" onclick="showModal('+row.id+');" class="btn btn-default">编辑</button>';
            	btn += '&nbsp;<button type="button" onclick="remove('+row.id+');" class="btn btn-default">删除</button>';
			    return btn;
            }
        }, {
            field: "goodsName",
            title: "商品"
        }, {
            field: "price",
            title: "商品价格"
        }, {
            field: "goodsCategory",
            title: "商品分类"
        },{
            field: "createDate",
            title: "创建时间"
        }]
    });
}

$(document).ready(function() {
	
    //初始化表格
    buildTable();

    $("#searchtBtn").click(function(){
    	$('#tableBody').BootTableSelectRefresh();
    });

    //刷新按钮
    $("#refresh").click(function(){
        window.location.reload();
    });
    
    //重置
    $("#resetForm").bind("click", function() {
    	if($('#id').val() != ''){
        	$('#saveGoodsName').val(dataInfo.goodsName);
            $('#savePrice').val(dataInfo.price);
            $('#goodsCategory').val(dataInfo.goodsCategory);
    	}else{
    		$('#saveGoodsName').val('');
            $('#savePrice').val('');
            $('#goodsCategory').val('');
    	}
    });
});