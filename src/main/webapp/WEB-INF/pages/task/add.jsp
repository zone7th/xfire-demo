<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/task/add.js"></script>

	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">发布任务列表</a>
			<li class="active">新建发布任务</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">新建发布任务</p>
				<div class="block-body">
					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/task/add" method="post">

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">系统名称：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" id = "relTaskNo" name ="relTaskNo" value=""/>
									<select class="form-control" name="sysName" id="sysName" onchange="getProcedure()">
										<option value="">-=请选择=-</option>
										<c:forEach items="${sysNameList}" var="code">
											<option value="${code.code}" <c:if test='${task.sysName == code.code}'>selected </c:if> >${code.val}</option>
										</c:forEach>
									</select>
								</div>
								
								<label class="col-md-2  col-sm-1 control-label " id="reallabel" style="display:none;">系统关联组：</label>
								<div class="col-md-3 col-sm-2" id="realdiv" style="display:none;">
									<select id="sysRealTeam" name="sysRealTeam" class="form-control">
										<option value="auto-net">auto-net</option>
										<option value="wx-auto-net">wx-auto-net</option>
										<option value="gw-auto-net">gw-auto-net</option>
									</select>
								</div>
								
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">版本号：</label>
								<div class="col-md-3 col-sm-2">
									<input id="versionNo" name="versionNo" class="form-control"
										placeholder="版本号,例：Ver1_1_0_1" />
								</div>
								
								<label class="col-md-2  col-sm-1 control-label ">预计发布时间：</label>
								<div class="col-md-3 col-sm-2">
									<input id="expectPubDate" name="expectPubDate"
										class="form-control" placeholder="预计发布时间" />
								</div>
								
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">版本流程：</label>
								<div class="col-md-3 col-sm-2">
									<input type="hidden" id = "processVal" name ="processVal" value=""/>
									<select class="form-control" name="process" id="process" >
									</select>
								</div>
							</div>
						</div>


						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">版本说明：</label>
								<div class="col-md-3 col-sm-2">
									<textarea class="form-control textarea higherarea" id="releaseNote"
										name="releaseNote" placeholder="请输入版本说明"></textarea>
								</div>
							</div>
						</div>
						
				<div class="row form-group">
						<div class="col-md-offset-1 col-sm-offset-1">
							<label class="col-md-2  col-sm-1 control-label ">是否有关联版本:
							</label>
							<div class="col-md-3 col-sm-2">
								<select class="form-control" id="isRel" name="isRel" onchange="showRelButton()">
									<!-- <option value="">-=请选择=-</option> -->
									<option value = '0'>否</option>
									<option value = '1'>是</option>
								</select>
							</div>
								
								<div class="col-md-2 col-sm-1">
								<button type="button" onclick="getRelSystem();" class="form-control btn btn-default" id="getRelSys">关联系统</button>
								</div>
						</div>
					
				
					<div class="col-md-offset-1 col-sm-offset-1" style="display: none;">
						<label class="col-md-2  col-sm-1 control-label">关联系统：</label>
						<div class="col-md-3 col-sm-2">
							<select class="form-control" id="relSys" name="relSys" onclick="getVersion();" disabled="disabled">
								<option value="">-=请选择=-</option>
								<c:forEach items="${sysNameList}" var="code">
									<option value="${code.code}" <c:if test='${task.relSys == code.code}'>selected </c:if> >${code.val}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<div class="row form-group">
					<div class="col-md-offset-1 col-sm-offset-1">
						<label class="col-md-2  col-sm-1 control-label ">备注：</label>
						<div class="col-md-3 col-sm-2">
							<textarea class="form-control textarea" id="remark" name="remark"
								placeholder="请输入备注"></textarea>
						</div>
					</div>
				</div>

			
				<div class="row form-group">
					<div class="col-md-offset-1 col-sm-offset-1">
						<label class="col-md-2  col-sm-1 control-label ">版本SVN路径：</label>
						<div class="col-md-8 col-sm-8">
							<input id="filePath" name="filePath" class="form-control" placeholder="请输入版本SVN路径地址"/>
							<span style="display:none;" id="svnPathError" class="help-block-custom" for="filePath">不可知的SVN路径,导致SVN文件加载失败！</span>
						</div>
					</div>
				</div>
				
				<div class="row form-group staticfilesign">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">静态发布文件路径：</label>
								<div class="col-md-8 col-sm-7">
									<input id="staticFilePath" name="staticFilePath" class="form-control"
										placeholder="请输入静态发布文件路径"/>
								</div>
							</div>
				</div>
				
				<div class="row form-group attachment-list">
					<div class="col-md-offset-1 col-sm-offset-1">
						<label class="col-md-2  col-sm-1 control-label ">部署文件：</label>
						<div class="col-md-8 col-sm-8">
								<table class="table table-striped table-attachment">
									<thead>
										<tr>
											<th width="200px"></th>
											<th width="100px"></th>
											<th width="179px"></th>
											<th width="33px"></th>
										</tr>
									</thead>
									<tbody id="attachment-tbody-deploy">
									</tbody>
								</table>
							</div>
					</div>
				</div>
				
				<div class="row form-group attachment-list">
					<div class="col-md-offset-1 col-sm-offset-1">
						<label class="col-md-2  col-sm-1 control-label ">数据库脚本：</label>
						<div class="col-md-8 col-sm-8">
								<table class="table table-striped table-attachment">
									<thead>
										<tr>
											<th width="200px"></th>
											<th width="100px"></th>
											<th width="179px"></th>
											<th width="33px"></th>
										</tr>
									</thead>
									<tbody id="attachment-tbody-script">
									</tbody>
								</table>
							</div>
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col-md-offset-5 col-sm-offset-4">
						<div class="col-md-2 col-sm-1">
							<button type="button" class="form-control btn btn-default" id="submitBtn">提交</button>
						</div>

						<div class="col-md-2 col-sm-1">
							<a class="form-control btn btn-default" href="<%=request.getContextPath()%>/task/list">返回</a>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
</div>
</div>
	<jsp:include page="/WEB-INF/pages/footer.jsp"></jsp:include>
	
<!-- 隐藏表单 -->
<form style="display: none" action="<%=request.getContextPath()%>/task/load" id="load" method="post">
	<input type="hidden" id="downloadPath" name="downloadPath"> 
	<input type="hidden" id="name" name="name"> 
	<input type="hidden" id="sizeByte" name="sizeByte">
</form>

<div class="modal fade" id="releaseModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 666px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">关联系统</h4>
			</div>
			<div class="modal-body">
				<table class="table table-bordered table-striped"
					id="releaseVersion">
					<thead>
						<tr>
							<th>关联系统</th>
							<th>关联版本</th>
							<th>操作</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
					onclick="addVersionSys();">增加</button>
				<button type="button" class="btn btn-default" onclick="closeTask();">保存
				</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div> 
 