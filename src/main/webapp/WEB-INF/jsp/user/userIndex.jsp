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
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="panel-title">
							<span class="h3">车主信息</span> <span class="pull-right">
								<button type="button" class="btn btn-primary"
									onclick="showModal()">添加车主</button>
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
											<button id="searchtBtn" type="button" class="btn btn-primary ">
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
	<!-- 添加的模态框（Modal） -->
	<!-- 编辑模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog" style="position: initial;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<div class="panel panel-default">
						<div class="panel-body">
							<form role="form" id="myform" method="post"
								class="form-horizontal" novalidate="novalidate">
								<input type="hidden" name="id" id="id">
								<div class="form-group">
									<label class="col-sm-4 control-label">车主姓名:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control selectpicker"
											id="userName" name="userName" id="no" placeholder="请输入用户姓名">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">车牌号:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control selectpicker"
											id="saveCarNum" name="saveCarNum" placeholder="请输入车牌号">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">手机号:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control selectpicker"
											id="phone" name="phone" placeholder="请输入手机号">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">生日:</label>
									<div class="col-sm-7">
										<input type="text" class="form_datetime form-control"
											name="birthday" id="birthday" placeholder="请选择时间">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">购车时间:</label>
									<div class="col-sm-7">
										<input type="text" class="form_datetime form-control"
											name="buyDate" id="buyDate" placeholder="请选择时间">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">是否购保:</label>
									<div class="col-sm-7">
										<select class="form-control selectpicker" name="isAudit"
											id="isAudit">
											<option value="">请选择</option>
											<option value="1">否</option>
											<option value="2">是</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">购保时间:</label>
									<div class="col-sm-7">
										<input type="text" class="form_datetime form-control"
											name="auditDate" id="auditDate" placeholder="请选择时间">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 col-sm-offset-8">
										<button type="button" onclick="formSubmit();"
											class="btn btn-primary">保存</button>
										<button id="resetForm" type="button" class="btn btn-danger">重置</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<!-- /.modal -->
	</div>
	<%@include file="../common/include/footer.jsp"%>
	<script src="${ctx }/public/js/user/userIndex.js"></script>
</body>
</html>