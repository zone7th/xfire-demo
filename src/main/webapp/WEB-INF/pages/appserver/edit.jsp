<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/appserver/edit.js"></script>

	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">应用服务器列表</a>
			<li class="active">
				<c:if test="${env == 'uat'}">修改UAT应用服务器</c:if>
				<c:if test="${env == 'preprod'}">修改预生产应用服务器</c:if>
				<c:if test="${env == 'gray'}">修改灰度应用服务器</c:if>
				<c:if test="${env == 'prod'}">修改生产应用服务器</c:if>
			</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">
					<c:if test="${env == 'uat'}">修改UAT应用服务器</c:if>
					<c:if test="${env == 'preprod'}">修改预生产应用服务器</c:if>
					<c:if test="${env == 'gray'}">修改灰度应用服务器</c:if>
					<c:if test="${env == 'prod'}">修改生产应用服务器</c:if>
				</p>
				<div class="block-body">
						<form class="form-horizontal" action="<%=request.getContextPath()%>/appserver/${env}/edit" method="POST">
							<input type="hidden" name="_method" value="PUT" />
							<input type="hidden" type="text" id="id" name="id" size="15" value="${server.id}"/>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">系统名称：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${server.sysName}" id="sysNameVal">
									<select <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control" name="sysName" id="sysName">
									</select>
								</div>
							</div>

							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">中文别名：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${server.chineseAlias}" id="chineseAliasVal">
									<select <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control" name="chineseAlias" id="chineseAlias">
									</select>
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">IP：</label>
								<div class="col-md-3 col-sm-2">
										<input <c:if test="${mode == 'view'}"> disabled </c:if> id="ip" name="ip" class="form-control" value="${server.ip}"
										placeholder="IP" />
								</div>
							</div>

							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">端口：</label>
								<div class="col-md-3 col-sm-2">
										<input <c:if test="${mode == 'view'}"> disabled </c:if> id="port" name="port" class="form-control" value="${server.port}"
										placeholder="端口" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">应用服务器类型：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${server.serverType}" id="serverTypeVal">
									<select <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control" name="serverType" id="serverType" >
									</select>
								</div>
							</div>

							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">应用服务器版本：</label>
								<div class="col-md-3 col-sm-2">
									<input <c:if test="${mode == 'view'}"> disabled </c:if> id="serverVersion" name="serverVersion" value="${server.serverVersion}"
										class="form-control" placeholder="应用服务器版本" />
								</div>
							</div>
						</div>


						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">是否批处理：</label>
								<div class="col-md-3 col-sm-2">
									<select <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control" name="isBatch" id="isBatch">
										<option value="" <c:if test="${server.isBatch != 1 && server.isBatch != 0}"> selected  </c:if> >-=请选择=-</option>
										<option value="1" <c:if test="${server.isBatch == 1}"> selected  </c:if> >是</option>
										<option value="0" <c:if test="${server.isBatch == 0}"> selected  </c:if> >否</option>
									</select>
								</div>
							</div>
							
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">测试路径：</label>
								<div class="col-md-3 col-sm-2">
									<input <c:if test="${mode == 'view'}"> disabled </c:if> id="connectionPath" name="connectionPath" class="form-control" value="${server.connectionPath}"
										placeholder="测试路径" />
								</div>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">部署路径：</label>
								<div class="col-md-3 col-sm-2">
									<input  <c:if test="${mode == 'view'}"> disabled </c:if> id="deployPath" name="deployPath" class="form-control" value="${server.deployPath}"
										placeholder="部署路径" />
								</div>
							</div>
						
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">日志路径：</label>
								<div class="col-md-3 col-sm-2">
									<input  <c:if test="${mode == 'view'}"> disabled </c:if> id="logPath" name="logPath" class="form-control" value="${server.logPath}"
										placeholder="日志路径,请以/结尾" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">用户名：</label>
								<div class="col-md-3 col-sm-2">
									<input <c:if test="${mode == 'view'}"> disabled </c:if> id="userName" name="userName" class="form-control" value="${server.userName}"
										placeholder="用户名" />
								</div>
							</div>

							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">密码：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" id="passwd" name="passwd" value="${server.passwd}">
									<input type="hidden" id="oldPassword" name="oldPassword" value="${newPassword}">
									<input <c:if test="${mode == 'view'}"> disabled </c:if> id="newPassword" name="newPassword" class="form-control" value="${newPassword}"
										placeholder="密码" />
								</div>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">IT负责人：</label>
								<div class="col-md-3 col-sm-2">
									<input <c:if test="${mode == 'view'}"> disabled </c:if>  id="itOwner" name="itOwner" class="form-control" value="${server.itOwner}"
										placeholder="IT负责人" />
								</div>
							</div>
							
													
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">业务负责人：</label>
								<div class="col-md-3 col-sm-2">
									<input  <c:if test="${mode == 'view'}"> disabled </c:if> id="busOwner" name="busOwner" class="form-control" value="${server.busOwner}"
										placeholder="业务负责人" />
								</div>
							</div>

							
							<%-- <div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">服务器类型：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${server.env}" id="envVal">
									<select <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control" name="env" id="env">
										<option value="">-=请选择=-</option>
										<c:if test="${server.env == 'UAT'}"><option selected='selected' value="UAT">UAT环境</option></c:if>
										<c:if test="${server.env == 'PREPROD'}"><option selected='selected' value="PERPROD">预生产环境</option></c:if>
										<c:if test="${server.env == 'GRAY'}"><option selected='selected' value="GRAY">灰度环境</option></c:if>
										<c:if test="${server.env == 'PROD'}"><option selected='selected' value="PROD">生产环境</option></c:if>
									</select>
								</div>
							</div> --%>
						</div>


						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">域名：</label>
								<div class="col-md-8 col-sm-7">
									<input <c:if test="${mode == 'view'}"> disabled </c:if> id="domain" name="domain" class="form-control" value="${server.domain}"
										placeholder="域名" />
								</div>
							</div>
							<input type="hidden" value="${server.env}" id="env" name="env">
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">静态发布文件路径：</label>
								<div class="col-md-8 col-sm-7">
									<input <c:if test="${mode == 'view'}"> disabled </c:if> id="staticFilePath" name="staticFilePath" class="form-control" value="${server.staticFilePath}"
										placeholder="静态发布文件路径" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">备注：</label>
								<div class="col-md-3 col-sm-2">
									<textarea <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control textarea" id="remark"
										name="remark" placeholder="请输入备注">${server.remark}</textarea>
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-5 col-sm-offset-4">
									<c:if test="${mode == 'update'}">
										<div class="col-md-2 col-sm-1">
									<button type="button" class="form-control btn btn-default" id="submitBtn">保存</button>
								</div>
									</c:if>

								<div class="col-md-2 col-sm-1">
										<a class="form-control btn btn-default" href="<%=request.getContextPath()%>/appserver/${env}/list">返回</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>

