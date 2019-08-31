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
<!--主题内容-->
<div class="admin-mian">
	<!--左侧菜单-->
	<div class="admin-aside admin-aside-fixed">
		<h1><span class="admin-nav-name">总览</span></h1>
		<div id="admin-toc" class="admin-toc">
			<div class="menu-box">
				<div id="menu" class="menu">
					<ul>
						<li class="menu-item hover">
							<a href="javascript:page('iframe-page.html');">管理中心</a>
						</li>
						<li class="menu-item">
							<a href="javascript:;">分类管理<i class="icon-keyboard_arrow_left"></i></a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/type/list">文章分类</a></li>
								<li><a href="javascript:page('/admin/user/password');">修改密码</a></li>
							</ul>
						</li>
						
						<li class="menu-item">
							<a href="javascript:;">文章管理<i class="icon-keyboard_arrow_left"></i></a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/article/list">文章列表</a></li>
								<li><a href="javascript:page('/admin/user/password');">回收站</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
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