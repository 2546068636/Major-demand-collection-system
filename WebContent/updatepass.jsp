<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>问卷调查界面</title>
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>

<script>
	layui
			.use(
					[ 'tree', 'layer', 'util', 'form', 'laydate' ],
					function() {
						var tree = layui.tree, layer = layui.layer, util = layui.util, form = layui.form, laydate = layui.laydate

					});
</script>
</head>
<body style="margin-top: 15px; margin-left: 33px;">
	<div style="text-align: center;">
		<h1>修改密码</h1>

	</div>
	<form class="layui-form" method="post" id="form"
		style="margin-left: 500px;">
		<div style="margin-top: 25px;">
			<div class="layui-form-item"></div>
			<div class="layui-form-item">
				<label class="layui-form-label"
					style="font-size: 12pxl; font-style: SimHei">新密码</label>
				<div class="layui-input-inline">
					<input type="hidden" value="${param.username }" name="username">
					<input type="text" name="password" id="password" required
						lay-verType="tips" lay-verify="required" autocomplete="off"
						class="layui-input">
				</div>

				<!-- 				    <div style="float: right;">

				    </div> -->
			</div>

			<div class="layui-form-item">
				<div class="layui-input-inline"
					style="margin-left: 117px; margin-top: 10px;">
					<button class="layui-btn" id="btn" lay-submit lay-filter="*">修改</button>

					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</div>

	</form>
</body>
<script type="text/javascript">
	$(function() {
		//登录
		$("#btn").click(function() {
			var data = $("#form").serialize();//序列化表单
			$.ajax({
				type : "post",
				url : "userservlet?method=updatepassword",
				data : data,
				dataType : "text", //返回数据类型
				success : function(msg) {
					if ("修改成功" == msg) {
						alert("修改成功");
						window.history.go(-1);
					} else if ("修改失败" == msg) {
						alert("修改失败");
						window.history.go(-1);
					}
				}

			});
		});
	})
</script>



</html>