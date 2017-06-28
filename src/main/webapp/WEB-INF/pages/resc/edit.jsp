<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/resc/edit.js"></script>

	<div class="content-inner">

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">修改资源信息</p>
				<div class="block-body">
					<div class="row-fluid">
						<form class="form-horizontal" action="<%=request.getContextPath()%>/resc/edit" method="post" onsubmit="return checkResc();">
							<input type="hidden" name="_method" value="PUT" />
							<input type="hidden" id="id" name="id" value="${resc.id}" />
							
							<div class="form-group">
								<label class="col-sm-2 control-label"
									for="rescName"> 资源名称: </label>
								<div class="col-sm-3">
									<input class="form-control" id="rescName" name="rescName" value="${resc.rescName}"  />
								</div>
							
								<label class="col-sm-2 control-label"
									for="rescString"> 资源URI: </label>
								<div class="col-sm-3">
									<input class="form-control" id="rescString" name="rescString" value="${resc.rescString}"   />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label"
									for="rescType"> 资源类型: </label>
								<div class="col-sm-3">
									<input class="form-control" id="rescType" name="rescType" value="${resc.rescType}"  />
								</div>
							
								<label class="col-sm-2 control-label"
									for="methodType"> 方法类型: </label>
								<div class="col-sm-3">
									<input class="form-control" id="methodType" name="methodType" value="${resc.methodType}"  />
								</div>
							</div>														
							
							<div class="form-group">
								<label class="col-sm-2 control-label"
									for="descn"> 资源描述: </label>
								<div class="col-sm-8">
									<textarea class="form-control" id="descn" name="descn" rows="3">${resc.descn}</textarea>
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


