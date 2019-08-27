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
					class="active">文章分类</span>
			</div>
			
			<!-- 表格 -->
			<!--主体内容-->
<div class="list-content">
	<!--块元素-->
	<div class="block">
		<!--页面有多个表格时，可以用于标识表格-->
		<h2>文章分类</h2>
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
					<button class="button blue radius-3"><span class="icon-plus"></span> 添加</button>
					<button class="button red radius-3"><span class="icon-close2"></span> 删除</button>
				</div>
			</div>
			<table id="table" class="table">
				<thead>
					<tr>
						<th class="checkbox"><input type="checkbox" class="fill listen-1" /> </th>
						<th>显示顺序</th>
						<th>分类名称</th>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="entity" varStatus="status">
						<tr>
							<td><input type="checkbox" value="${entity.id}" class="fill listen-1-2"> </td>
							<td><input type="text" name="sort" data-type="正整数" value="${entity.sort}" error-msg="必须为正整数"></td>
							<td>${entity.name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
		</div>

	</div>













	<%-- 	<div class="wrap">
			<!-- 头部 -->
			<div id="header">
				<c:import url="header.jsp"></c:import>
			</div>

			<!-- 左侧菜单和主体内容 -->
			<div class="grid-1-7" style="flex: 1; margin: 0;">
				<c:import url="menu.jsp"></c:import>

				<div class="content">
					<div class="content-header">
						<div class="breadcrumb">
							<span>权限配置</span> <span class="divider">/</span> <span
								class="active">角色管理</span>
						</div>

						<!-- 主体内容 -->
						<!--主体内容-->
						<div class="list-content clear">
							<!--块元素-->
							<div class="block">
								<!--页面有多个表格时，可以用于标识表格-->
								<h2>标题</h2>
								<!--右上角的返回按钮-->
								<a href="javascript:history.back();">
									<button class="button indigo radius-3"
										style="position: absolute; right: 20px; top: 16px;">
										<span class="icon-arrow_back"></span> 返回
									</button>
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
											<button class="button blue radius-3">
												<span class="icon-plus"></span> 添加
											</button>
											<button class="button red radius-3">
												<span class="icon-close2"></span> 删除
											</button>
										</div>
									</div>
									<table id="table" class="table color2">
										<thead>
											<tr>
												<th class="checkbox"><input type="checkbox"
													class="fill listen-1" /></th>
												<th>序号</th>
												<th>市区</th>
												<th>省区</th>
												<th>国别</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="checkbox"><input type="checkbox"
													class="fill listen-1-2" /></td>
												<td>1</td>
												<td>苏州</td>
												<td>江苏省</td>
												<td>中国</td>
											</tr>
											<tr>
												<td class="checkbox"><input type="checkbox"
													class="fill listen-1-2" /></td>
												<td>2</td>
												<td>无锡</td>
												<td>江苏省</td>
												<td>中国</td>
											</tr>
											<tr>
												<td class="checkbox"><input type="checkbox"
													class="fill listen-1-2" /></td>
												<td>3</td>
												<td>常州</td>
												<td>江苏省</td>
												<td>中国</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
 --%>

	<script>
		var hightUrl = "xxxx";
		javaex.menu({
			id : "menu",
			isAutoSelected : true,
			key : "",
			url : hightUrl
		});

		$(function() {
			// 设置左侧菜单高度
			setMenuHeight();
		});

		/**
		 * 设置左侧菜单高度
		 */
		function setMenuHeight() {
			var height = document.documentElement.clientHeight
					- $("#admin-toc").offset().top;
			height = height - 10;
			$("#admin-toc").css("height", height + "px");
		}

		// 控制页面载入
		function page(url) {
			$("#page").attr("src", url);
		}
	</script>
</body>
</html>
