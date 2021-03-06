<%@page import="com.axatp.claimnet.page.SystemContext"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<script>
$(document).ready(function(){
	  $(".pagination").find("a").click(function(){
		var url = $(this).attr('href');
		if(typeof(url) != "undefined"){
			var pageUrl = $(this).find("input").val();
			$(".form-horizontal").attr("action", pageUrl).submit();
			$(".form-horizontal").removeAttr("action");	
		}
	  });
});
</script>


<div class="pull-right">
<pg:pager export="curPage=pageNumber" 
	items="${param.totalRecord }" 
	maxPageItems="<%=SystemContext.getPageSize() %>"
	url="${param.url }">

		<c:forEach items="${param.params }" var="p">
			<pg:param name="${p }"/>
		</c:forEach>
		<ul class="pagination">
			<li>
				<a>共<pg:last><font color="red">${pageNumber }</font> 页</a>
				<a>每页显示<font color="red"><%=SystemContext.getPageSize() %></font>条</pg:last></a>
			</li>
			
			
			<pg:first>
				<li>
					<a href="#"><input type='hidden' value="${pageUrl }"/>首页</a>
				</li>
			</pg:first>
			<pg:prev>
				<li>
					<a href="#"><input type='hidden' value="${pageUrl }"/>上一页</a>
				</li>
			</pg:prev>
			<pg:pages>
				<c:if test="${curPage eq pageNumber }">
					<li><a>${pageNumber }</a></li>
				</c:if>
				<c:if test="${curPage != pageNumber }">
					<li><a href="#"><input type='hidden' value="${pageUrl }"/>${pageNumber }</a></li>
				</c:if>
			</pg:pages>
			<pg:next>
				<li>
					<a href="#"><input type='hidden' value="${pageUrl }"/>下一页</a>
				</li>
			</pg:next>
			<pg:last>
				<li>
					<a href="#"><input type='hidden' value="${pageUrl }"/>尾页</a>
				</li>
			</pg:last>
			</pg:pager>
			<li>
				<a>共<font color="red">${param.totalRecord }</font>条记录</a>
			</li>
		</ul>
</div>
