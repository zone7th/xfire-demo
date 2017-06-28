<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<link rel="Shortcut Icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
<script src="<%=request.getContextPath()%>/resources/js/logfile/list.js"></script>
</head>
	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">应用日志管理</a>
			<li class="active">
				<c:if test="${env == 'uat'}">UAT应用日志列表</c:if>
				<c:if test="${env == 'preprod'}">预生产应用日志列表</c:if>
				<c:if test="${env == 'gray'}">灰度应用日志列表</c:if>
				<c:if test="${env == 'prod'}">生产应用日志列表</c:if>
			</li>
		</ul>

		<div class="container-fluid">
			<div class="block">
				<p class="block-heading">
					<c:if test="${env == 'uat'}">UAT应用日志列表</c:if>
					<c:if test="${env == 'preprod'}">预生产应用日志列表</c:if>
					<c:if test="${env == 'gray'}">灰度应用日志列表</c:if>
					<c:if test="${env == 'prod'}">生产应用日志列表</c:if>
				</p>
				<div class="block-body">
					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/role/list" method="post">

					<div class="row form-group">
						<div class="col-md-offset-2 col-md-3">
							<label class="control-label ">应用名称：<span><a>${server.sysName}</a></span></label>
						</div>
						<div class="col-md-3">
							<label class="control-label ">IP：<span><a>${server.ip}</a></span></label>
						</div>
						<div class="col-md-3">
							<label class="control-label ">端口：<span><a>${server.port}</a></span></label>
						</div>

						<div class="col-md-1 add-and-btn"> 
							<a href="<%=request.getContextPath()%>/${choiceView}/${env}/list" class="btn btn-default pull-right my-back">返回</a>
						</div>
					</div>
				</form>
				</div>
			</div>
			
			<input  id="controlSize" type="hidden" value="${controlSize}">

			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>序号</th>
						<th>日志名称</th>
						<th>时间</th>
						<th>大小</th>
						<th>日志操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${datas}" var="log" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>${log.name}</td>
							<td>${log.date}</td>
							<td>${log.size}</td>
							<td><a
								href="#" class="general"  id="${log.size }" data-value="${log.name}">下载</a>
								<a href="#" id="${log.size }" class="modala" data-value="${log.name}">自定义下载</a>
								<a href="#" onclick="getrealtimelog('${server.id}','${log.name}');"  data-value="${log.name}">实时日志</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		<div class="row">
			<div class="col-md-12 col-sm-12 add-and-btn">
				<a href="<%=request.getContextPath()%>/${choiceView}/${env}/list"
					class="btn btn-default pull-right">返回</a>
			</div>
		</div>

	</div>
	</div>
	<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>

<!-- 隐藏表单 -->
<form style="display:none" id="loadCondition" method="get" target="_blank">
	<!-- 连接属性 -->
	<input type="hidden" id="serverId" name="serverId" value="${server.id}">
<%-- 	<input type="hidden" id="ip" name="ip" value="${server.ip}">
	<input type="hidden" id="sysName" name="sysName" value="${server.sysName}">
	<input type="hidden" id="userName" name="userName" value="${server.userName}">
	<input type="hidden" id="passwd" name="passwd" value="${server.passwd}">
	<input type="hidden" id="logPath" name="logPath" value="${server.logPath}"> --%>
	
	<!-- 下载属性 点击相应下载时赋值 -->
	<input type="hidden" id="mode" name="mode">
	<input type="hidden" id="logName" name="logName">
	<input type="hidden" id="keyWord" name="keyWord">
	<input type="hidden" id="startTime" name="startTime">
	<input type="hidden" id="endTime" name="endTime">
	<input type="hidden" id="env" name="env" value="${env}" >
	<input type="hidden" id="choiceView" name="choiceView" value="${choiceView}" >
</form>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 666px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">自定义日志下载</h4>
			</div>

			<div class="modal-body">
				<form class="form-horizontal">
					<div class="row form-group">
						<label class="col-md-2  col-sm-1 control-label ">日志名称：</label>
						<div class="col-md-4 col-sm-3">
							<input class="form-control not-click" readonly id="logNameRead" title="">
						</div>
					</div>

					<div class="row form-group">
						<label class="col-md-2  col-sm-1 control-label ">关键字：</label>
						<div class="col-md-4 col-sm-3">
							<input class="form-control " id="keyWordRead" placeholder="请输入关键字,如：INFO"/>
						</div>
						<div class="col-md-offset-10">
							<div class="col-md-10 col-sm-5">
								<button type="button" class="form-control btn btn-default" id="keyLoad">下载</button>
							</div>
						</div>
					</div>

					<div class="row form-group">
						<label class="col-md-2  col-sm-1 control-label ">时间段：</label>
						<div class="col-md-4 col-sm-3">
							<input class="form-control " readonly id="startTimeRead"/>
						</div>
						<div><label class="middle-label">~</label></div>
						<div class="col-md-4 col-sm-3">
							<input class="form-control " readonly id="endTimeRead"/>
						</div>
						<div class="col-md-offset-2">
							<div class="col-md-2 col-sm-1">
								<button type="button" class="form-control btn btn-default" id="timeLoad">下载</button>
							</div>
						</div>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>


		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>

