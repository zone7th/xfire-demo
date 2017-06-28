<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/role/list.js"></script>

	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">权限设置</a>
			<li class="active">角色管理</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">角色列表查询</p>
				<div class="block-body">
					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/role/list" method="post">
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">角色名称：</label>
								<div class="col-md-3 col-sm-2">
									<input class="form-control" name="roleName" placeholder="角色名称" />
								</div>

								<label class="col-md-2  col-sm-1 control-label">角色代码：</label>
								<div class="col-md-3 col-sm-2">
									<input class="form-control" name="roleCode" placeholder="角色代码" />
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
						<th>角色名称</th>
						<th>角色代码</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${datas.datas}" var="role" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>${role.roleName}</td>
							<td>${role.roleCode}</td>
							<td>${role.createdBy}</td>
							<td><fmt:formatDate value="${role.createdDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><a href="<%=request.getContextPath()%>/role/add"
								title="添加角色"><i class="icon-plus"></i></a> <a
								href="<%=request.getContextPath() %>/role/edit/${role.id}"
								title="修改角色"><i class="icon-pencil"></i></a> <a href="#"
								title="删除角色"
								onClick="removeRole('<c:out value="${role.id}" />')"><i
									class="icon-remove"></i></a></td>
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
				<a href="<%=request.getContextPath()%>/role/add"
					class="btn btn-default pull-right">新增</a>
			</div>
		</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>

