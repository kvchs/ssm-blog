<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--字体图标-->
<link href="http://cdn.javaex.cn/javaex/pc/css/icomoon.css" rel="stylesheet" />
<!--动画-->
<link href="http://cdn.javaex.cn/javaex/pc/css/animate.css" rel="stylesheet" />
<!--骨架样式-->
<link href="http://cdn.javaex.cn/javaex/pc/css/common.css" rel="stylesheet" />
<!--皮肤（缇娜）-->
<link href="http://cdn.javaex.cn/javaex/pc/css/skin/tina.css" rel="stylesheet" />
<!--jquery，不可修改版本-->
<script src="http://cdn.javaex.cn/javaex/pc/lib/jquery-1.7.2.min.js"></script>
<!--全局动态修改-->
<script src="http://cdn.javaex.cn/javaex/pc/js/common.js"></script>
<!--核心组件-->
<script src="http://cdn.javaex.cn/javaex/pc/js/javaex.min.js"></script>
<!--表单验证-->
<script src="http://cdn.javaex.cn/javaex/pc/js/javaex-formVerify.js"></script>
<!--顶部导航-->
	<div class="admin-navbar">
		<div class="admin-container-fluid clear">
			<!--logo名称-->
			<div class="admin-logo">SSM-BLOG</div>

			<!--导航-->
			<!-- <ul class="admin-navbar-nav fl">
				<li class="active"><a href="/admin/index">总览</a></li>
				<li><a href="/admin/nav1">导航1</a></li>
				<li><a href="/admin/nav2">导航2</a></li>
			</ul> -->

			<!--右侧-->
			<ul class="admin-navbar-nav fr">
				<li>
					<a href="javascript:;">欢迎您，管理员</a>
					<ul class="dropdown-menu" style="right: 10px;">
						<li><a href="${pageContext.request.contextPath}/admin/logout">退出当前账号</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>


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
		var height = document.documentElement.clientHeight - $("#admin-toc").offset().top;
		height = height - 10;
		$("#admin-toc").css("height", height+"px");
	}

	// 控制页面载入
	/* function page(url) {
		$("#page").attr("src", url);
	} */
</script>