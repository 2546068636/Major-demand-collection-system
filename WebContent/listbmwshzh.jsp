<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>首页</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>

<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
<!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<style>
p {
	font-size: 16px;
	margin-top: 10px;
}
</style>

</head>
<body>


	<div class="tab-pane" id="panel-638308">

		<div class="row-fluid">
			<div class="span12">
				<table class="table table-bordered">
					<tr>
						<td width="15%">控制条件</td>
						<td width="84%">
							<table name="tbl" id="tbl" class="table table-bordered">
								<tr>
									<td>
										<button onclick="insert_row()"
											style="width: 130px; display: inline" class="form-control">添加查询条件</button>
										            
										<button onclick="deleteRow(this)"
											style="width: 130px; display: inline" class="form-control">删除查询条件</button>
									</td>
								</tr>
								<tr>
									<td><select id="h1" name="h" class="form-control"
										style="width: 100px; display: inline">
											<option value="1">并且</option>
											<option value="2">或者</option>
											<option value="3">不含</option>
									</select> <select id="type1" name="type1" class="form-control"
										style="width: 150px; display: inline">
											<option value='organizationName'>机构全称</option>
											<option value='manageDept'>归口管理单位</option>
											<option value='e_address'>所在地域</option>
											<option value='represent'>法人代表</option>
											<option value='contact'>联系人</option>
											<option value='attribute'>机构属性</option>
											<option value='xqname'>技术需求名称</option>
											<option value='keyword'>关键字</option>
											<option value='mongey'>拟投入资金总额</option>
											<option value='solution'>技术需求解决方式</option>
											<option value='type'>科技活动类型</option>
											<option value='classify'>学科分类</option>
											<option value='fields'>需求技术所属领域</option>
											<option value='hangye'>需求技术应用行业</option>
									</select> <input type="text" id="SearchBox1" name="SearchBox1"
										class="form-control" style="width: 150px; display: inline">
										<select id="t1" name="t1" class="form-control"
										style="width: 100px; display: inline">
											<option value='1'>模糊</option>
											<option value='0'>精确</option>
									</select></td>
								</tr>

							</table>
						</td>
					</tr>
					<form action="xuqiuservlet?method=zhcx" method="post"
						onsubmit="return Submit()">


						<tr>
							<td colspan="2"><input type="text" name="sql" id="sql"
								hidden="hidden" style="width: 80%"> <input type="text"
								name="glcs" id="glcs" value="${param.glcs }" hidden="hidden"
								style="width: 80%"> <input type="submit" value="查询"
								class="form-control"
								style="width: 150px; display: inline; margin-left: 85%">
							</td>
						</tr>
					</form>
				</table>
			</div>
		</div>
	</div>

	<div class="tab-pane" id="panel-638309">

		<div class="row-fluid">
			<div class="span12">
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
								href="bmshenhe.jsp?organizationName=${item.organizationName }&name=${item.name }&manageDept=${item.manageDept }&eaddress=${item.e_address }&province=${item.province }&web=${item.web }&email=${item.email }&represent=${item.represent }&post=${item.post }&contact=${item.contact }&gddh=${item.gddh }&phone=${item.phone }&fax=${item.fax }&attribute=${item.attribute }&jj=${item.jj }&xqname=${item.xqname }&qsyear=${item.qsyear }&jzyear=${item.jzyear }&mainProblem=${item.mainProblem }&tkey=${item.tkey }&destination=${item.destination }&keyword1=${item.keyword1 }&keyword2=${item.keyword2 }&keyword3=${item.keyword3 }&keyword4=${item.keyword4 }&keyword5=${item.keyword5 }&money=${item.money }&solution=${item.solution }&type=${item.type }&classify=${item.classify }&fields=${item.fields}&others=${item.others }&hangye=${item.hangye }&xscomment=${item.xscomment }&bmcomment=${item.bmcomment }&status=${item.status }&bmstatus=${item.bmstatus}&id=${item.id}&tp=zh">审核</a></td>
						</tr>

					</c:forEach>

				</table>
			</div>
		</div>
	</div>

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
		//C2 = R.insertCell()

		C1.innerHTML = "<select id='h" + i + "' name='h" + i + "' class='form-control' style='width: 100px;display: inline'>"
				+ "<option value='1' >并且</option>"
				+ "<option value='2' >或者</option>"
				+ "<option value='3'>不含</option>"
				+ "</select>"
				+ "<select id='type" + i + "' name='type" + i + "' class='form-control' style='width: 150px;display: inline;margin-left: 5px'>"
				+ "<option value='organizationName'>机构全称</option>"
				+ "<option value='manageDept'>归口管理单位</option>"
				+ "<option value='e_address'>所在地域</option>"
				+ "<option value='represent'>法人代表</option>"
				+ "<option value='contact'>联系人</option>"
				+ "<option value='attribute'>机构属性</option>"
				+ "<option value='keyword'>关键字</option>"
				+ "<option value='mongey'>拟投入资金总额</option>"
				+ "<option value='solution'>技术需求解决方式</option>"
				+ "<option value='type'>科技活动类型</option>"
				+ "<option value='classify'>学科分类</option>"
				+ "<option value='fields'>需求技术所属领域</option>"
				+ "<option value='xqjsyyhy'>需求技术应用行业</option>"
				+ "</select>"
				+ " <input id='SearchBox" + i + "' name='SearchBox" + i + "' class='form-control' style='width: 150px;display: inline'/>"
				+ "<select id='t" + i + "' name='t" + i + "' class='form-control' style='width: 100px;display: inline;margin-left: 5px'>"
				+ "<option value='1' >模糊</option>"
				+ "<option value='0' >精确</option>" + "</select>"
		if (i % 14 == 2) {
			$("#type" + i + " option[value='manageDept']").prop("selected",
					true);
		} else if (i % 14 == 3) {
			$("#type" + i + " option[value='e_address']")
					.prop("selected", true);
		} else if (i % 14 == 4) {
			$("#type" + i + " option[value='represent']")
					.prop("selected", true);
		} else if (i % 14 == 5) {
			$("#type" + i + " option[value='contact']").prop("selected", true);
		} else if (i % 14 == 6) {
			$("#type" + i + " option[value='attribute']")
					.prop("selected", true);
		} else if (i % 14 == 7) {
			$("#type" + i + " option[value='xqname']").prop("selected", true);
		} else if (i % 14 == 8) {
			$("#type" + i + " option[value='keyword']").prop("selected", true);
		} else if (i % 14 == 9) {
			$("#type" + i + " option[value='money']").prop("selected", true);
		} else if (i % 14 == 0) {
			$("#type" + i + " option[value='type']").prop("selected", true);
		}
		/*else if (i % 14 == 3) {
		    $("#type" + i + " option[value='yjlx']").prop("selected", true);
		} else if (i % 14 == 4) {
		    $("#type" + i + " option[value='xkfl']").prop("selected", true);
		} else if (i % 14 == 5) {
		    $("#type" + i + " option[value='xqjsssly']").prop("selected", true);
		} else if (i % 14 == 0) {
		    $("#type" + i + " option[value='xqjsyyhy']").prop("selected", true);
		}*/

	}

	function deleteRow(obj) {
		alert("确定删除一行吗？");
		if (i - first < 1) {
			alert("不能再删除了");
			return;
		}
		tbl.deleteRow(obj.parentElement.parentElement.rowIndex + 1);
		first++;
	}

	function Submit() {
		var url = "chaxun?sql = ";
		var sql = "select * from t_xq where 1=1 "

		for (var j = first; j <= i; j++) {
			var y = $("#type" + j + " option:selected").val();

			var box = "SearchBox" + j;
			var t = $("#t" + j + " option:selected").val();
			var h = $("#h" + j + " option:selected").text();
			//alert(t);
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
				sql += " and " + y + " != '" + input + "' ";

			} else {
				if (t == "1") {
					sql += y + " like '%" + input + "%'";
				} else {
					sql += y + "= '" + input + "' ";
				}

			}

		}
		//alert(sql);
		$("#sql").attr("value", sql);
		//alert(sql);
		//url+=sql;
		//window.location.href = url;<button id="Button" type="button"  onclick="Submit()">查询</button>
		//return true;
	}
</script>
</html>