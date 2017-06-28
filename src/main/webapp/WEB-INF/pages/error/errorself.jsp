<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isErrorPage="true"%>
<%@ include file="/WEB-INF/pages/common.jsp"%>

<title>抱歉，出错了</title>
<body class="login-body">  
	<div class="login-info">
		<div class="panel-inner">
			<section class="panel-content">
				<h1 class="welcome-title">${errorMsg }</h1>  
				<div class="exit-info">  
					<p><strong>系统将在5秒内返回，如果没有返回，请点击<a href="javascript:history.go(-1);">这里</a></strong></p>  
				</div> 
			</section>
		</div>
	</div>  
</body>


<script type="text/javascript">
	$(function(){
		setTimeout(function(){
			history.go(-1);
		}, 5000)
	})
</script>


