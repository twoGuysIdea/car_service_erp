<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>汽修管理</title>
	<%@include file="common/include/title.jsp"%>
</head>
<body>
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="panel panel-success">
				<div class="panel-body">
					<ul id="myTab" class="nav nav-tabs">
						<li><a href="#all" onclick="changeQueryStr(1);" data-toggle="tab">最近生日</a></li>
						<li class="active"><a href="#noOk" onclick="changeQueryStr(2);" data-toggle="tab">最近保险 </a></li>
						<li><a href="#noGoods" onclick="changeQueryStr(3);" data-toggle="tab">最近年审</a></li>
					</ul>
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
			</div>
		</div>
	</div>
</div>
<%@include file="common/include/footer.jsp"%>
<script src="${ctx }/public/js/main/main.js"></script>
</body>
</html>