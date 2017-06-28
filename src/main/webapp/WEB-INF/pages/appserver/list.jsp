<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/appserver/list.js"></script>

	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">系统设置</a>
			<li class="active">
				<c:if test="${env == 'uat'}">UAT应用服务器管理</c:if>
				<c:if test="${env == 'preprod'}">预生产应用服务器管理</c:if>
				<c:if test="${env == 'gray'}">灰度应用服务器管理</c:if>
				<c:if test="${env == 'prod'}">生产应用服务器管理</c:if>
			</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">
					<c:if test="${env == 'uat'}">UAT应用服务器列表</c:if>
					<c:if test="${env == 'preprod'}">预生产应用服务器列表</c:if>
					<c:if test="${env == 'gray'}">灰度应用服务器列表</c:if>
					<c:if test="${env == 'prod'}">生产应用服务器列表</c:if>
				</p>
				<div class="block-body">
					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/appserver/${env}/list"
						method="post">
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">系统名称：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${server.sysName}" id="sysNameVal">
									<select class="form-control" name="sysName" id="sysName">
									</select>
								</div>
								<label class="col-md-2  col-sm-1 control-label ">中文别名：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${server.chineseAlias}" id="chineseAliasVal">
									<select class="form-control" name="chineseAlias" id="chineseAlias">
									</select>
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">IP：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${server.ip}" name="ip" class="form-control"
										placeholder="IP" />
								</div>
								<label class="col-md-2  col-sm-1 control-label ">端口：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${server.port}" name="port" class="form-control"
										placeholder="端口" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">应用服务器类型：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${server.serverType}" id="serverTypeVal">
									<select class="form-control" name="serverType" id="serverType">
									</select>
								</div>
							</div>
						</div>


						<div class="row form-group">
							<div class="col-md-offset-5 col-sm-offset-4">
								<div class="col-md-2 col-sm-1">
									<button type="button" class="form-control btn btn-default" id="submitBtn">查询</button>
								</div>

								<div class="col-md-2 col-sm-1">
									<button type="reset" class="form-control btn btn-default" id="resetBtn">重置</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

			<table class="table table-bordered table-striped" style="table-layout:fixed">
				<thead>
					<tr>
						<th width="33px">序号</th>
						<th width="80px">系统名称</th>
						<th width="80px">中文别名</th>
						<th width="60px">服务器类型</th>
						<th width="40px">版本</th>
						<th width="65px">IP</th>
						<th width="33px">端口</th>
						<th width="50px">批处理</th>
						<th width="40px">用户名</th>
						<th width="60px">IT负责人</th>
						<th width="60px">业务负责人</th>
						<!-- <th width="60px">密码</th>
						<th width="70px">部署路径</th> -->
						<th width="40px">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${datas.datas}" var="server" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td title="${server.sysName}">${server.sysName}</td>
							<td title="${server.chineseAlias}">${server.chineseAlias}</td>
							<td title="${server.serverType}">${server.serverType}</td>
							<td title="${server.serverVersion}">${server.serverVersion}</td>
							<td title="${server.ip}">${server.ip}</td>
							<td title="${server.port}">${server.port}</td>
							<td ><c:if test="${server.isBatch == 0}" >否</c:if> <c:if test="${server.isBatch == 1}" >是</c:if></td>
							<td title="${server.userName}">${server.userName}</td>
							<td title="${server.itOwner}">${server.itOwner}</td>
							<td title="${server.busOwner}">${server.busOwner}</td>
							<%-- <td title="${server.passwd}">${server.passwd}</td>
							<td title="${server.deployPath}">${server.deployPath}</td>	 --%>						
							<td ><a href="<%=request.getContextPath()%>/appserver/${env}/edit/${server.id}/view"
								title="查看应用服务器"><i class="icon-search"></i></a> <a
								href="<%=request.getContextPath() %>/appserver/${env}/edit/${server.id}/update"
								title="修改应用服务器"><i class="icon-pencil"></i></a> <a href="#" title="删除应用服务器" onClick="removeAppServer('<c:out value="${server.id}" />')"><i class="icon-remove"></i></a></td>
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

		<div class="row">
				<div class="col-md-12 col-sm-12 add-and-btn">
					<a href="<%=request.getContextPath()%>/appserver/${env}/add"
						class="btn btn-default pull-right">新增</a>
				</div>
		</div>
	</div>
</div>
		<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>
