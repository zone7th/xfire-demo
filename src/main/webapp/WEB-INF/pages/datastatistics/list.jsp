<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<!--  数据统计 日历 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/lib/fullcalendar-3.0.0/lib/cupertino/jquery-ui.min.css" />
<link
	href="<%=request.getContextPath()%>/resources/lib/fullcalendar-3.0.0/fullcalendar/fullcalendar.css"
	rel='stylesheet' />
<link
	href="<%=request.getContextPath()%>/resources/lib/fullcalendar-3.0.0/fullcalendar/fullcalendar.print.css"
	rel='stylesheet' media='print' />

<!--  数据统计 日历 -->
<script
	src="<%=request.getContextPath()%>/resources/lib/fullcalendar-3.0.0/lib/moment.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/lib/fullcalendar-3.0.0/lib/jquery-2.0.0.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/lib/fullcalendar-3.0.0/fullcalendar/fullcalendar.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/lib/fullcalendar-3.0.0/locale/zh-cn.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/datastatistics/list.js"></script>


<div class="content-inner">

	<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath()%>/home">数据统计</a>
		<li class="active">版本日历</li>
	</ul>

	<div class="container-fluid">

		<!-- <div class="block"> -->
			<!-- <p class="block-heading">版本日历</p> -->

			<div class="block-body block-body-calendar">
				<div class="calendar" id='calendar'></div>
			</div>

		<!-- </div> -->
	</div>
</div>
<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>