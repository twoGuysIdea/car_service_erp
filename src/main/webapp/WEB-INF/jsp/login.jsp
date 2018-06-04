<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>哆集ERP</title>
<%@include file="common/include/title.jsp"%>
<link rel="stylesheet" href="${ctx }/public/css/sys/login.css">
</head>
<body>
	<div class="container">
		<div class="login-wrapper">
			<div class="login-screen">
				<div class="well">
					<div class="login-form">
						<img id="profile-img" class="profile-img-card" src="https://cdn.hlhdj.cn/default/logo/96.png" />
						<p id="profile-name" class="profile-name-card">哆集ERP系统</p>

						<form action="data/login.json" method="post" id="login-form">
							<div id="errtips" class="hide"></div>
							<input type="hidden" name="__token__" value="68041f02fc8315b7ccdfaeb0e189a743" />
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								</div>
								<input type="text" class="form-control" id="pd-form-username" placeholder="用户名" name="username" autocomplete="off" value=""
									data-rule="用户名:required;username" />
							</div>

							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
								</div>
								<input type="password" class="form-control" id="pd-form-password" placeholder="密码" name="password" autocomplete="off" value=""
									data-rule="密码:required;password" />
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-lg btn-block">登 录</button>
							</div>
						</form>
					</div>
				</div>
				<p class="copyright">
					<a href="#">Powered By DuoJi</a>
				</p>
			</div>
		</div>
	</div>
	<%@include file="common/include/footer.jsp"%>
	<%-- <script src="${ctx }/public/js/sys/dictionary/index.js"></script> --%>
</body>
</html>