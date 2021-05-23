<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>

<script type="text/javascript">
	layui.use([ 'form', 'layer' ], function() {
		var form = layui.form, layer = layui.layer;

		//监听提交
		form.on('submit(4123)', function(data) {
			return false;
		});

		form
				.verify({
					username : function(value, item) { //value：表单的值、item：表单的DOM对象
						if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$")
								.test(value)) {
							return '用户名不能有特殊字符';
						}
						if (/(^\_)|(\__)|(\_+$)/.test(value)) {
							return '用户名首尾不能出现下划线\'_\'';
						}
						if (/^\d+\d+\d$/.test(value)) {
							return '用户名不能全为数字';
						}
					}

					//我们既支持上述函数式的方式，也支持下述数组的形式
					//数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
					,
					pass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ]
				});
	});
</script>

<script type="text/javascript">
	$(function() {
		//登录
		$("#btn").click(function() {
			var data = $("#form").serialize();//序列化表单
			$.ajax({
				type : "post",
				url : "userservlet?method=register",
				data : data,
				dataType : "text", //返回数据类型
				success : function(msg) {
					if ("registerfail" == msg) {
						$.messager.alert("消息提醒", "注册失败!", "warning");
						window.location.href = "login.jsp";
					} else if ("adminregistersuccess" == msg) {
						window.location.href = "listuser.jsp";
					} else {
						window.location.href = "login.jsp";
					}
				}

			});
		});
	})
</script>
<title>注册</title>
</head>
<body>
	<form class="layui-form" id="form" onsubmit="return checkAll();">
		<c:if test="{param.user=='admin'}">
			<a title="返回" class="layui-btn"
				href="${pageContext.request.contextPath}/system.jsp">返回试试</a>
		</c:if>

		<c:if test="{param.user==''}">
			<a title="返回" class="layui-btn"
				href="${pageContext.request.contextPath}/login.jsp">返回试试</a>
		</c:if>

		<div class="layui-main" style="margin-top: 50px; width: 600px;">
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="username" required
						lay-verify="required|username" placeholder="请输入用户名"
						autocomplete="off" class="layui-input"> <input
						type="hidden" name="user" value="${param.user }">
				</div>
				<div class="layui-form-mid layui-word-aux">用户名不能有特殊符号</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="password" required
						lay-verify="required|pass|number" placeholder="请输入密码"
						autocomplete="off" class="layui-input password">
				</div>
				<div class="layui-form-mid layui-word-aux">密码必须6到12位，由数字组成</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">确认密码</label>
				<div class="layui-input-inline">
					<input type="password" name="passwordsure" required
						lay-verify="required|pass|number" placeholder="请输入密码"
						autocomplete="off" class="layui-input passwordsure">
				</div>
				<div class="layui-form-mid layui-word-aux">两次密码要求一致</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">真实姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="name" required lay-verify="required"
						placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">身份证号</label>
				<div class="layui-input-inline">
					<input type="text" name="credit" required
						lay-verify="required|identity" placeholder="请输入身份证号"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">性别</label>
				<div class="layui-input-inline">
					<input type="radio" name="sex" value="男" title="男"> <input
						type="radio" name="sex" value="女" title="女" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="yx" required lay-verify="email"
						placeholder="请输入邮箱" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">机构全称</label>
				<div class="layui-input-inline">
					<input type="text" name="dept" required lay-verify="required"
						placeholder="请输入工作单位" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">邮政编码</label>
				<div class="layui-input-inline">
					<input type="text" name="post" required lay-verify=""
						placeholder="请输入邮政编码" autocomplete="off" class="layui-input">
				</div>
			</div>


			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">手机号</label>
				<div class="layui-input-inline">
					<input type="text" name="gddh" required lay-verify="phone"
						placeholder="请输入手机号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 17px">地址</label>
				<div class="layui-input-inline">
					<select name="province" lay-verify="">
						<option value=""></option>
						<option value="北京">北京</option>
						<option value="上海">上海</option>
						<option value="广州">广州</option>
						<option value="深圳">深圳</option>
						<option value="杭州">杭州</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-inline"
					style="margin-left: 117px; margin-top: 10px;">
					<button class="layui-btn" id="btn" lay-submit lay-filter="*">立即提交</button>

					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	//第一次输入密码，丢失焦点事件
	function check2Pwd1() {
		//获取第一次输入的密码
		var newPwd1 = $(".passwordsure").val();

		//获取第二次输入的密码
		var newPwd2 = $(".password").val();

		//判断是够有再次输入密码，如果有，则进行两次输入值检查
		if (newPwd2 != null && newPwd2.length > 0) {
			return check2Pwd2();
		}

		return false;
	}
	//第二次输入密码时，丢失焦点触发此方法
	function check2Pwd2() {

		//获取第一次输入的密码
		var newPwd1 = $(".passwordsure").val();

		//获取第二次输入的密码
		var newPwd2 = $(".password").val();

		//获取提示信息的span

		//进行判断是否相同
		if (newPwd1 == newPwd2) {

			alert("注册成功");
			return true;
		} else {
			alert("两次密码不一致！");
			return false;
		}
	}

	//总验证，在提交表单时
	function checkAll() {
		var a = check2Pwd1();
		var b = check2Pwd2();
		return a && b;
	}
</script>
</html>

