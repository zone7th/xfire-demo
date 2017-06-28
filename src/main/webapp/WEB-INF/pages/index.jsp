<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<head>
    <meta charset="utf-8">
	<%@ include file="/WEB-INF/pages/common.jsp"%>
    <title>欢迎使用安盛天平应用管理中心（AMC）</title>
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
<body id="custom-parent-body">
<!--<![endif]-->

<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">
            <li id="fat-menu" class="dropdown second-li">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-user"></i> <sec:authentication property="name"/>
                    <i class="icon-caret-down"></i>
                </a>
                
                <ul class="dropdown-menu list-menu">
                    <li><a tabindex="-1" href="#">我的账户</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" href="${pageContext.request.contextPath}/j_spring_security_logout">登出</a></li>
                </ul>
            </li>

        </ul>
        
        <ul class="nav pull-right" style="margin-top: -1px;margin-right: 10px;">
        	<a href="<%=request.getContextPath() %>/index"><img class="hotlineposition" src="resources/images/haoit.jpg" /><span class="hotline">服务热线 4001000360</span></a>
        </ul>
        <a class="brand" href="<%=request.getContextPath() %>/index"><img class="logoposition" src="resources/images/logo.png" /><span class="second">安盛天平理赔应用管理平台</span><span class="versionNumber">V1.0</span></a>
    </div>
</div>

<div class="sidebar-nav">
	<!--<sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_MID,ROLE_OPS,ROLE_DEV">
	    <a href="#version-menu" class="nav-header" data-toggle="collapse"><i class="icon-paste"></i></a>
	    <ul id="version-menu" class="nav nav-list collapse in">
	      <li><a href="<%=request.getContextPath() %>/task/list" target="mainFrame"></a></li>
	        
	        <sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_MID">
	        	<li><a href="<%=request.getContextPath() %>/publish/uat" target="mainFrame"></a></li>
	        </sec:authorize>
	        
	        <sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_MID,ROLE_OPS">
		        <li><a href="<%=request.getContextPath() %>/publish/preprod" target="mainFrame"></a></li>
		        <li><a href="<%=request.getContextPath() %>/publish/gray" target="mainFrame"></a></li>
		        <li><a href="<%=request.getContextPath() %>/publish/prod" target="mainFrame"></a></li>
	        </sec:authorize> 
	    </ul>
    </sec:authorize>
    
    
    <sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_MID,ROLE_OPS">
	    <a href="#service-menu" class="nav-header" data-toggle="collapse"><i class="icon-cog"></i></a>
	    <ul id="service-menu" class="nav nav-list collapse">
	      <sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_MID">
	        	<li><a href="<%=request.getContextPath() %>/maintenance/uat/list" target="mainFrame">UAT服务维护</a></li>
	        </sec:authorize>
	        
	        <sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_MID,ROLE_OPS">
	        	<li><a href="<%=request.getContextPath() %>/maintenance/preprod/list" target="mainFrame">预生产服务维护</a></li>
	        	<li><a href="<%=request.getContextPath() %>/maintenance/gray/list" target="mainFrame">灰度服务维护</a></li>
	        	<li><a href="<%=request.getContextPath() %>/maintenance/prod/list" target="mainFrame">生产服务维护</a></li>
	        </sec:authorize>
	        
	        
	        <sec:authorize ifAnyGranted="ROLE_ADMIN,ROLE_MID,ROLE_OPS">
	        <li><a href="<%=request.getContextPath() %>/maintenancelog/list" target="mainFrame">服务维护日志</a></li>
	        </sec:authorize> 
	    </ul>
    </sec:authorize>
    
	
	<sec:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_MID,ROLE_OPS,ROLE_DEV">
	    <a href="#log-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i></a>
    <ul id="log-menu" class="nav nav-list collapse">
	        <li><a href="<%=request.getContextPath() %>/logserver/uat/list" target="mainFrame">UAT日志服务器列表</a></li>
	        <li><a href="<%=request.getContextPath() %>/logserver/preprod/list" target="mainFrame">预生产日志服务器列表</a></li>
	        <li><a href="<%=request.getContextPath() %>/logserver/gray/list" target="mainFrame">灰度日志服务器列表</a></li>
	        <li><a href="<%=request.getContextPath() %>/logserver/prod/list" target="mainFrame">生产日志服务器列表</a></li>
	     </ul>
    </sec:authorize>
    
    <sec:authorize ifAnyGranted="ROLE_ADMIN">
	    <a href="#datastatistics-menu" class="nav-header" data-toggle="collapse"><i class="icon-align-left"></i></a>
	    <ul id="datastatistics-menu" class="nav nav-list collapse">
	       <li><a href="<%=request.getContextPath() %>/datastatistics/list" target="mainFrame">版本日历</a></li>
	        
	     </ul>
    </sec:authorize>

	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	    <a href="#auth-menu" class="nav-header" data-toggle="collapse"><i class="icon-key"></i></a>
	    <ul id="auth-menu" class="nav nav-list collapse">
	     	<!--    <li><a href="<%=request.getContextPath() %>/role/list" target="mainFrame">角色管理</a></li>
	        <li><a href="<%=request.getContextPath() %>/resc/list" target="mainFrame">资源管理</a></li>
	     </ul>
    </sec:authorize>
    
    <sec:authorize ifAnyGranted="ROLE_ADMIN">
	    <a href="#system-menu" class="nav-header" data-toggle="collapse"><i class="icon-legal"></i></a>
	    <ul id="system-menu" class="nav nav-list collapse">
	    		<li><a href="<%=request.getContextPath() %>/appserver/uat/list" target="mainFrame">UAT应用服务器管理</a></li>
	        <li><a href="<%=request.getContextPath() %>/appserver/preprod/list" target="mainFrame">预生产应用服务器管理</a></li>
	        <li><a href="<%=request.getContextPath() %>/appserver/gray/list" target="mainFrame">灰度应用服务器管理</a></li>
	        <li><a href="<%=request.getContextPath() %>/appserver/prod/list" target="mainFrame">生产应用服务器管理</a></li>
	        <li><a href="<%=request.getContextPath() %>/dictionary/list" target="mainFrame">系统字典管理</a></li>
	    </ul>
    </sec:authorize> --> 
</div>
<div class="content">
	<!-- <iframe name="mainFrame" id="mainFrame" frameborder="0" src="<%=request.getContextPath() %>/home" style="margin:0 auto;width:100%;height:30%;"></iframe> -->
	<iframe name="mainFrame" id="mainFrame" frameborder="0"  style="margin:0 auto;width:100%;height:30%;"></iframe> 
</div>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
		
		function setFrame(){
			var mainFrame = document.getElementById("mainFrame");
		    var bheight = document.documentElement.clientHeight; 
			mainFrame.style.width = '100%';
			mainFrame.style.height = (bheight  - 51) + 'px';
			
		}
	    setFrame();
		window.onresize=function(){  
			setFrame();
		}
		
		//页面跳转，菜单对应应变化
		$(".sidebar-nav ul li a").click(function(){
			//祛除所有样式
			$(".sidebar-nav ul li a").css({"background":"#F6F6F6 none repeat scroll 0% 0%"});
			//添加样式
			$(this).css({"background":"#E0E0E8 none repeat scroll 0% 0%"});
		})
		
		 $(".sidebar-nav>a").click(function(){
			//祛除所有样式
			$(".sidebar-nav ul li a").css({"background":"#F6F6F6 none repeat scroll 0% 0%"});
			$(".sidebar-nav>ul").attr("class","nav nav-list collapse");
		}) 
		
	</script>

</body>
</html>
