<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/resc/add.js"></script>

	<div class="content-inner">

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">新增资源信息</p>
				<div class="block-body">
					<div class="row-fluid">
						<form class="form-horizontal" action="<%=request.getContextPath()%>/resc/add" method="post" onsubmit="return checkResc();">
							<div class="form-group ">
								<label class="col-md-2 control-label"
									for="rescName"> 资源名称: </label>
								<div class="col-sm-3">
									<input class="form-control" id="rescName" name="rescName"/>
								</div>
							
								<label class="col-md-2 control-label"
									for="rescString"> 资源URI: </label>
								<div class="col-sm-3">
									<input class="form-control" id="rescString" name="rescString"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-2 control-label"
									for="rescType"> 资源类型: </label>
								<div class="col-sm-3">
									<input class="form-control" id="rescType" name="rescType"/>
								</div>
							
								<label class="col-md-2 control-label"
									for="methodType"> 方法类型: </label>
								<div class="col-sm-3">
									<input class="form-control" id="methodType" name="methodType"/>
								</div>
							</div>														
							
							<div class="form-group">
								<label class="col-md-2 control-label"
									for="descn"> 资源描述: </label>
								<div class="col-sm-8">
									<textarea class="form-control" id="descn" name="descn" rows="3"></textarea>
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
