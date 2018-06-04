//初始化
$(document).ready(function() {
	
	buildTable();
	
	//查询
	$("#searchBtn").click(function(){
		$("#tableBody").BootTableRefresh();
	});
	
	//刷新
	$("#resetBtn").click(function(){
		window.location.reload();
	});
	
});

//请求服务数据时所传参数


//初始化table
function buildTable() {
	$("#tableBody").BootTableInit({
        url: path + "/goods/getList",
        contentType: "application/x-www-form-urlencoded",
        columns : [{
            field: "goodsName",
            title: "商品"
        }, {
            field: "price",
            title: "商品价格"
        }, {
            field: "goodsCategory",
            title: "商品分类"
        }, {
			field : "count",
			title : "数量",
			formatter:function(value,row,index){
				var html = "<input type='text' name='count' data-price='"+row.price+"' data-goodsName='"+row.goodsName+"' class='form-control selectpicker'/>";
			    return html;
			}
		} ,{
            field: "createDate",
            title: "创建时间"
        }],
        queryParams: function(params) {
        	return {
        		pageSize : params.pageSize, //每一页的数据行数，默认是上面设置的5(pageSize)
        		pageNumber : params.pageNumber, //当前页面,默认是上面设置的1(pageNumber)
        		queryStr : $('#inputText').val()
        	}
        }
    });
}

//获取明细信息
function getDetail(){
	var skuArray = [];
	var count = $("input[name='count']");
	$.each(count, function (i, obj) {
		  var $tObj = $(obj);
		  if($tObj.val() != ""){
			  var map = {};
		      map["num"] =$(obj).val();
		      map["goodsName"] = $tObj.attr("data-goodsName");
		      map["price"] = $tObj.attr("data-price");
		      // 组装值
		      skuArray.push(map);
		  }
	});
    return skuArray;
}