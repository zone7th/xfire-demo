<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/datastatistics/releaseaging.js"></script>


	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">版本发布管理</a>
			<li class="active">发布任务列表</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">发布任务列表</p>
				<div class="block-body">
					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/datastatistics/releaseaging" method="post">
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">系统名称：</label>
								<div class="col-md-3 col-sm-2">
									<select class="form-control" name="sysName">
									<option value="">-=请选择=-</option>
										<c:forEach items="${sysNameList}" var="code">
											<option value= ${code.code } <c:if test='${task.sysName == code.code}'> selected = "selected" </c:if> >${code.val}</option>
										</c:forEach>
									</select>
								</div>

								<%-- <label class="col-md-2  col-sm-1 control-label">任务状态：</label>
								<div class="col-md-3 col-sm-2">
								<input type="hidden" value="${task.taskStatus }">
									<select class="form-control" name="taskStatus">
										<option selected="selected" value="">-=请选择=-</option>
										<c:forEach items="${taskStatusList}" var="code">
											<option value=${code.code }<c:if test='${task.taskStatus == code.code}'> selected = "selected" </c:if> >${code.val}</option>
										</c:forEach>
									</select>
								</div> --%>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">任务编号：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${task.taskNo }" type='text'
										class="form-control" name="taskNo"
										id='taskNo'  placeholder="任务编号" />
								</div>

								<label class="col-md-2  col-sm-1 control-label">版本编号：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${task.versionNo}" type='text'
										class="form-control" name="versionNo"
										id='versionNo'  placeholder="版本编号" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">实际发布时间：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${task.actualPubDateBegin}" type='text'
										class="form-control" name="actualPubDateBegin"
										id='actualPubDateBegin' readonly placeholder="实际发布开始时间" />
								</div>

								<label class="col-md-2  col-sm-1 control-label">实际发布时间：</label>
								<div class="col-md-3 col-sm-2">
									<input value="${task.actualPubDateEnd}" type='text'
										class="form-control" name="actualPubDateEnd"
										id='actualPubDateEnd' readonly placeholder="实际发布结束时间" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">预期发布时间：</label>
								<div class="col-md-3 col-sm-2">
									<input type="text" value="${task.expectPubDateBegin}"
										name="expectPubDateBegin" id="expectPubDateBegin" readonly
										class="form-control" placeholder="预期发布开始时间" />
								</div>

								<label class="col-md-2  col-sm-1 control-label">预期发布时间：</label>
								<div class="col-md-3 col-sm-2">
									<input type="text" value="${task.expectPubDateEnd}"
										name="expectPubDateEnd" id="expectPubDateEnd" readonly
										class="form-control" placeholder="预期发布结束时间" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-5 col-sm-offset-4">
								<div class="col-md-2 col-sm-1">
									<button type="button" class="form-control btn btn-default" id="submitBtn">查询</button>
								</div>

								<div class="col-md-2 col-sm-1">
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
						<th>任务编号</th>
						<th>系统名称</th>
						<th>版本号</th>
						<th>发布时间</th>
						<th>生产发布耗时</th>
						<th>版本流程耗时</th>
						<th>创建人</th>
						<th>创建时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${datas.datas}" var="task" varStatus="status">
						<tr>
							<td>${status.index+1}</td>
							<td>${task.taskNo}</td>
							<td>${task.sysName}</td>
							<td>${task.versionNo}</td>
							<td><fmt:formatDate value="${task.actualPubDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${task.productionReleaseTime}</td>
							<td>${task.versionProcessTime}</td>
							<td>${task.createdBy}</td>
							<td><fmt:formatDate value="${task.createdDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
