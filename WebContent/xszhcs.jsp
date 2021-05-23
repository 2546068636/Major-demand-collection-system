<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 	String path=request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
<title>SearchName</title>
</head>
<style>
</style>
<body>
	<div>
		<button onclick="insert_row()" class="layui-btn layui-btn-normal">添加查询条件</button>
		<button onclick="deleteRow(this)" class="layui-btn layui-btn-danger">删除查询条件</button>
	</div>
	<form action="chaxun" method="post" onsubmit="return Submit()"
		class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">条件:</label>
			<div class="layui-input-inline">
				<select name="manageDept" lay-verify="" lay-search>
					<option value="">000未知</option>
					<option value="办公室">001办公室</option>
					<option value="人事处">002人事处</option>
					<option value="机关党委">003机关党委</option>
					<option value="政策法规处">004政策法规处</option>
					<option value="计划财务处">005计划财务处</option>
					<option value="平台与基础处">006平台与基础处</option>
					<option value="国际合作处">007国际合作处</option>
					<option value="高新技术处">008高新技术处</option>
					<option value="农村科技处">009农村科技处</option>
					<option value="社会发展处">010社会发展处</option>
					<option value="成果与市场处">011成果与市场处</option>
					<option value="监察室">012监察室</option>
					<option value="离退休干部处">013离退休干部处</option>
					<option value="知识产权处">014知识产权处</option>
					<option value="半干旱中心">015半干旱中心</option>
					<option value="山办">016山办</option>
					<option value="机关服务中心">017机关服务中心</option>
					<option value="科技研发中心">020科技研发中心</option>
					<option value="科技情报研究院">021科技情报研究院</option>
					<option value="器材公司">022器材公司</option>
					<option value="基金办">023基金办</option>
					<option value="档案馆">024档案馆</option>
					<option value="科技管理信息中心">025科技管理信息中心</option>
					<option value="科技投资中心">026科技投资中心</option>
					<option value="成果转换中心">027成果转换中心</option>
					<option value="中小企业创新资金管理中心">028中小企业创新资金管理中心</option>
					<option value="对外交流中心">029对外交流中心</option>


				</select>
			</div>
		</div>


		<!-- 		<table name="tbl" id="tbl" class="layui-table" >
			<tr >
				<td width="340px">
					<select id="h1" name="h">
						<option value="1" >并且</option>
						<option value="2">或者</option>
						<option value="3">不含</option>
					</select>
					<select id="type1" name="type1">
						<option value="name" >姓名</option>
						<option value="sex">性别</option>
						<option value="nation">民族</option>
						<option value='political'>政治面目</option>
						<option value="type">服务类别</option>
						<option value='time'>注册时间</option>
					</select>
					<input type="text" id="SearchBox1" name="SearchBox1">
				</td>
				<td>
				   <select id="t1" name="t1">
					  <option value='1'>模糊</option>
					  <option value='0'>精确</option>
				  </select>
				</td>
			</tr>
		</table> -->
		<div id="SearchButton">
			<input type="submit" value="查询"> <input type="text"
				name="num" id=num hidden="true">
		</div>
	</form>
	<br>
	<br>

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
<script type="text/javascript">
	var i = 1;
	var first = 1;
	function insert_row() {
		if (i - first >= 5) {
			alert("不能再加了");
			return;
		}
		i++;
		R = tbl.insertRow() //insertRow() 方法用于在表格中的指定位置插入一个新行。

		C1 = R.insertCell() //insertCell() 方法用于在 HTML 表的一行的指定位置插入一个空的 <td> 元素。
		C2 = R.insertCell()

		C1.innerHTML = "<select id='h"+i+"' name='h"+i+"'>"
				+ "<option value='1' >并且</option>"
				+ "<option value='2' >或者</option>"
				+ "<option value='3'>不含</option>" + "</select>"
				+ "<select id='type"+i+"' name='type"+i+"'>"
				+ "<option value='name' >姓名</option>"
				+ "<option value='sex' >性别</option>"
				+ "<option value='nation'>民族</option>"
				+ "<option value='political'>政治面目</option>"
				+ "<option value='type'>服务类别</option>"
				+ "<option value='time'>注册时间</option>" + "</select>"
				+ "&nbsp;<input id='SearchBox"+i+"' name='SearchBox"+i+"' />"
		C2.innerHTML = "<select id='t"+i+"' name='t"+i+"'>"
				+ "<option value='1' >模糊</option>"
				+ "<option value='0' >精确</option>" + "</select>"
		if (i % 6 == 2) {
			$("#type" + i + " option[value='sex']").prop("selected", true);
		} else if (i % 6 == 3) {
			$("#type" + i + " option[value='nation']").prop("selected", true);
		} else if (i % 6 == 4) {
			$("#type" + i + " option[value='political']")
					.prop("selected", true);
		} else if (i % 6 == 5) {
			$("#type" + i + " option[value='type']").prop("selected", true);
		} else if (i % 6 == 0) {
			$("#type" + i + " option[value='time']").prop("selected", true);
		}

	}
	function deleteRow(obj) {
		alert("确定删除一行吗？");
		if (i - first < 1) {
			alert("不能再删除了");
			return;
		}
		tbl.deleteRow(obj.parentElement.parentElement.rowIndex);
		first++;
	}
	function Submit() {
		var url = "chaxun?sql = ";
		sql = "select * from volunteer where 1=1 "

		for (var j = first; j <= i; j++) {
			var y = $("#type" + j + " option:selected").text();

			var box = "SearchBox" + j;
			var t = $("#t" + j + " option:selected").val();
			var h = $("#h" + j + " option:selected").text();
			alert(t);
			var input = document.getElementById(box).value;
			if (j <= i) {
				if (h == "并且") {
					sql += " and ";
				}
				if (h == "或者") {
					sql += " or ";
				}
			}
			if (h == "不含") {
				sql += " and ";
				if (y == "姓名") {
					sql += "name != '" + input + "' ";
				} else if (y == "时间") {
					sql += "time != '" + input + "' ";
				} else if (y == "民族") {
					sql += "nation != '" + input + "' ";
				} else if (y == "政治面目") {
					sql += "political != '" + input + "' ";
				} else if (y == "性别") {
					sql += "sex != '" + input + "' ";
				} else if (y == "服务类别") {
					sql += "type != '" + input + "' ";
				}
			}

			else {

				if (y == "姓名") {
					if (t == "1") {
						sql += "name like '%" + input + "%'";
					} else {
						sql += "name = '" + input + "' ";
					}
				} else if (y == "时间") {
					if (t == "1") {
						sql += "time like '%" + input + "%'";
					} else {
						sql += "time = '" + input + "' ";
					}
				} else if (y == "民族") {
					if (t == "1") {
						sql += "nation like '%" + input + "%'";
					} else {
						sql += "nation = '" + input + "' ";
					}
				} else if (y == "政治面目") {
					if (t == "1") {
						sql += "political like '%" + input + "%'";
					} else {
						sql += "political = '" + input + "' ";
					}
				} else if (y == "性别") {
					if (t == "1") {
						sql += "sex like '%" + input + "%'";
					} else {
						sql += "sex = '" + input + "' ";
					}
				} else if (y == "服务类别") {
					if (t == "1") {
						sql += "type like '%" + input + "%'";
					} else {
						sql += "type = '" + input + "' ";
					}
				}
			}

		}
		$("#num").attr("value", sql);
		//alert(sql);
		//url+=sql;
		//window.location.href = url;<button id="Button" type="button"  onclick="Submit()">查询</button>
	}
</script>

</html>