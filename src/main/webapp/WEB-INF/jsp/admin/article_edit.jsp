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
<!--代码高亮-->
<!-- <link href="javaex/pc/lib/highlight/highlight.css" rel="stylesheet" />
<script src="javaex/pc/lib/highlight/highlight.min.js"></script>
切记：下面这行代码只能在展示页面和无需回显编辑的页面使用
<script>hljs.initHighlightingOnLoad();</script> -->

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
					class="active">文章编辑</span>
			</div>

			<!-- 表格 -->
			<!--主体内容-->
			<div class="list-content">
				<!--块元素-->
				<div class="block">
				
					<!--修饰块元素名称-->
					<div class="banner">
						<p class="tab fixed">文章编辑</p>
					</div>

					<!--正文内容-->
					<div class="main">
						<form id="form">
							<!--文本框-->
							<div class="unit clear">
								<div class="left">
									<span class="required">*</span>
									<p class="subtitle">文章标题</p>
								</div>
								<div class="right">
									<input type="text" class="text" data-type="必填"
										error-msg="文章标题错误" error-pos="42" placeholder="请输入文章标题" />
								</div>
							</div>

						

							<!--下拉选择框-->
							<div class="unit clear">
								<div class="left">
									<p class="subtitle">文章分类</p>
								</div>
								<div class="right">
									<select id="type_id">
										<c:forEach items="${typeList}" var="typeInfo" varStatus="status">
										<tr>
									<option value="${typeInfo.id}">${typeInfo.name}</option>
										</tr>
							</c:forEach>
									</select>
								</div>
							</div>
							
							<!-- 封面 -->
							<div class="unit clear">
								<div class="left">
									<p class="subtitle">文章封面</p>
								</div>
								<div class="right">
									<a href="javascript:;">
										<label id="container2" for="upload2" style="display: inline-block; width:132px;height:74px;">
											<img class="upload-img-cover" src="${pageContext.request.contextPath}/static/images/upAvatar.jpg" width="100%" height="100%">
										</label>
										<input type="file" class="hide" id="upload2" accept="image/gif, image/jpeg, image/jpg, image/png" />
									</a>
								
								
								</div>
							</div>

							<!--日期选择框-->
							<div class="unit clear">
								<div class="left">
									<p class="subtitle">注册时间</p>
								</div>
								<div class="right">
									<input type="text" id="date" class="ex-date"
										style="width: 200px;" value="" readonly />
								</div>
							</div>

							<!--文本域-->
							<div class="unit clear">
								<div class="left">
									<p class="subtitle">内容</p>
								</div>
								<div class="right">
									<div id="edit" class="edit-container">测试回显</div>
									<input type="hidden" id="contentHtml" name="contentHtml" value="" />
									<input type="hidden" id="contentText" name="contentText" value="" />
								</div>
							</div>

							<!--标签-->
							<div class="unit clear">
								<div class="left">
									<p class="subtitle">标签</p>
								</div>
								<div class="right">
									<div class="tagbox"></div>
									<input type="hidden" id="tag" name="tag" value="" />
								</div>
							</div>

							<!--提交按钮-->
							<div class="unit clear" style="width: 800px;">
								<div style="text-align: center;">
									<!--表单提交时，必须是input元素，并指定type类型为button，否则ajax提交时，会返回error回调函数-->
									<input type="button" id="return" class="button no" value="返回" />
									<input type="button" id="save" class="button yes" value="保存" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
<script>

javaex.select({
	id : "type_id",
	isSearch : false,
	// 回调函数
	callback: function (rtn) {
		console.log("selectValue:" + rtn.selectValue);
		console.log("selectName:" + rtn.selectName);
	}
});


javaex.upload({
	type : "image",
	id : "upload2",	// <input type="file" />的id
	url: "upload",
	//containerId : "container",	// 容器id
	param:"file",
	dataType : "url",	// 返回的数据类型：base64 或 url
	callback : function (rtn) {
		console.log(rtn);
		
		if (rtn.success==true) {
			$("#container2 img").attr("src", "/upload/" + rtn.data);
		} else {
			javaex.optTip({
				content : rtn.error,
				type : "error"
			});
		}
	}
});


javaex.edit({
		id : "edit",
		image : {
			url : "upload.json",	// 请求路径
			param : "file",		// 参数名称，Spring中与MultipartFile的参数名保持一致
			dataType : "url",	// 返回的数据类型：base64 或 url
			isShowOptTip : true,	// 是否显示上传提示
			rtn : "rtnData",	// 后台返回的数据对象，在前台页面用该名字存储
			imgUrl : "data"	// 根据返回的数据对象，获取图片地址。  例如后台返回的数据为：{code: "000000", message: "操作成功！", data: {imgUrl: "/1.jpg"}}
		},
		isInit : true,
		callback : function(rtn) {
			$("#contentHtml").val(rtn.html);
			$("#contentText").val(rtn.text);
		}
	}); 
</script>
</body>
</html>
