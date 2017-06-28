<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/maintenancelog/list.js"></script>


<div class="content-inner">

	<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath()%>/home">版本发布管理</a>
		<li class="active">应用维护日志</li>
	</ul>

	<div class="container-fluid">

		<div class="block">
			<p class="block-heading">应用维护日志列表</p>
			<div class="block-body">
				<form class="form-horizontal"
					action="<%=request.getContextPath()%>/maintenancelog/list"
					method="post">
					<div class="row form-group">
						<div class="col-md-offset-1 col-sm-offset-1">
							<label class="col-md-2  col-sm-1 control-label ">系统名称：</label>
							<div class="col-md-3 col-sm-2">
								<select class="form-control" name="sysName">
									<option value="">-=请选择=-</option>
										<c:forEach items="${sysNameList}" var="code">
											<option value= ${code.code } <c:if test='${maintenanceLog.sysName == code.code}'> selected = "selected" </c:if> >${code.val}</option>
										</c:forEach>
									</select>
							</div>
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-offset-1 col-sm-offset-1">
							<label class="col-md-2  col-sm-1 control-label ">IP：</label>
							<div class="col-md-3 col-sm-2">
								<input value="${maintenanceLog.ip}" name="ip"
									class="form-control" placeholder="ip" />
							</div>

							<label class="col-md-2  col-sm-1 control-label ">端口：</label>
							<div class="col-md-3 col-sm-2">
								<input value="${maintenanceLog.port}" name="port"
									class="form-control" placeholder="端口" />
							</div>
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-offset-1 col-sm-offset-1">
							<label class="col-md-2  col-sm-1 control-label ">操作开始时间：</label>
							<div class="col-md-3 col-sm-2">
								<input value="${maintenanceLog.operatedDateBegin}"
									name="operatedDateBegin" id="operatedDateBegin"
									class="form-control" placeholder="操作开始时间" />
							</div>

							<label class="col-md-2  col-sm-1 control-label">操作结束时间：</label>
							<div class="col-md-3 col-sm-2">
								<input value="${maintenanceLog.operatedDateEnd}"
									name="operatedDateEnd" id="operatedDateEnd"
									class="form-control" placeholder="操作结束时间" />
							</div>
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-offset-5 col-sm-offset-4">
							<div class="col-md-2 col-sm-1">
								<button type="submit" class="form-control btn btn-default">查询</button>
							</div>

							<div class="col-md-2 col-sm-1">
								<button type="reset" class="form-control btn btn-default">重置</button>
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
					<th>操作类型</th>
					<th>操作人</th>
					<th>操作时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${datas.datas}" var="maintenanceLog"
					varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${maintenanceLog.sysName}</td>
						<td>${maintenanceLog.ip}</td>
						<td>${maintenanceLog.port}</td>
						<td><c:if test="${maintenanceLog.operateType == 1}">启动服务器</c:if>
							<c:if test="${maintenanceLog.operateType == 2}">停止服务器</c:if></td>
						<td>${maintenanceLog.operatedBy}</td>
						<td><fmt:formatDate value="${maintenanceLog.operatedDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
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