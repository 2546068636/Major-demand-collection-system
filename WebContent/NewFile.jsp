<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

						//模拟数据
					});
</script>
</head>
<body style="margin-top: 15px; margin-left: 33px;">


	<button class="layui-btn layui-btn-normal" id="add">添加查询条件</button>
	<button class="layui-btn layui-btn-danger" id="delete">删除查询条件</button>
	<form class="layui-form" method="post" id="form" action="">
		<div>
			<div class="layui-input-inline">
				<input type="submit" value="查询" class="layui-btn layui-btn-warm">
			</div>
		</div>
		<div style="margin-top: 25px;">
			<div class="layui-form-item a1">



				<!-- <label class="layui-form-label" style="font-size: 12px;font-style:SimHei">条件</label> -->
				<div class="layui-input-inline">
					<select name="link" id="link1" lay-verify="" lay-search>
						<option value="1">并且</option>
						<option value="2">或者</option>
						<option value="3">不含</option>
					</select>
				</div>

				<div class="layui-input-inline">
					<select name="option1" lay-search id="option">
						<option value="">请选择想检索的条件</option>
						<option value="organizationName">机构全称</option>
						<option value="manageDept">归口管理单位</option>
						<option value="e_address">所在地域</option>
						<option value="represent">法人代表</option>
						<option value="contact">联系人</option>
						<option value="attribute">机构属性</option>
						<option value="xqname">技术需求名称</option>
						<option value="keyword">关键字</option>
						<option value="mongey">拟投入资金总额</option>
						<option value="solution">技术需求解决方式</option>
						<option value="type">科技活动类型</option>
						<option value="classify">学科分类</option>
						<option value="fields">需求技术所属领域</option>
						<option value="hangye">需求技术应用行业</option>

					</select>
				</div>

				<div class="layui-input-inline">
					<input type="text" name="content" id="content" autocomplete="off"
						class="layui-input" placeholder="请输入查找内容">
				</div>

				<div class="layui-input-inline">
					<select name="mohuornot" lay-verify="" lay-search>
						<option value="1" selected>模糊查询</option>
						<option value="0">精确查询</option>

					</select>
				</div>
			</div>
			<div class="layui-form-item a2">
				<!-- <label class="layui-form-label" style="font-size: 12px;font-style:SimHei">条件</label> -->
				<div class="layui-input-inline">
					<select name="link" id="link1" lay-verify="" lay-search>
						<option value="1">并且</option>
						<option value="2">或者</option>
						<option value="3">不含</option>
					</select>
				</div>

				<div class="layui-input-inline">
					<select name="option1" lay-search id="option">
						<option value="">请选择想检索的条件</option>
						<option value="organizationName">机构全称</option>
						<option value="manageDept">归口管理单位</option>
						<option value="e_address">所在地域</option>
						<option value="represent">法人代表</option>
						<option value="contact">联系人</option>
						<option value="attribute">机构属性</option>
						<option value="xqname">技术需求名称</option>
						<option value="keyword">关键字</option>
						<option value="mongey">拟投入资金总额</option>
						<option value="solution">技术需求解决方式</option>
						<option value="type">科技活动类型</option>
						<option value="classify">学科分类</option>
						<option value="fields">需求技术所属领域</option>
						<option value="hangye">需求技术应用行业</option>

					</select>
				</div>

				<div class="layui-input-inline">
					<input type="text" name="content" id="content" autocomplete="off"
						class="layui-input" placeholder="请输入查找内容">
				</div>

				<div class="layui-input-inline">
					<select name="mohuornot" lay-verify="" lay-search>
						<option value="1" selected>模糊查询</option>
						<option value="0">精确查询</option>

					</select>
				</div>
			</div>
			<div class="layui-form-item a3">




				<!-- <label class="layui-form-label" style="font-size: 12px;font-style:SimHei">条件</label> -->
				<div class="layui-input-inline">
					<select name="link" id="link1" lay-verify="" lay-search>
						<option value="1">并且</option>
						<option value="2">或者</option>
						<option value="3">不含</option>
					</select>
				</div>

				<div class="layui-input-inline">
					<select name="option1" lay-search id="option">
						<option value="">请选择想检索的条件</option>
						<option value="organizationName">机构全称</option>
						<option value="manageDept">归口管理单位</option>
						<option value="e_address">所在地域</option>
						<option value="represent">法人代表</option>
						<option value="contact">联系人</option>
						<option value="attribute">机构属性</option>
						<option value="xqname">技术需求名称</option>
						<option value="keyword">关键字</option>
						<option value="mongey">拟投入资金总额</option>
						<option value="solution">技术需求解决方式</option>
						<option value="type">科技活动类型</option>
						<option value="classify">学科分类</option>
						<option value="fields">需求技术所属领域</option>
						<option value="hangye">需求技术应用行业</option>

					</select>
				</div>

				<div class="layui-input-inline">
					<input type="text" name="content" id="content" autocomplete="off"
						class="layui-input" placeholder="请输入查找内容">
				</div>

				<div class="layui-input-inline">
					<select name="mohuornot" lay-verify="" lay-search>
						<option value="1" selected>模糊查询</option>
						<option value="0">精确查询</option>

					</select>
				</div>
			</div>
			<div class="layui-form-item a4">




				<!-- <label class="layui-form-label" style="font-size: 12px;font-style:SimHei">条件</label> -->
				<div class="layui-input-inline">
					<select name="link" id="link1" lay-verify="" lay-search>
						<option value="1">并且</option>
						<option value="2">或者</option>
						<option value="3">不含</option>
					</select>
				</div>

				<div class="layui-input-inline">
					<select name="option1" lay-search id="option">
						<option value="">请选择想检索的条件</option>
						<option value="organizationName">机构全称</option>
						<option value="manageDept">归口管理单位</option>
						<option value="e_address">所在地域</option>
						<option value="represent">法人代表</option>
						<option value="contact">联系人</option>
						<option value="attribute">机构属性</option>
						<option value="xqname">技术需求名称</option>
						<option value="keyword">关键字</option>
						<option value="mongey">拟投入资金总额</option>
						<option value="solution">技术需求解决方式</option>
						<option value="type">科技活动类型</option>
						<option value="classify">学科分类</option>
						<option value="fields">需求技术所属领域</option>
						<option value="hangye">需求技术应用行业</option>

					</select>
				</div>

				<div class="layui-input-inline">
					<input type="text" name="content" id="content" autocomplete="off"
						class="layui-input" placeholder="请输入查找内容">
				</div>

				<div class="layui-input-inline">
					<select name="mohuornot" lay-verify="" lay-search>
						<option value="1" selected>模糊查询</option>
						<option value="0">精确查询</option>

					</select>
				</div>
			</div>
			<div class="layui-form-item a5">




				<!-- <label class="layui-form-label" style="font-size: 12px;font-style:SimHei">条件</label> -->
				<td><div class="layui-input-inline">
						<select name="link" id="link1" lay-verify="" lay-search>
							<option value="1">并且</option>
							<option value="2">或者</option>
							<option value="3">不含</option>
						</select>
					</div>

					<div class="layui-input-inline ">
						<select name="option1" lay-search id="option">
							<option value="">请选择想检索的条件</option>
							<option value="organizationName">机构全称</option>
							<option value="manageDept">归口管理单位</option>
							<option value="e_address">所在地域</option>
							<option value="represent">法人代表</option>
							<option value="contact">联系人</option>
							<option value="attribute">机构属性</option>
							<option value="xqname">技术需求名称</option>
							<option value="keyword">关键字</option>
							<option value="mongey">拟投入资金总额</option>
							<option value="solution">技术需求解决方式</option>
							<option value="type">科技活动类型</option>
							<option value="classify">学科分类</option>
							<option value="fields">需求技术所属领域</option>
							<option value="hangye">需求技术应用行业</option>

						</select>
					</div>

					<div class="layui-input-inline">
						<input type="text" name="content" id="content" autocomplete="off"
							class="layui-input" placeholder="请输入查找内容">
					</div></td>

				<div class="layui-input-inline">
					<select name="mohuornot" lay-verify="" lay-search>
						<option value="1" selected>模糊查询</option>
						<option value="0">精确查询</option>

					</select>
				</div>

			</div>
		</div>

	</form>
	<table class="layui-table">

		<tr>
			<td>需求名称</td>
			<td>机构全称</td>
			<td>所在地域</td>
			<td>形式审核</td>
			<td>部门审核</td>
			<td>归口管理单位</td>
			<td>机构属性</td>
			<td>科技活动类型</td>
			<td align="center" colspan="3">查看</td>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.xqname}</td>
				<td>${item.organizationName}</td>
				<td>${item.e_address}</td>
				<td>${item.status}</td>
				<td>${item.bmstatus}</td>
				<td>${item.manageDept}</td>
				<td>${item.attribute}</td>
				<td>${item.type}</td>
				<td><a
					class="layui-btn layui-btn-primary layui-btn-mini layui-btn-xs"
					href="detailxq.jsp?organizationName=${item.organizationName }&name=${item.name }&manageDept=${item.manageDept }&eaddress=${item.e_address }&province=${item.province }&web=${item.web }&email=${item.email }&represent=${item.represent }&post=${item.post }&contact=${item.contact }&gddh=${item.gddh }&phone=${item.phone }&fax=${item.fax }&attribute=${item.attribute }&jj=${item.jj }&xqname=${item.xqname }&qsyear=${item.qsyear }&jzyear=${item.jzyear }&mainProblem=${item.mainProblem }&tkey=${item.tkey }&destination=${item.destination }&keyword1=${item.keyword1 }&keyword2=${item.keyword2 }&keyword3=${item.keyword3 }&keyword4=${item.keyword4 }&keyword5=${item.keyword5 }&money=${item.money }&solution=${item.solution }&type=${item.type }&classify=${item.classify }&fields=${item.fields}&others=${item.others }&hangye=${item.hangye }&xscomment=${item.xscomment }&bmcomment=${item.bmcomment }&status=${item.status }&bmstatus=${item.bmstatus }">查看</a></td>
				<td><a class="layui-btn layui-btn-mini layui-btn-xs"
					href="updatexq.jsp?organizationName=${item.organizationName }&name=${item.name }&manageDept=${item.manageDept }&eaddress=${item.e_address }&province=${item.province }&web=${item.web }&email=${item.email }&represent=${item.represent }&post=${item.post }&contact=${item.contact }&gddh=${item.gddh }&phone=${item.phone }&fax=${item.fax }&attribute=${item.attribute }&jj=${item.jj }&xqname=${item.xqname }&qsyear=${item.qsyear }&jzyear=${item.jzyear }&mainProblem=${item.mainProblem }&tkey=${item.tkey }&destination=${item.destination }&keyword1=${item.keyword1 }&keyword2=${item.keyword2 }&keyword3=${item.keyword3 }&keyword4=${item.keyword4 }&keyword5=${item.keyword5 }&money=${item.money }&solution=${item.solution }&type=${item.type }&classify=${item.classify }&fields=${item.fields}&others=${item.others }&hangye=${item.hangye }&xscomment=${item.xscomment }&bmcomment=${item.bmcomment }&status=${item.status }&bmstatus=${item.bmstatus }">编辑</a></td>
				<td><a
					class="layui-btn layui-btn-danger layui-btn-mini layui-btn-xs"
					href="xuqiuservlet?method=deletexq&id=${item.id }">删除</a></td>
			</tr>

		</c:forEach>

	</table>
</body>
<script>
	$(".a1").hide();
	$(".a2").hide();
	$(".a3").hide();
	$(".a4").hide();
	$(".a5").hide();

	var i = 1;
	$("#add").click(function() {

		var s = ".a" + i;
		$(s).show();
		i++;
		if (i > 6) {
			alert("不能再添加");
		}

	});

	$("#delete").click(function() {

		var s = ".a" + i;
		$(s).hide();
		i--;
		if (i < 0) {
			alert("不能再删除");
		}

	});
</script>

</html>