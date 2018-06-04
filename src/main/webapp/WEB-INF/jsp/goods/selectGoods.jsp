<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>计价管理</title>
<%@include file="../common/include/title.jsp"%>
</head>
<style>
.grid-row-selected {
	background-color: #f5f5f5;
}
</style>
<body>
	<div class="container-fluid">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="panel-title">
							<span class="h3">选择商品</span>
						</h1>
					</div>
					<div class="panel-body">
						<div class="row clearfix" style="margin-top: 10px;">
							<div class="col-md-4 column">
								<div class="col-md-4 column">
									<label class="control-label">商品名称</label>
								</div>
								<div class="col-md-6 column">
									<input type="text" id="inputText" name="inputText"
										class="form-control selectpicker selectpicker"
										style="width: 100%" placeholder="商品名称" />
								</div>
							</div>
						</div>
						<div class="row clearfix text-center" style="margin-top: 10px;">
							<button id="searchtBtn" type="button" class="btn btn-primary ">
								<span class="glyphicon glyphicon-search"></span> 查询
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row clearfix">
        <div class="col-md-12 column">
            <div class="panel panel-success">
                <div class="panel-body">
                    <table  class="table text-nowrap" id="tableBody" >
                    </table>
                </div>
            </div>
        </div>
    </div>
	</div>
	<%@include file="../common/include/footer.jsp"%>
	<script src="${ctx }/public/js/goods/selectGoods.js"></script>
</body>
</html>