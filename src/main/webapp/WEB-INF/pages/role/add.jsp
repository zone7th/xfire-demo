<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/role/add.js"></script>

	<div class="content-inner">

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">新增用户角色信息</p>
				<div class="block-body">
					<div class="row-fluid">
						<form class="form-horizontal" action="<%=request.getContextPath()%>/role/add" method="post" onsubmit="return checkRole();">
							<div class="form-group">
								<label class="col-sm-2 control-label"
									for="roleName"> 角色名称: </label>
								<div class="col-md-3 col-sm-2">
									<input id="roleName" name="roleName" class="form-control"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label"
									for="roleCode"> 角色代码: </label>
								<div class="col-md-3 col-sm-2">
									<input id="roleCode" name="roleCode" class="form-control"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label "
									for="remark"> 备注: </label>
								<div class="col-sm-9">
									<textarea class="form-control" id="remark" name="remark" rows="3"></textarea>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="rescId"> 资源: </label>
								<div class="col-sm-9">
									<c:forEach var="resc" items="${rescList}" varStatus="status">
									
									<div class="col-md-4">
										<label class="checkbox checkbox-text-color" for="rescId"> 
											<input name="rescId" value="${resc.id}" type="checkbox">
											${resc.rescName}_<c:if test="${resc.rescType == 'LINK'}">链接</c:if><c:if test="${resc.rescType == 'BUTTON'}">按钮</c:if>
										</label>
										<c:if test="${(status.index+1) %3 eq 0}"><br></c:if>
									</div>
									</c:forEach>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="sysId"> 系统: </label>
								<div class="col-sm-9">
									<c:forEach var="sys" items="${sysList}" varStatus="status">
									
									<div class="col-md-4">
										<label class="checkbox checkbox-text-color" for="sysId"> 
											<input name="sysId" value="${sys.code}" type="checkbox">${sys.val}
										</label>
										<c:if test="${(status.index+1) %3 eq 0}"><br></c:if>
									</div>
									</c:forEach>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span12" align="center">
									<button type="submit" class="btn btn-default">提交</button>
									<button type="button" onclick="javascript:history.go(-1);" class="btn btn-default">返回</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
			</div>
		<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>


