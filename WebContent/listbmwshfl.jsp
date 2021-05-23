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
	layui.use('form', function() {
		var form = layui.form;

		//各种基于事件的操作，下面会有进一步介绍
		form.render();
	});
</script>
</head>
<body style="margin-top: 15px; margin-left: 0px;">
	<div style="text-align: center;">
		<h1>分类检索</h1>
	</div>
	<form class="layui-form"
		action="${pageContext.request.contextPath}/xuqiuservlet?method=bmflcx"
		method="post">
		<input type="hidden" value="${param.glcs }" name="glcs">
		<div class="layui-form-item">
			<label class="layui-form-label">选择条件:</label>
			<div class="layui-input-inline">
				<select name="option" lay-verify="required" lay-verType="alert"
					lay-search>
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
				<input type="text" name="content" placeholder="" autocomplete="off"
					class="layui-input zhi">

			</div>
			<div class="layui-input-inline">
				<select name="mode" id="mode">
					<option value="模糊查询">模糊查询</option>
					<option value="精准查询">精准查询</option>
				</select>
			</div>
			形式审核: <input type="radio" name="xssh" value="通过" lay-ignore />通过 <input
				type="radio" name="xssh" value="未通过" lay-ignore />未通过
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门审核: <input type="radio" name="bmsh"
				value="通过" lay-ignore />通过 <input type="radio" name="bmsh"
				value="未通过" lay-ignore />未通过 <input type="submit" value="检索"
				align="center"
				style="height: 30px; width: 100px; border-color: #FAFAD2; border-radius: 10px; background: #87CEFA; margin-top: 3px; margin-left: 55px;">


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
				<td><a class="layui-btn layui-btn-mini layui-btn-xs"
					href="bmshenhe.jsp?organizationName=${item.organizationName }&name=${item.name }&manageDept=${item.manageDept }&eaddress=${item.e_address }&province=${item.province }&web=${item.web }&email=${item.email }&represent=${item.represent }&post=${item.post }&contact=${item.contact }&gddh=${item.gddh }&phone=${item.phone }&fax=${item.fax }&attribute=${item.attribute }&jj=${item.jj }&xqname=${item.xqname }&qsyear=${item.qsyear }&jzyear=${item.jzyear }&mainProblem=${item.mainProblem }&tkey=${item.tkey }&destination=${item.destination }&keyword1=${item.keyword1 }&keyword2=${item.keyword2 }&keyword3=${item.keyword3 }&keyword4=${item.keyword4 }&keyword5=${item.keyword5 }&money=${item.money }&solution=${item.solution }&type=${item.type }&classify=${item.classify }&fields=${item.fields}&others=${item.others }&hangye=${item.hangye }&xscomment=${item.xscomment }&bmcomment=${item.bmcomment }&status=${item.status }&bmstatus=${item.bmstatus }&id=${item.id}&tp=zh">审核</a></td>
			</tr>

		</c:forEach>

	</table>

</body>





</html>