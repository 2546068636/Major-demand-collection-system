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
			height : 500,
			url : "xuqiuservlet?method=listxq&name=" + "${param.name}" //数据接口
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
				field : 'xqname',
				title : '需求名称',
				width : 120,
				sort : true,
				fixed : 'left'
			}, {
				field : 'organizationName',
				title : '机构全称',
				width : 120
			}, {
				field : 'e_address',
				title : '所在地域',
				width : 120,
				sort : true
			}, {
				field : 'status',
				title : '形式审核',
				width : 120,
				sort : true
			}, {
				field : 'bmstatus',
				title : '部门审核',
				width : 120,
				sort : true
			}, {
				field : 'manageDept',
				title : '归口管理单位',
				width : 120
			}, {
				field : 'attribute',
				title : '机构属性',
				width : 120
			}, {
				field : 'type',
				title : '科技活动类型',
				width : 120,
				sort : true
			}, {
				field : 'right',
				title : '操作',
				width : 200,
				toolbar : "#barDemo"
			}

			] ]
		});

		table.on('tool(demo)', function(obj) {
			var data = obj.data;
			if (obj.event === 'detail') {

				window.location.href = "detailxq.jsp?organizationName="
						+ data.organizationName + "&name=" + data.name
						+ "&manageDept=" + data.manageDept + "&eaddress="
						+ data.e_address + "&province=" + data.province
						+ "&web=" + data.web + "&email=" + data.email
						+ "&represent=" + data.represent + "&post=" + data.post
						+ "&contact=" + data.contact + "&gddh=" + data.gddh
						+ "&phone=" + data.phone + "&fax=" + data.fax
						+ "&attribute=" + data.attribute + "&jj=" + data.jj
						+ "&xqname=" + data.xqname + "&qsyear=" + data.qsyear
						+ "&jzyear=" + data.jzyear + "&mainProblem="
						+ data.mainProblem + "&tkey=" + data.tkey
						+ "&destination=" + data.destination + "&keyword1="
						+ data.keyword1 + "&keyword2=" + data.keyword2
						+ "&keyword3=" + data.keyword3 + "&keyword4="
						+ data.keyword4 + "&keyword5=" + data.keyword5
						+ "&money=" + data.money + "&solution=" + data.solution
						+ "&type=" + data.type + "&classify=" + data.classify
						+ "&fields=" + data.dields + "&other=" + data.other
						+ "&hangye=" + data.hangye + "&xscomment="
						+ data.xscomment + "&bmcomment=" + data.bmcomment
						+ "&status=" + data.status + "&bmstatus="
						+ data.bmstatus

			}

			else if (obj.event === 'del') {
				layer.confirm('确认删除吗', function(index) {
					console.log(data);
					$.ajax({
						url : "xuqiuservlet?method=deletexq",
						type : "POST",
						data : {
							"id" : data.id
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
				window.location.href = "updatexq.jsp?id=" + data.id
						+ "&organizationName=" + data.organizationName
						+ "&name=" + data.name + "&manageDept="
						+ data.manageDept + "&eaddress=" + data.e_address
						+ "&province=" + data.province + "&web=" + data.web
						+ "&email=" + data.email + "&represent="
						+ data.represent + "&post=" + data.post + "&contact="
						+ data.contact + "&gddh=" + data.gddh + "&phone="
						+ data.phone + "&fax=" + data.fax + "&attribute="
						+ data.attribute + "&jj=" + data.jj + "&xqname="
						+ data.xqname + "&qsyear=" + data.qsyear + "&jzyear="
						+ data.jzyear + "&mainProblem=" + data.mainProblem
						+ "&tkey=" + data.tkey + "&destination="
						+ data.destination + "&keyword1=" + data.keyword1
						+ "&keyword2=" + data.keyword2 + "&keyword3="
						+ data.keyword3 + "&keyword4=" + data.keyword4
						+ "&keyword5=" + data.keyword5 + "&money=" + data.money
						+ "&solution=" + data.solution + "&type=" + data.type
						+ "&classify=" + data.classify + "&fields="
						+ data.dields + "&other=" + data.other + "&hangye="
						+ data.hangye
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
</script>

</body>
</html>