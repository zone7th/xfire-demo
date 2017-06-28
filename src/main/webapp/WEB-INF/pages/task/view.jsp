<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/task/view.js"></script>

	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">发布任务列表</a>
			<li class="active">查看发布任务信息</li>
		</ul>

		<div class="container-fluid">

			<div class="block">
				<p class="block-heading">查看发布任务信息</p>
				<div class="block-body">
					<form class="form-horizontal"
						action="<%=request.getContextPath()%>/task/edit" method="post">
							<input type="hidden" name="_method" value="PUT" />
							<input type="hidden" id="id" name="id" size="15" value="${task.id}" cssClass="col-xs-10 col-sm-5" />
							<input type="hidden" id="relVersion" name="relVersion" size="15" value="${task.relVersion}" cssClass="col-xs-10 col-sm-5" />
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">任务编号：</label>
								<div class="col-md-3 col-sm-2">
									<input id="taskNo"  name="taskNo" class="form-control"
										placeholder="任务编号"  value = '<c:out value="${task.taskNo}"/>' disabled = "disabled" />
								</div>
							</div>
						</div>	
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">系统名称：</label>
								<div class="col-md-3 col-sm-2">
									<select class="form-control" name="sysName" id="sysName" disabled = "disabled">
										<option value="">-=请选择=-</option>
										<c:forEach items="${sysNameList}" var="code">
											<option value="${code.code}" <c:if test='${task.sysName == code.code}'>selected </c:if> >${code.val}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">版本号：</label>
								<div class="col-md-3 col-sm-2">
									<input id="versionNo" name="versionNo" value="${task.versionNo}"  class="form-control" disabled = "disabled" />
								</div>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">版本流程：</label>
								<div class="col-md-3 col-sm-2">
									<select class="form-control" name="process" id="process" disabled = "disabled" >
										<option value="${task.process}">${task.process}</option>
									</select>
								</div>
							</div>
						</div>	
							
						<div class="row form-group"> 		
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">预计发布时间：</label>
								<div class="col-md-3 col-sm-2">
									<input id="expectPubDate" name="expectPubDate" value="<fmt:formatDate value="${task.expectPubDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />"  class="form-control" disabled = "disabled"/>
								</div>
							</div>
						
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">实际发布时间：</label>
								<div class="col-md-3 col-sm-2">
									<input id="actualPubDate" name="actualPubDate" value="<fmt:formatDate value="${task.actualPubDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />"  class="form-control" disabled = "disabled"/>
								</div>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-offset-1 col-sm-offset-1">
								<label class="col-md-2  col-sm-1 control-label ">版本说明：</label>
								<div class="col-md-3 col-sm-2">
									<textarea class="textarea form-control higherarea" id="releaseNote" name="releaseNote" rows="3" disabled = "disabled">${task.releaseNote}</textarea>
								</div>
							</div>
						</div>

					<div class="row form-group">
						<div class="col-md-offset-1 col-sm-offset-1">
							<label class="col-md-2  col-sm-1 control-label ">是否有关联版本:
							</label>
							<div class="col-md-3 col-sm-2">
								<select class="form-control" id="isRel" name="isRel"  disabled = "disabled">
									<option value="">-=请选择=-</option>
									<option value = '1' <c:if test="${task.isRel == '1' }">selected</c:if>>是</option>
									<option value = '0' <c:if test="${task.isRel == '0' }">selected</c:if>>否</option>
								</select>
							</div>
							<div class="col-md-2 col-sm-1">
									<c:if test="${task.isRel == '1' }"><button type="button" onclick="getRelSystem();"
									class="form-control btn btn-default">关联系统</button></c:if>
							</div>
						</div>

						<div class="col-md-offset-1 col-sm-offset-1" style="display: none;">
							<label class="col-md-2  col-sm-1 control-label">关联系统：</label>
							<div class="col-md-3 col-sm-2">
								<select class="form-control" id="relSys" name="relSys" onclick="getVersion();" disabled = "disabled">
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
								placeholder="请输入备注" disabled = "disabled">${task.remark }</textarea>
						</div>
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col-md-offset-1 col-sm-offset-1">
						<label class="col-md-2  col-sm-1 control-label ">版本SVN路径：</label>
						<div class="col-md-8 col-sm-8">
							<input id="filePath" name="filePath" class="form-control"  value="${task.filePath}"placeholder="请输入版本SVN路径地址" disabled = "disabled"/>
							<span style="display:none;" id="svnPathError" class="help-block-custom" for="filePath">不可知的SVN路径,导致SVN文件加载失败！</span>
						</div>
					</div>
				</div>

					<div class="row form-group staticfilesign">
						<div class="col-md-offset-1 col-sm-offset-1">
							<label class="col-md-2  col-sm-1 control-label ">静态发布文件路径：</label>
							<div class="col-md-8 col-sm-7">
								<input id="staticFilePath" name="staticFilePath"  value="${task.staticFilePath}"
									class="form-control" placeholder="请输入静态发布文件路径" disabled = "disabled"/>
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
						</tr>
						<c:forEach items="${taskList}" var="task">
							<tr>
								<td>${task.sysName }</td>
								<td>${task.versionNo }</td>
							</tr>
						</c:forEach>
					</thead>
					
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>

<!-- task/view.jsp -->