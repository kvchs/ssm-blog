<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<!-- href前面带/代表是绝对路径 -->
<!--字体图标-->
<link href="http://cdn.javaex.cn/javaex/pc/css/icomoon.css"
	rel="stylesheet" />
<!--动画-->
<link href="http://cdn.javaex.cn/javaex/pc/css/animate.css"
	rel="stylesheet" />
<!--骨架样式-->
<link href="http://cdn.javaex.cn/javaex/pc/css/common.css"
	rel="stylesheet" />
<!--皮肤（缇娜）-->
<link href="http://cdn.javaex.cn/javaex/pc/css/skin/tina.css"
	rel="stylesheet" />
<!--jquery，不可修改版本-->
<script src="http://cdn.javaex.cn/javaex/pc/lib/jquery-1.7.2.min.js"></script>
<!--全局动态修改-->
<script src="http://cdn.javaex.cn/javaex/pc/js/common.js"></script>
<!--核心组件-->
<script src="http://cdn.javaex.cn/javaex/pc/js/javaex.min.js"></script>
<!--表单验证-->
<script src="http://cdn.javaex.cn/javaex/pc/js/javaex-formVerify.js"></script>

<title>Insert title here</title>
</head>
<body>

	<!--顶部导航-->
	<div class="admin-navbar">
		<div class="admin-container-fluid clear">
			<div class="wrap">
				<!-- 头部 -->
				<div id="header">
					<c:import url="header.jsp"></c:import>
				</div>
			</div>
		</div>
	</div>

	<div class="admin-mian">
		<!--左侧菜单-->
		<div class="admin-aside admin-aside-fixed">
			<!-- 左侧菜单和主体内容 -->
			<div class="grid-1-7" style="flex: 1; margin: 0;">
				<c:import url="menu.jsp"></c:import>
			</div>
		</div>
		<!-- 主体内容位置 -->

		<div class="content">
			<div class="breadcrumb">
				<span>分类管理</span> <span class="divider">/</span> <span
					class="active">文章列表</span>
			</div>
			
			<!-- 表格 -->
			<!--主体内容-->
<div class="list-content">
	<!--块元素-->
	<div class="block">
		<!--页面有多个表格时，可以用于标识表格-->
		<h2>文章列表</h2>
		<!--右上角的返回按钮-->
		<a href="javascript:history.back();">
			<button class="button indigo radius-3" style="position: absolute;right: 20px;top: 16px;"><span class="icon-arrow_back"></span> 返回</button>
		</a>
		
		<!--正文内容-->
		<div class="main">
			<!--表格上方的搜索操作-->
			<div class="admin-search">
				<div class="input-group">
					<input type="text" class="text" placeholder="提示信息" />
					<button class="button blue">搜索</button>
				</div>
			</div>
			
			<!--表格上方的操作元素，添加、删除等-->
			<div class="operation-wrap">
				<div class="buttons-wrap">
					<a href="edit"><button class="button blue radius-3" id="add"><span class="icon-plus"></span> 添加</button></a>
					<button class="button green" id="save"><span class="icon-check2"></span> 保存</button>
					<button class="button red radius-3" id="delete"><span class="icon-close2"></span> 删除</button>
				</div>
			</div>
			<table id="table" class="table">
				<thead>
					<tr>
						<th class="checkbox"><input type="checkbox" class="fill listen-1" /> </th>
						<th style="width:60px;">序号</th>
						<th>分类</th>
						<th>文章标题</th>
						<th>编写日期</th>
						<th>阅读量</th>
						<th>编辑</th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list)==0}">
						<tr>
							<td colspan="7" style="text-align:center;">暂无记录</td>
						</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${pageInfo.list}" var="entity" varStatus="status">
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
		</div>

	</div>

</body>
</html>
