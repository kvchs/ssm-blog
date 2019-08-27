<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!-- 增加jstl标签支持后，才能引入其他的jsp文件 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Index</title>
	<%-- <!-- href前面带/代表是绝对路径 -->
    <!-- 字体图标样式 -->
    <link href="${pageContext.request.contextPath}/static/css/icomoon.css" rel="stylesheet">
    <!-- 动画样式 -->
    <link href="${pageContext.request.contextPath}/static/css/animate.css" rel="stylesheet">
    <!-- 核心样式 -->
    <link href="${pageContext.request.contextPath}/static/css/common.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/lib/jquery-1.7.2.min.js"></script>
    <!-- 全局动态修改 -->
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <!-- 核心组件 -->
    <script src="${pageContext.request.contextPath}/static/js/javaex.js"></script>
    <!-- 表单验证 -->
    <script src="${pageContext.request.contextPath}/static/js/javaex-formVerify.js"></script> --%>
</head>
<body>
<div class="wrap">
	<!-- 头部 -->
	<div id="header">
		<c:import url="header.jsp"></c:import>
	</div>

	<!-- 左侧菜单和主体内容 -->
	<div class="grid-1-7" style="flex: 1;margin:0;">
		<c:import url="menu.jsp"></c:import>
	</div>

</div>

</body>
</html>