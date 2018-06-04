<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath }" var="ctx" />
<script type="text/javascript">
	var path = "${ctx}";
</script>
<link rel="stylesheet" href="${ctx }/public/js/libs/bootstrap-3.2.5/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx }/public/js/libs/bootstrap/css/bootstrap-table.min.css">
<link rel="stylesheet" href="${ctx }/public/js/libs/bootstrap/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${ctx }/public/js/libs/bootstrap/bootstrap-select/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${ctx }/public/js/libs/bootstrap/css/bootstrap-multiselect.css">
<link rel="stylesheet" href="${ctx }/public/js/libs/layer/css/layer.css">