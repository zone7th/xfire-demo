<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/resc/list.js"></script>

	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">权限设置</a>
			<li class="active">资源管理</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">资源列表查询</p>
				<div class="block-body">

					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/resc/list" method="post">

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">资源类型：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${resc.rescType}" name="rescType"
										class="form-control" placeholder="资源类型" />
								</div>

								<label class="col-md-2  col-sm-1 control-label">方法类型：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${resc.methodType}" name="methodType"
										class="form-control" placeholder="方法类型" />
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
						<th>资源名称</th>
						<th>资源URI</th>
						<th>资源类型</th>
						<th>方法类型</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${datas.datas}" var="resc" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>${resc.rescName}</td>
							<td>${resc.rescString}</td>
							<td>${resc.rescType}</td>
							<td>${resc.methodType}</td>
							<td>${resc.createdBy}</td>
							<td><fmt:formatDate value="${resc.createdDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><a href="<%=request.getContextPath()%>/resc/add"
								title="添加资源"><i class="icon-plus"></i></a> <a
								href="<%=request.getContextPath() %>/resc/edit/${resc.id}"
								title="修改资源"><i class="icon-pencil"></i></a> <a href="#"
								title="删除资源"
								onClick="removeResc('<c:out value="${resc.id}" />')"><i
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
				<a href="<%=request.getContextPath()%>/resc/add"
					class="btn btn-default pull-right">新增</a>
			</div>
		</div>

	</div>
	</div>
		<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>
