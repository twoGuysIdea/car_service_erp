<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <h1 class="panel-title" >
                        <span class="h3">商品信息</span>
                        <span class="pull-right">
	                        <button type="button" class="btn btn-primary" onclick="showAddGoods()">添加商品</button>
	                        <button type="button" class="btn btn-primary" id="refresh"><span class="glyphicon glyphicon-refresh"></span> 刷新</button>
                        </span>
                    </h1>
                </div>
            </div>
        </div>
    </div>
    <button type="button" class="btn btn-primary" style="margin-bottom: 10px" onclick="selectUser()">选择车主</button>
    <span id = "user" hidden>当前车主为:<span id="userName"></span>&nbsp;&nbsp;车牌号为:<span id="carNum"></span><input type="hidden" id="userId"/></span>
    <input id="isAudit" type="hidden"/>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="panel panel-success">
                <div class="panel-body">
                    <table  class="table text-nowrap">
                    	<thead id="headTr">
                    		<tr>
						    	<th>商品名称</th>
						    	<th>商品价格</th>
						    	<th>商品数量</th>
						    </tr>
                    	</thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-5" style="text-align:center">
         <button type="button" class="btn btn-primary" onclick="valuation()">计价</button>
         <h3 id = "countMoney" style="color: red;"></h3>
    </div>
</div>
<%@include file="../common/include/footer.jsp"%>
<script src="${ctx }/public/js/valuation/valuationIndex.js"></script>
</body>
</html>