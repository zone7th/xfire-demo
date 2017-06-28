<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">
<script src="<%=request.getContextPath()%>/resources/js/publish/realtime.js"></script>
	<div class="content-inner">

		<ul class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/home">应用日志管理</a>
			<li class="active">
				实时日志查看
			</li>
		</ul>

		<div class="container-fluid">
			<div class="block">
				<p class="block-heading">
					实时日志查看
				</p>
				
				
			</div>
			<div class="row">
				<div class="col-md-offset-1 col-sm-offset-1  pull-left" >
					<label class="control-label ">系统名称：<span><a>${server.sysName}</a></span></label>&nbsp;&nbsp;&nbsp;
					<label class="control-label ">服务器IP：<span><a>${server.ip}</a></span></label>&nbsp;&nbsp;&nbsp;
					<label class="control-label ">端口：<span><a>${server.port}</a></span></label>&nbsp;&nbsp;&nbsp;
					<label class="control-label ">文件名：<span><a>${fileName}</a></span></label>
				</div>
				<div class="col-md-offset-4 col-sm-offset-4  pull-right">
					<div class="col-md-3 col-sm-3">
						<!-- <a href="#" onclick="stoplog();"
							class="btn btn-default pull-right">停止</a> -->
						<button class="btn btn-default" onclick="stoplog();">停止</button>		
					</div>
					<div class="col-md-3 col-sm-3 ">
						<a href="#" onclick="startlog();"
							class="btn btn-default">启动</a>
					</div>
					<div class="col-md-3 col-sm-3">
						<a href="<%=request.getContextPath() %>/publish/list/${serverId}/${env}/${taskId}"
							class="btn btn-default">返回</a>
					</div>
				</div>
			</div>
			
			<div class="block-body" style="background: black;color:white;">	
			</div>
			
			<div class="row">
				<div class="col-md-offset-4 col-sm-offset-4  pull-right">
					<div class="col-md-3 col-sm-3">
						<!-- <a href="#" onclick="stoplog();"
							class="btn btn-default pull-right">停止</a> -->
						<button class="btn btn-default" onclick="stoplog();">停止</button>		
					</div>
					<div class="col-md-3 col-sm-3 ">
						<a href="#" onclick="startlog();"
							class="btn btn-default">启动</a>
					</div>
					<div class="col-md-3 col-sm-3">
						<a href="<%=request.getContextPath() %>/publish/list/${serverId}/${env}/${taskId}"
							class="btn btn-default">返回</a>
					</div>
				</div>
			</div>
			
			
			<input id="serverId" name="serverId" type="hidden" value="${serverId}">
			<input id="fileName" name="fileName" type="hidden" value="${fileName}">
			<input id="env" name="env" type="hidden" value="${env}">
	</div>
	</div>