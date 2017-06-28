<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/maintenance/list.js"></script>


<div class="content-inner">

	<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath()%>/home">版本发布管理</a>
		<li class="active">应用维护列表</li>
	</ul>

	<div class="container-fluid">

		<div class="block">
			<p class="block-heading">应用维护列表</p>
			<div class="block-body">
				<form class="form-horizontal"
					action="<%=request.getContextPath()%>/maintenance/list"
					method="post">
					<div class="row form-group">
						<div class="col-md-offset-1 col-sm-offset-1">
							<label class="col-md-2  col-sm-1 control-label ">系统名称：</label>
							<div class="col-md-3 col-sm-2">
								<select class="form-control" name="sysName" id="sysName">
									<option value="">-=请选择=-</option>
									<c:forEach items="${sysNameList}" var="code">
										<option value=${code.code }
											<c:if test='${server.sysName == code.code}'> selected = "selected" </c:if>>${code.val}</option>
									</c:forEach>
								</select> </select>
							</div>



							<label class="col-md-2  col-sm-1 control-label ">中文别名：</label>
							<div class="col-md-3 col-sm-2">
								<select class="form-control" name="chineseAlias" id="chineseAlias">
									<option value="">-=请选择=-</option>
									<c:forEach items="${sysChineseAliasList}" var="code">
										<option value=${code.code }
											<c:if test='${server.chineseAlias == code.code}'> selected = "selected" </c:if>>${code.val}</option>
									</c:forEach>
								</select>
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
								<input type="hidden" id="serverlength" name="serverlength" value="${fn:length(datas.datas)}"/>
							</div>

 							<!--<div class="col-md-2 col-sm-1">
								<button onclick="getServerStatu();"
									class="form-control btn btn-default">监控</button>
							</div> -->
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
					<th>中文别名</th>
					<th>当前版本</th>
					<th>IP</th>
					<th>端口</th>
					<th>运行状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${datas.datas}" var="serverMain"
					varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${serverMain.sysName}<input type="hidden" name="serverId" value="${serverMain.id }"/></td>
						<td>${serverMain.chineseAlias}</td>
						<td>${serverMain.serverVersion }</td>
						<td>${serverMain.ip}</td>
						<td>${serverMain.port}</td>
						<td id="${serverMain.id}"></td>
						<td><a href="#"
							onclick="operate('<c:out value="${serverMain.id}"/>','stop')"
							title="停止应用">停止</a> <a href="#"
							onclick="operate('<c:out value="${serverMain.id}"/>','start')"
							title="启动应用">启动</a> <a href="#"
							onclick="operate('<c:out value="${serverMain.id}"/>','restart')"
							title="重启应用">重启</a></td>
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