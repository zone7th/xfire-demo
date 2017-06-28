<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/logserver/list.js"></script>


	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">应用日志管理</a>
			<li class="active">
				<c:if test="${env == 'uat'}">UAT日志服务器</c:if>
				<c:if test="${env == 'preprod'}">预生产日志服务器</c:if>
				<c:if test="${env == 'gray'}">灰度日志服务器</c:if>
				<c:if test="${env == 'prod'}">生产日志服务器</c:if>
			</li>
		</ul>

	<div class="container-fluid">

		<div class="block">
			<p class="block-heading">
				<c:if test="${env == 'uat'}">UAT日志服务器列表</c:if>
				<c:if test="${env == 'preprod'}">预生产日志服务器列表</c:if>
				<c:if test="${env == 'gray'}">灰度日志服务器列表</c:if>
				<c:if test="${env == 'prod'}">生产日志服务器列表</c:if>
			</p>
			<div class="block-body">
				<form class="form-horizontal"
					action="<%=request.getContextPath()%>/logserver/${env}/list" method="post">
					<div class="row form-group">
						<div class="col-md-offset-1 col-sm-offset-1">
							<label class="col-md-2  col-sm-1 control-label ">系统名称：</label>
							<div class="col-md-3 col-sm-2">
								<input type="hidden" value="${server.sysName}" id="sysNameVal">
								<select class="form-control" name="sysName" id="sysName">
								</select>
							</div>
						</div>
						
						<div class="col-md-offset-1 col-sm-offset-1">
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="form-control btn btn-default">查询</button>
							</div>

							<div class="col-md-2 col-sm-2">
								<button type="reset" class="form-control btn btn-default"
									id="resetBtn">重置</button>
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
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${datas.datas}" var="server" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${server.sysName}</td>
						<td>${server.ip}</td>
						<td>${server.port}</td>
						<td><a
							href="<%=request.getContextPath()%>/logfile/list/${server.id}/${env}/logserver"
							title="查看日志文件列表" target="_black"><i class="icon-search"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="page-and-btn">
			<c:if test="${datas.total > 0}">
				<jsp:include page="/WEB-INF/pages/pager.jsp">
					<jsp:param value="${datas.total }" name="totalRecord" />
					<jsp:param value="list" name="url" />
				</jsp:include>
			</c:if>
		</div>
	</div>
</div>
		<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>
