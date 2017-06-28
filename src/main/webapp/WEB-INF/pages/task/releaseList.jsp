<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/task/releaseList.js"></script>

<div class="content-inner">

	<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath()%>/home">发布任务列表</a>
		<li class="active">版本发布</li>
	</ul>

	<div class="container-fluid">

		<div class="block">
			<p class="block-heading">版本发布</p>
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
									class="form-control btn btn-default">停用集群</button>
								<input type="hidden" id="id" name="id" value="${task.id}" /> <input
									type="hidden" id="serverlength" name="serverlength"
									value="${fn:length(serverList)}" />
							</div>
						
							<div class="col-md-2 col-sm-2">
								<button type="button" onclick="operateAll('distribute');"
									class="form-control btn btn-default">分发集群</button>
							</div>

							<div class="col-md-2 col-sm-2">
								<button type="button" onclick="operateAll('start');"
									class="form-control btn btn-default">启用集群</button>
							</div>

							<div class="col-md-2 col-sm-2">
								<button type="button" onclick="queryhisversion(true,'<c:out value="${task.id}"/>');"
									class="form-control btn btn-default">回退集群</button>
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
					<th>系统名称</th>
					<th>IP</th>
					<th>端口</th>
					<th>服务器ID</th>
					<th>服务器状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${serverList}" var="server" varStatus="status">
					<tr id="serverstr">
						<td>${status.index+1}</td>
						<td>${server.sysName}</td>
						<td>${server.ip}</td>
						<td>${server.port}</td>
						<td>${server.id}</td>
						<td id="${server.id}" name="status"></td>
						<td><a href="#"
							onclick="distribute('<c:out value="${server.id}"/>','<c:out value="${task.id}"/>')">分发版本</a>
							<a href="#"
							onclick="queryhisversion('<c:out value="${server.id}"/>','<c:out value="${task.id}"/>')">回退版本</a>
							<a href="#"
							onclick="operate('<c:out value="${server.id}"/>','stop')">停止</a>
							<a href="#"
							onclick="operate('<c:out value="${server.id}"/>','start')">启动</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="row">
				<div class="col-md-12 col-sm-12 add-and-btn">
					<a class="btn btn-default pull-right"
						href="<%=request.getContextPath()%>/task/list">返回</a>
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
				<input type="hidden" id="serverId" value="" />
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
