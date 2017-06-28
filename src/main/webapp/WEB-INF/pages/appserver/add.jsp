<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/appserver/add.js"></script>

	<div class="content-inner">
		
		<input type="hidden" id="envVal" value="${env}"/>

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">应用服务器列表</a>
			<li class="active">
				<c:if test="${env == 'uat'}">新建UAT应用服务器</c:if>
				<c:if test="${env == 'preprod'}">新建预生产应用服务器</c:if>
				<c:if test="${env == 'gray'}">新建灰度应用服务器</c:if>
				<c:if test="${env == 'prod'}">新建生产应用服务器</c:if>
			</li>
		</ul>

		<div class="container-fluid"> 

			<div class="block">
				<p class="block-heading">
					<c:if test="${env == 'uat'}">新建UAT应用服务器</c:if>
					<c:if test="${env == 'preprod'}">新建预生产应用服务器</c:if>
					<c:if test="${env == 'gray'}">新建灰度应用服务器</c:if>
					<c:if test="${env == 'prod'}">新建生产应用服务器</c:if>
				</p>
				<div class="block-body">
					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/appserver/${env}/add" method="post">

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label">系统名称：</label>
								<div class="col-md-3 col-sm-2">
									<select class="form-control" name="sysName" id="sysName">
									</select>
								</div>
							</div>

							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">中文别名：</label>
								<div class="col-md-3 col-sm-2">
									<select class="form-control" name="chineseAlias" id="chineseAlias">
									</select>
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">IP：</label>
								<div class="col-md-3 col-sm-2">
									<input id="ip" name="ip" class="form-control"
										placeholder="IP" />
								</div>
							</div>

							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">端口：</label>
								<div class="col-md-3 col-sm-2">
									<input id="port" name="port" class="form-control"
										placeholder="端口" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">应用服务器类型：</label>
								<div class="col-md-3 col-sm-2">
									<select class="form-control" name="serverType" id="serverType">
									</select>
								</div>
							</div>

							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">应用服务器版本：</label>
								<div class="col-md-3 col-sm-2">
									<input id="serverVersion" name="serverVersion"
										class="form-control" placeholder="应用服务器版本" />
								</div>
							</div>
						</div>


						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">是否批处理：</label>
								<div class="col-md-3 col-sm-2">
									<select class="form-control" name="isBatch" id="isBatch">
										<option value="">-=请选择=-</option>
										<option value="1">是</option>
										<option value="0">否</option>
									</select>
								</div>
							</div>
							
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">测试路径：</label>
								<div class="col-md-3 col-sm-2">
									<input id="connectionPath" name="connectionPath" class="form-control"
										placeholder="测试路径" />
								</div>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">部署路径：</label>
								<div class="col-md-3 col-sm-2">
									<input id="deployPath" name="deployPath" class="form-control"
										placeholder="部署路径" />
								</div>
							</div>
							
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">日志路径：</label>
								<div class="col-md-3 col-sm-2">
									<input id="logPath" name="logPath" class="form-control"
										placeholder="日志路径" />
								</div>
							</div>
						</div>


						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">用户名：</label>
								<div class="col-md-3 col-sm-2">
									<input id="userName" name="userName" class="form-control"
										placeholder="用户名" />
								</div>
							</div>
						
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">密码：</label>
								<div class="col-md-3 col-sm-2">
									<input id="passwd" name="passwd" class="form-control"
										placeholder="密码" />
								</div>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">IT负责人：</label>
								<div class="col-md-3 col-sm-2">
									<input id="itOwner" name="itOwner" class="form-control"
										placeholder="IT负责人" />
								</div>
							</div>
							
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">业务负责人：</label>
								<div class="col-md-3 col-sm-2">
									<input id="busOwner" name="busOwner" class="form-control"
										placeholder="业务负责人" />
								</div>
							</div>

							
							<%-- <div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">服务器环境：</label>
								<div class="col-md-3 col-sm-2">
									<select class="form-control" name="env" id="env">
										<option value="">-=请选择=-</option>
										<c:if test="${env == 'uat'}"><option selected='selected' value="UAT">UAT环境</option></c:if>
										<c:if test="${env == 'preprod'}"><option selected='selected' value="PERPROD">预生产环境</option></c:if>
										<c:if test="${env == 'gray'}"><option selected='selected' value="GRAY">灰度环境</option></c:if>
										<c:if test="${env == 'prod'}"><option selected='selected' value="PROD">生产环境</option></c:if>
									</select>
								</div>
							</div> --%>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">域名：</label>
								<div class="col-md-8 col-sm-7">
									<input id="domain" name="domain" class="form-control"
										placeholder="域名" />
								</div>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">静态发布文件路径：</label>
								<div class="col-md-8 col-sm-7">
									<input id="staticFilePath" name="staticFilePath" class="form-control"
										placeholder="静态发布文件路径" />
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">备注：</label>
								<div class="col-md-3 col-sm-2">
									<textarea class="form-control textarea" id="remark"
										name="remark" placeholder="请输入备注"></textarea>
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-5 col-sm-offset-4">
								<div class="col-md-2 col-sm-1">
									<button type="button" class="form-control btn btn-default" id="submitBtn">保存</button>
								</div>

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

