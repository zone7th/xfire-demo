<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/dictionary/list.js"></script>
	
	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">系统设置</a>
			<li class="active">系统字典</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">系统字典列表</p>
				<div class="block-body">
					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/dictionary/list"
						method="post">
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">字典类型：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${dictionary.dicType }" id="dicTypeVal">								
									<select class="form-control" name="dicType" id="dicType">
									</select>
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">字典代码：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${dictionary.dicCode}" name="dicCode" class="form-control"
										placeholder="字典代码" />
								</div>
								<label class="col-md-2  col-sm-1 control-label ">字典值：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${dictionary.dicVal}" name="dicVal"
										class="form-control" placeholder="字典值" />
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
						<th width="50px">序号</th>
						<th width="150px">字典代码</th>
						<th width="150px">字典值</th>
						<th width="150px">字典类型</th>
						<th width="120px">创建人</th>
						<th width="170px">创建时间</th>
						<th width="70px">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${datas.datas}" var="dictionary"
						varStatus="status">
						<tr>
							<td title="">${status.index+1}</td>
							<td title="${dictionary.dicCode}">${dictionary.dicCode}</td>
							<td title="${dictionary.dicVal}">${dictionary.dicVal}</td>
							<td title="${dictionary.dicType}">${dictionary.dicType}</td>
							<td title="${dictionary.createdBy}">${dictionary.createdBy}</td>
							<td title="${dictionary.createdDate}"><fmt:formatDate value="${dictionary.createdDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><a href="<%=request.getContextPath() %>/dictionary/edit/${dictionary.id}/view"
								title="查看"><i class="icon-search"></i></a> <a
								href="<%=request.getContextPath() %>/dictionary/edit/${dictionary.id}/update"
								title="修改字典"><i class="icon-pencil"></i></a> <a href="#"
								title="删除字典"
								onClick="removeDictionary('<c:out value="${dictionary.id}" />')"><i
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
				<a href="<%=request.getContextPath()%>/dictionary/add"
					class="btn btn-default pull-right">新增</a>
			</div>
		</div>
		</div>
	        </div>
		<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>
