<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script
	src="<%=request.getContextPath()%>/resources/js/dictionary/edit.js"></script>

	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">系统字典列表</a>
			<li class="active">修改系统字典</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">修改系统字典</p>
				<div class="block-body">
					<form class="form-horizontal" action="<%=request.getContextPath()%>/dictionary/edit/" method="POST">
							<input type="hidden" name="_method" value="PUT" />
							<input type="hidden" type="text" id="id" name="id" size="15" value="${dictionary.id}"/>
							
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">字典类型：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" value="${dictionary.dicType }" id="dicTypeVal">
										<select onchange="dicTypeChange()" <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control" name="dicType" id="dicType">
										</select>
								</div>
							</div>
							
							<%-- <div class="col-md-offset-1 col-sm-offset-1" id="roleTypeBlock">
								<label class="col-md-2  col-sm-1 control-label ">关联角色：</label>
								<div class="col-md-3 col-sm-2">
									<select <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control" name="roleType" id="roleType">
										<option value="">-=请选择=-</option>
										<option <c:if test="${dictionary.roleType == 'ROLE_FINANCE'}"> selected='selected'</c:if> value="ROLE_FINANCE">财务应用角色</option>
										<option <c:if test="${dictionary.roleType == 'ROLE_AUTO'}"> selected='selected' </c:if> value="ROLE_AUTO">承保应用角色</option>
										<option <c:if test="${dictionary.roleType == 'ROLE_TELSALE'}"> selected='selected' </c:if> value="ROLE_TELSALE">电销应用角色</option>
										<option <c:if test="${dictionary.roleType == 'ROLE_NETSALE'}"> selected='selected' </c:if> value="ROLE_NETSALE">网销应用角色</option>
										<option <c:if test="${dictionary.roleType == 'ROLE_BASE'}"> selected='selected' </c:if> value="ROLE_BASE">基础应用角色</option>
										<option <c:if test="${dictionary.roleType == 'ROLE_CLAIM'}"> selected='selected' </c:if> value="ROLE_CLAIM">理赔系统角色</option>
									</select>
								</div>
							</div> --%>
						</div>


						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">字典代码：</label>
								<div class="col-md-3 col-sm-2">
										<input <c:if test="${mode == 'view'}"> disabled </c:if> id="dicCode" name="dicCode" value="${dictionary.dicCode}"class="form-control"
										placeholder="字典代码" />
								</div>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">字典值：</label>
								<div class="col-md-3 col-sm-2">
										<input  <c:if test="${mode == 'view'}"> disabled </c:if> id="dicVal" name="dicVal" value="${dictionary.dicVal}" class="form-control"
										placeholder="字典值" />
								</div>
							</div>
						</div>


						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">备注：</label>
								<div class="col-md-3 col-sm-2">
									
										<textarea <c:if test="${mode == 'view'}"> disabled </c:if> class="form-control textarea" id="remark"
										name="remark" placeholder="请输入备注">${dictionary.remark}</textarea>
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
									<a class="form-control btn btn-default" href="<%=request.getContextPath()%>/dictionary/list">返回</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>


