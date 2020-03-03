<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center"> 员工信息列表</h1>
	<table border="1px" align="center" width="70%">
		<tr>
			<th>ID</th>
			<th>LastName</th>
			<th>Email</th>
			<th>Gender</th>
			<th>DeptName</th>
			<th>Operation</th>
		</tr>
		
		<c:forEach items="${emps}" var="emp">
			<tr align="center">
				<td>${emp.id }</td>
				<td>${emp.lastName }</td>
				<td>${emp.email }</td>
				<td>${emp.gender==0?'女':'男' }</td>
				<td>${emp.dept.deptName }</td>
				<td>
					<a href="#">DELETE</a>
					&nbsp;&nbsp;
					<a href="#">UPDATE</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<c:set var="basePath" value="${pageContext.request.contextPath }"></c:set>
	
	<!-- 分页 -->
	<h2 align="center">
		<a href="${basePath}/emps/1">首页</a>
		<c:if test="${info.pageNum>1 }">
			<a href="${basePath}/emps/${info.pageNum-1}">上一页</a>
		</c:if>
		<c:if test="${info.pageNum<=1 }">
			上一页
		</c:if>
		
		<c:forEach items="${info.navigatepageNums }" var="num">
			<c:if test="${info.pageNum==num}">
				<a href="${basePath }/emps/${num}"><font color='green'>${num}</font></a> 
			</c:if>
			<c:if test="${info.pageNum!=num}">
				<a href="${basePath }/emps/${num}">${num}</a>
			</c:if>
		</c:forEach>
		
		
		<c:if test="${info.pageNum < info.pages }">
			<a href="${basePath}/emps/${info.pageNum+1 }">下一页</a>
		</c:if>
		<c:if test="${info.pageNum >= info.pages }">
			下一页
		</c:if>
		
		<a href="${basePath}/emps/${info.pages}">尾页</a>
	
	</h2>
	
	
	<h2 align="center"><a href="#">Add New Employee</a></h2>
</body>
</html>