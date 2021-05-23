<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
<script>
	layui.use('table', function() {
		var table = layui.table;

		table.render({
			elem : '#demo',
			height : 700,
			url : "userservlet?method=userlist" //数据接口
			,
			parseData : function(res) {
				return {
					"code" : 0,
					"count" : 1000,
					"data" : res
				}
			},
			page : true //开启分页
			,
			cols : [ [ //表头
			{
				field : 'username',
				title : '用户名',
				width : 120,
				height : 100,
				sort : true,
				fixed : 'left'
			}, {
				field : 'credit',
				title : '身份证号',
				width : 120
			}, {
				field : 'sex',
				title : '性别',
				width : 120,
				sort : true
			}, {
				field : 'province',
				title : '地址',
				width : 120
			}, {
				field : 'dept',
				title : '工作单位',
				width : 120
			}, {
				field : 'gddh',
				title : '固定电话',
				width : 120,
				sort : true
			}, {
				field : 'yx',
				title : '邮箱',
				width : 120
			}, {
				field : 'right',
				title : '操作',
				width : 300,
				toolbar : "#barDemo"
			}

			] ]
		});

		table.on('tool(demo)', function(obj) {
			var data = obj.data;
			if (obj.event === 'detail') {

				window.location.href = "detailuser.jsp?username="
						+ data.username + "&qid=" + data.qid + "&credit="
						+ data.credit + "&password=" + data.password + "&name="
						+ data.name + "&sex=" + data.sex + "&province="
						+ data.province + "&dept=" + data.dept + "&post="
						+ data.post + "&phone=" + data.gddh + "&email="
						+ data.yx;

			}

			else if (obj.event === 'del') {
				layer.confirm('确认删除吗', function(index) {
					console.log(data);
					$.ajax({
						url : "userservlet?method=deleteuser",
						type : "POST",
						data : {
							"username" : data.username
						},
						dataType : "json",
						success : function(data) {

							if (data.state == 1) {
								//删除这一行
								obj.del();
								//关闭弹框
								layer.close(index);
								layer.msg("删除成功", {
									icon : 6
								});
							} else {
								layer.msg("删除失败", {
									icon : 5
								});
							}
						}

					});
				});
			} else if (obj.event === 'edit') {
				window.location.href = "updateuser.jsp?username="
						+ data.username + "&qid=" + data.qid + "&credit="
						+ data.credit + "&password=" + data.password + "&name="
						+ data.name + "&sex=" + data.sex + "&province="
						+ data.province + "&dept=" + data.dept + "&post="
						+ data.post + "&phone=" + data.gddh + "&email="
						+ data.yx;
			} else if (obj.event == 'reset') {
				console.log(data);
				$.ajax({
					url : "userservlet?method=resetpass",
					type : "POST",
					data : {
						"username" : data.username
					},
					dataType : "json",
					success : function(data) {

						if (data.state == 1) {
							layer.close(index);
							layer.msg("重置成功", {
								icon : 6
							});
						} else {
							layer.msg("重置失败", {
								icon : 5
							});
						}
					}

				});

			}
		});

	});
</script>
</head>
<body>
	<table class="layui-table" lay-skin="line" id="demo" lay-filter="demo"></table>
	<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-mini layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-mini layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini layui-btn-xs"  lay-event="del">删除</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini layui-btn-xs"  lay-event="reset">重置密码</a>
</script>

</body>
</html>