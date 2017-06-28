<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>
<script
	src="<%=request.getContextPath()%>/resources/lib/highchart/highcharts.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/highchart/HighchartsUtil.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/highchart/HighchartsFactory.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/highchart/HighchartsDefaultProperty.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/home.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/lib/bootstrap/css/iframe.css">

<div class="content-inner">

	<ul class="breadcrumb">
		<li><a href="<%=request.getContextPath()%>/home">主页</a></li>
		<li class="active">信息总览</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">


			<div class="row-fluid">
				<div class="alert alert-info">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>安盛天平理赔应用管理平台V1.0</strong> 正式上线啦!
				</div>

				<div class="alert alert-info" id="container"></div>
			</div>
		</div>

		<div class="row-fluid">
			<div class="col-md-6 col-sm-5">
				<h4>截止2016年8月版本发布统计合计：</h4>
				<table class="table table-striped table-attachment">
					<thead>
						<tr>
							<th width="40%"></th>
							<th width="10%"></th>
							<th width="20%"></th>
							<th width="10%"></th>
							<th width="20%"></th>
							<th width="10%"></th>
						</tr>
					</thead>
					<tbody id="home-table">
					</tbody>
				</table>
			</div>

			<div class="col-md-6 col-sm-5">
				<h4> 版本统计口径：</h4>
				<table class="table table-striped table-attachment">
					<thead>
						<tr>
							<th width="30%"></th>
							<th width="70%"></th>
						</tr>
					</thead>
					<tbody class="home-table-second">
						<tr>
							<td>电销系统：</td>
							<td>callcenter、callCenter_bg、tsmanage</td>
						</tr>
						<tr>
							<td>网销系统:</td>
							<td>ecsale、dmsale、ecws</td>
						</tr>
						<tr>
							<td>承保系统：</td>
							<td>auto、auto-net</td>
						</tr>
						<tr>
							<td>规则系统：</td>
							<td>ruleengine、rulemanager</td>
						</tr>
						<tr>
							<td>评分系统：</td>
							<td>scoringengine</td>
						</tr>
						<tr>
							<td>电服系统：</td>
							<td>customerService</td>
						</tr>
						<tr>
							<td>理赔系统：</td>
							<td>ClaimCenter、autoclaim</td>
						</tr>
						<tr>
							<td>支付系统：</td>
							<td>payment</td>
						</tr>
						<tr>
							<td>核算系统：</td>
							<td>finance</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
