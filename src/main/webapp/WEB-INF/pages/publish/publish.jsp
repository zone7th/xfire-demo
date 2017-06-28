<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/publish/publish.js"></script>

<div class="content-inner">

	<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath()%>/home">发布任务列表</a>
		<li class="active">
			<c:if test="${env == 'uat'}">UAT应用发布</c:if>
			<c:if test="${env == 'preprod'}">预生产应用发布</c:if>
			<c:if test="${env == 'gray'}">灰度应用发布</c:if>
			<c:if test="${env == 'prod'}">生产应用发布</c:if>
		</li>
	</ul>

	<div class="container-fluid">

		<div class="block">
			<p class="block-heading">
				<c:if test="${env == 'uat'}">UAT应用发布</c:if>
				<c:if test="${env == 'preprod'}">预生产应用发布</c:if>
				<c:if test="${env == 'gray'}">灰度应用发布</c:if>
				<c:if test="${env == 'prod'}">生产应用发布</c:if>
			</p>
			<div class="block-body">
				<form class="form-horizontal"
					action="<%=request.getContextPath()%>/role/list" method="post">
					<div class="row form-group">
						<div class="col-md-offset-1 col-md-4">
							<label class="control-label ">系统名称：<span><a>${task.sysName}</a></span></label>
							<input type="hidden" value="${task.sysName}" id="sysName" />
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-offset-1 col-md-4">
							<label class="control-label ">发布任务编号：<span><a>${task.taskNo}</a></span></label>
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-offset-1 col-md-4">
							<label class="control-label ">待发布版本：<span><a>${task.versionNo}</a></span></label>
						</div>
					</div>


					<div class="row form-group">
						<div class="col-md-9 col-md-offset-6 col-sm-offset-6">
							<div class="col-md-2 col-sm-2">
								<button type="button" onclick="operateAll('stop');"
									class="form-control btn btn-default">批量停用</button>
								<input type="hidden" id="id" name="id" value="${task.id}" /> <input
									type="hidden" id="serverlength" name="serverlength"
									value="${fn:length(serverList)}" />
							</div>
						
							<div class="col-md-2 col-sm-2">
								<button type="button" onclick="operateAll('distribute');"
									class="form-control btn btn-default">批量分发</button>
							</div>

							<div class="col-md-2 col-sm-2">
								<button type="button" onclick="operateAll('start');"
									class="form-control btn btn-default">批量启用</button>
							</div>

							<div class="col-md-2 col-sm-2">
								<button type="button" onclick="queryhisversion(true,'<c:out value="${task.id}"/>');"
									class="form-control btn btn-default">批量回退</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>序号</th>
					<th><input id="controlAll" name="controlAll" type="checkbox" onclick="selectAll(this);">全选</th>
					<th>系统名称</th>
					<th>IP</th>
					<th>端口</th>
					<th>服务器状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${serverList}" var="server" varStatus="status">
					<tr id="serverstr">
						<td>${status.index+1}</td>
						<td><input type="checkbox" name="selected" value="${server.id }"></td>
						<td>${server.sysName}</td>
						<td>${server.ip}</td>
						<td>${server.port}</td>
						<td id="${server.id}" name="status"></td>
						<td><a href="#"
							onclick="distribute('${server.id}','${task.id}','${server.ip }','${server.port }')">分发版本</a>
							<%-- <a href="#"
							onclick="queryhisversion('<c:out value="${server.id}"/>','<c:out value="${task.id}"/>')">回退版本</a> --%>
							<a href="#"
							onclick="operate('<c:out value="${server.id}"/>','stop')">停止</a>
							<a href="#"
							onclick="operate('<c:out value="${server.id}"/>','start')">启动</a>
							<c:if test="${server.serverType == 'jboss' }">
								<a href="#"
								onclick="operate('<c:out value="${server.id}"/>','restart')">重启</a>
							</c:if>
							<a href="<%=request.getContextPath()%>/publish/list/${server.id}/${env}/${task.id}">日志</a>
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="row">
			<div class="col-md-10 col-sm-10 add-and-btn">
				<a class="btn btn-default pull-right" href="#" onclick="decision('<c:out value="${env}"/>','<c:out value="${task.id}"/>','success')">发布成功</a>
			</div>
			<div class="col-md-1 col-sm-1 add-and-btn">
				<a class="btn btn-default pull-right" href="#" onclick="decision('<c:out value="${env}"/>','<c:out value="${task.id}"/>','fail')">发布失败</a>
			</div>
			<div class="col-md-1 col-sm-1 add-and-btn">
				<a class="btn btn-default pull-right" href="#" onclick="goback();">返回</a>
			</div>
		</div>

	</div>
</div>


<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>


<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 666px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">版本回退</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="serverIdHis" value="" />
				<table class="table table-bordered table-striped"
					id="historyVersion">
					<thead>
						<tr>
							<th>选择</th>
							<th>序号</th>
							<th>任务编号</th>
							<th>版本号</th>
							<th>实际发布时间</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
					onclick="redistribute();">回退版本</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>


<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" data-backdrop="static"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-load">
		<div class="modal-content">

			<div class="modal-body modal-body-load">
				<div class="row row-load form-inline">
					<div class="control-load">
						<img class="img-load"
							src="<%=request.getContextPath()%>/resources/images/load.gif" />
					</div>
					<div class="control-load">
						<h4 id="myModalLabel">操作正在处理中...</h4>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<!-- 隐藏表单 -->
<form style="display:none" id="loadCondition" method="get">
	<!-- 连接属性 -->
	<input type="hidden" id="serverId" name="serverId">
	<input type="hidden" id="taskId" name="taskId" value="${task.id }">
	<input type="hidden" id="logName" name="logName">
	<input type="hidden" id="env" name="env" value="${env}"  />
</form>