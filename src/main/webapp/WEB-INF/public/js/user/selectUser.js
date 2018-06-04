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
                ownerName : $('#ownerName').val(),
                carNum : $('#carNum').val()
            }
        },
        singleSelect : true,  
        columns: [{
        	checkbox : true
        },{
            field: "userName",
            title: "车主"
        }, {
            field: "carNum",
            title: "车牌号"
        }, {
            field: "phone",
            title: "手机号码"
        }, {
            field: "isAudit",
            title: "是否购保",
            formatter:function(value,row,index){
			    return value == 1?"否":"是";
            }
        }]
    });
}

function getSelect(){
	$('#tableBody').bootstrapTable('getSelections');
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