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
	                        <button type="button" class="btn btn-primary" onclick="showModal()">添加商品</button>
	                        <button type="button" class="btn btn-primary" id="refresh"><span class="glyphicon glyphicon-refresh"></span> 刷新</button>
                        </span>
                    </h1>
                </div>
                <div class="panel-body">
                    <div class="row clearfix" style="margin-top: 10px;">
						<div class="col-md-4 column">
							<div class="col-md-4 column">
								<label class="control-label">商品名称</label>
							</div>
							<div class="col-md-6 column">
								<input type="text" id="inputText" name="inputText" class="form-control selectpicker selectpicker" style="width:100%" placeholder="商品名称"/>
							</div>
						</div>
                    </div>
                    <div class="row clearfix text-center" style="margin-top: 10px;">
                        <button id="searchtBtn" type="button" class="btn btn-primary "><span class="glyphicon glyphicon-search"></span> 查询</button>
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
<!-- 添加的模态框（Modal） -->
<!-- 编辑模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" style="position: initial;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form role="form" id="myform" method="post" class="form-horizontal" novalidate="novalidate">
                            <input type="hidden" name="id" id="id">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">商品名称:</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control selectpicker" id="saveGoodsName" name="saveGoodsName" placeholder="请输入商品名称"  >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">商品价格:</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control selectpicker" id="savePrice" name="savePrice" placeholder="请输入商品价格"  >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">商品分类:</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control selectpicker" id="goodsCategory" name="goodsCategory" placeholder="请输入商品分类"  >
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-8">
                                    <button type="button" onclick="formSubmit();" class="btn btn-primary" >保存</button>
                                    <button id="resetForm" type="button" class="btn btn-danger" >重置</button>
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
<script src="${ctx }/public/js/goods/goodsIndex.js"></script>
</body>
</html>