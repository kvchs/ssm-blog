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
					<button class="button blue radius-3" id="add"><span class="icon-plus"></span> 添加</button>
					<button class="button green" id="save"><span class="icon-check2"></span> 保存</button>
					<button class="button red radius-3" id="delete"><span class="icon-close2"></span> 删除</button>
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
							<td><input type="checkbox" value="${entity.id}" class="fill listen-1-2" name="id"> </td>
							<td><input type="text" name="sort" data-type="正整数" value="${entity.sort}" error-msg="必须为正整数" style="width:50;"></td>
							<td><input type="text" name="name" data-type="必填" placeholder="请输入类型名称"  style="width:100;" value="${entity.name}"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
		</div>

	</div>
<script>
	$("#add").click(function(){
		var html = '';
		html += '<tr>';
		html += '<td><input type="checkbox" value="${entity.id}" class="fill listen-1-2" name="id"> </td>';
		html += '<td><input type="text" name="sort" data-type="正整数" value="${entity.sort}" error-msg="必须为正整数" style="width:50;"></td>';
		html += '<td><input type="text" name="name" data-type="必填" placeholder="请输入类型名称"  style="width:100;" value=""></td>';
		html += '</tr>';
		$("#table tbody").append(html);
		/* 重新渲染页面 */
		javaex.render();
	});
	
	var idArr = new Array();
	var sortArr = new Array();
	var nameArr = new Array();
	/* 点击保存按钮 */
	$("#save").click(function(){
		if(javaexVerify()){
			idArr = [];
			sortArr = [];
			nameArr = [];
			$(':checkbox[name="id"]').each(function(){
				idArr.push($(this).val());
			});
			$(':input[name="sort"]').each(function(){
				sortArr.push($(this).val());
			});
			$(':input[name="name"]').each(function(){
				nameArr.push($(this).val());
			});
			
			$.ajax({
				url: "${pageContext.request.contextPath}/type/save_type",
				type: "post",
				/* 返回值类型 */
				dataType: "json",
				/* 添加数组数据支持 */
				traditional: "true",
				/* 传输的数据  */
				data:{
					"idArr": idArr,
					"sortArr": sortArr,
					"nameArr": nameArr
				},
				success: function(rtn){
					console.log(rtn);
					if(rtn.success==true){
						javaex.optTip({
							content: rtn.data
						});
						// 延迟加载
						setTimeout(function(){
							window.location.reload();
						});
					}else{
						javaex.optTip({
							content: rtn.error,
							type: "error"
						});
					}
				}
			});
		}
	});
	
	/* 点击删除按钮 */
	$("#delete").click(function(){
		idArr=[];
		/* 遍历所有被勾选的复选框 */
		$(':checkbox[name="id"]:checked').each(function(){
			console.log($(this).val());
			var id = $(this).val();
			if(id!=""){
			    idArr.push(id);
			}
			
		});
		console.log("===========");
		console.log(idArr);
		/* 判断勾选的是否是新增的空白记录 */
		if(idArr.length==0){
			//console.log(idArr);
			/* 前提无刷新新增的类型 */
			$(':checkbox[name="id"]:checked').each(function(){
				
				$(this).parent().parent().parent().remove();
			});
		}else{
			
			$.ajax({
				url: "${pageContext.request.contextPath}/type/delete",
				type: "post",
				/* 返回值类型 */
				dataType: "json",
				/* 添加数组数据支持 */
				traditional: "true",
				/* 传输的数据  */
				data:{
					"idArr": idArr
				},
				success: function(rtn){
					console.log(rtn);
					if(rtn.success==true){
						javaex.optTip({
							content: rtn.data
						});
						// 延迟加载
						setTimeout(function(){
							window.location.reload();
						});
					}else{
						javaex.optTip({
							content: rtn.error,
							type: "error"
						});
					}
				}
			});
			
		}
	});

</script>
</body>
</html>
