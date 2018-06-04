<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汽修管理</title>
<%@include file="../common/include/title.jsp"%>
</head>
<body>
	<div class="container-fluid">
			<div class="col-md-12 column">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="panel-title">
							<span class="h3">车主信息</span> <span class="pull-right">
								<button type="button" class="btn btn-primary" id="refresh">
									<span class="glyphicon glyphicon-refresh"></span> 刷新
								</button>
							</span>
						</h1>
					</div>
					<div class="panel-body">
						<div class="container-fluid">
							<div class="row clearfix">
								<div class="col-md-12 column">
									<form class="form-inline" id="selectForm">
										<div class="row clearfix" style="margin-top: 10px;">
											<div class="col-md-4 column">
												<div class="col-md-4 column">
													<label class="control-label">车主姓名</label>
												</div>
												<div class="col-md-8 column">
													<input type="text" id="ownerName" name="ownerName"
														class="form-control selectpicker" style="width: 100%"
														placeholder="车主姓名" />
												</div>
											</div>
											<div class="col-md-4 column">
												<div class="col-md-4 column">
													<label class="control-label">车牌号</label>
												</div>
												<div class="col-md-8 column">
													<input type="text" id="carNum" name="carNum"
														class="form-control selectpicker" style="width: 100%"
														placeholder="车牌号" />
												</div>
											</div>
										</div>
										<div class="row clearfix text-center" style="margin-top: 10px">
											<button id="searchtBtn" type="button"
												class="btn btn-primary ">
												<span class="glyphicon glyphicon-search"></span> 查询
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="panel panel-success">
						<div class="panel-body">
							<table class="table text-nowrap" id="tableBody">
							</table>
						</div>
					</div>
				</div>
			</div>
	</div>
	<%@include file="../common/include/footer.jsp"%>
	<script type="text/javascript">
	//bootstrap-table
	function buildTable(){
	    var  url = path + "/user/getList"; // 请求的网址
	    $('#tableBody').BootTableInit({
	        //在服务端直接通过 @RequestParam参数映射是获取不到的。
	        contentType: "application/x-www-form-urlencoded",
	        url: url,  //服务器数据的加载地址
	        method: 'post',   //服务器数据的请求方式 'get' or 'post'
	        queryParams:function (params){
	            return {
	                pageSize : params.pageSize, //每一页的数据行数，默认是上面设置的5(pageSize)
	                pageNumber : params.pageNumber, //当前页面,默认是上面设置的1(pageNumber)
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
	        }],
	    });
	}

	function getSelect(){
		return $('#tableBody').bootstrapTable('getSelections');
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
	</script>
</body>
</html>