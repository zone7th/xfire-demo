<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/lib/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/main.css">
<!-- 日期插件 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
<!-- 弹出框组件 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap3-dialog/css/bootstrap-dialog.min.css">



<link rel="shortcut icon"  type="text/css" href="<%=request.getContextPath()%>/resources/lib/font-awesome/docs/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/bootstrap/js/bootstrap.js"></script>
<!-- 日期插件 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/bootstrap-datetimepicker/moment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<!-- Jquery 表单验证 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/jquery-validate/jquery-form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/jquery-validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/jquery-validate/custom-validate.js"></script>
<!-- 弹出框组件 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/bootstrap3-dialog/js/bootstrap-dialog.min.js"></script>
<!-- 公共数据组件。-->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/commonData.js"></script>
<!-- 公共JS组件。-->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/lib/common.js"></script>


<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="<%=request.getContextPath() %>/resources/lib/html5.js"></script>
<![endif]-->

<!--  todo 这些图片是否需要？
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
-->

<script>
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
</script>






