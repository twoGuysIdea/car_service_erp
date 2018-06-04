//bootstrap-table
var changeQuery = 2;
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
      			pageSize = $('#tableBody').bootstrapTable('getOptions').totalRows;//每一页的数据行数，默认是上面设置的10(pageSize)
      	        pageNumber = 1;
      		}
            return {
                pageSize : pageSize, //每一页的数据行数，默认是上面设置的5(pageSize)
                pageNumber : pageNumber, //当前页面,默认是上面设置的1(pageNumber)
                changeQuery : changeQuery
            }
        },
        exportDataType:'all',
        showExport: true,  //是否显示导出按钮
        buttonsAlign:'right',  //按钮位置
        exportTypes:['excel'],  //导出文件类型
        Icons:'glyphicon-export',
        exportOptions:{
            ignoreColumn: [],//忽略操作
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
            field: "auditDate",
            title: "保险时间"
        }, {
            field: "birthday",
            title: "生日"
        }]
    });
}

function changeQueryStr(obj){
	changeQuery = obj;
	$('#tableBody').BootTableRefresh();
}

$(document).ready(function() {
    //初始化表格
    buildTable();
});