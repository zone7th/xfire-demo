<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<head>
<meta charset="utf-8">
<%@ include file="/WEB-INF/pages/common.jsp"%>
<title>欢迎使用安盛天平理赔应用管理平台</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="Shortcut Icon" href="resources/images/favicon.ico" />
</head>

<!--[if lt IE 7 ]>
<body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]>
<body class="ie ie7"> <![endif]-->
<!--[if IE 8 ]>
<body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]>
<body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="login-body">
	<!--<![endif]-->
	
<script src="<%=request.getContextPath()%>/resources/js/login.js"></script>	
	

	<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="<%=request.getContextPath() %>/index"><img class="logoposition"
				src="resources/images/logo.png" /><span class="second">安盛天平理赔应用管理平台</span></a>
		</div>
	</div>
	<div class="login-info">
		<div class="panel-inner">
			<section class="panel-content">
				<h1 class="welcome-title">欢迎使用安盛天平理赔应用管理平台</h1>
				<form id="loginForm" method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
					<div style="margin-top: 25px;">
						<fieldset>
							<div class="main-content">
								<label>用户名</label> 
								<input type="text" id="j_username" name="j_username" class="text" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}" />
							</div>
							<div class="main-content">
								<label class="psd">密码</label> 
								<input type="password" id="j_password" name="j_password" class="text" />
							</div>
							<fieldset>
								<div>
									<input type="checkbox" style="margin-right: -1px;" name="_spring_security_remember_me" /> 
									<label class="label-new">记住我在此计算机上的登录</label>
								</div>
							</fieldset>
						
							<fieldset>
								<div>
									<label>
									<span id="error" style="color:Red">
										<c:if test="${not empty sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}">
											对不起, 您的用户名和密码不正确 - 请重新尝试.
										</c:if>
									</span>
									</label>
								</div>
							</fieldset>
						</fieldset>	

					</div>
					<div class="logindiv">
						<input id="Submit" name="Submit" type="button" value="登录" class="ui-button"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
						<input id="reset" name="reset" type="button" value="重置" class="ui-button" />
					</div>
					
					<div class="recommendExplorer" ><p><font color="red">*</font>推荐使用火狐或IE10+浏览器</p></div>
				</form>
			</section>
		</div>
	</div>

	<div class="contain-admin">
		<a href="" class="has-question">如有问题，请联系系统管理员</a>
	</div>
	
</body>
</html>

