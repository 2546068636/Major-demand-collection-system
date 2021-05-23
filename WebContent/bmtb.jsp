<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">

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
<script src="js/echarts.min.js"></script>
</head>
<body>
	<div class="tab-pane" id="panel-638309">

		<div class="row-fluid">
			<div class="span12">
				<div class="span12">
					<table class="table table-bordered">
						<tr>
							<td width="300px">控制条件</td>
							<td width="84%">
								<table name="tbl" id="tbl2" class="table table-bordered">
									<tr>
										<td>
											<button onclick="insert_row()"
												style="width: 130px; display: inline" class="form-control">添加查询条件
											</button>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button onclick="deleteRow(this)"
												style="width: 130px; display: inline" class="form-control">删除查询条件
											</button>
										</td>
									</tr>
									<tr>
										<td><select id="h1" name="h1" class="form-control"
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
												<option value='jsxqmc'>技术需求名称</option>
												<option value='keyword'>关键字</option>
												<option value='money'>拟投入资金总额</option>
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
						<form action="xuqiuservlet?method=bmtb" method="post"
							onsubmit="return Submit()">


							<tr>
								<td width="15%">选择统计字段：</td>
								<td width="84%"><select id="tjzd" name="tjzd"
									class="form-control" style="width: 150px; display: inline">
										<option value='attribute'>机构属性</option>
										<option value='type'>科技活动类型</option>
										<option value='solution'>技术需求解决方式</option>
										<option value='manageDept'>归口管理部门</option>
										<option value='e_address'>所在地域</option>
										<option value='classify'>学科分类</option>
										<option value='hangye'>需求技术应用行业</option>
										<option value='glcs'>管理处室</option>
								</select></td>
							</tr>

							<tr>
								<td width="15%">选择图表类型：</td>
								<td width="84%"><select id="tblx" name="tblx"
									class="form-control tblx" style="width: 150px; display: inline"
									onchange="func()">
										<option value='line'>折线图</option>
										<option value='bar'>柱形图</option>
										<option value='pie'>饼状图</option>
								</select></td>
							</tr>

							<tr>
								<td colspan="2"><input type="text" name="sql" id="sql"
									hidden="hidden" style="width: 80%"> <input type="text"
									name="glcs" id="glcs" hidden="hidden" style="width: 80%"
									value="${param.glcs }"> <input type="submit" value="查询"
									class="form-control"
									style="width: 150px; display: inline; margin-left: 85%">
								</td>
							</tr>
					</table>
					</form>

				</div>

			</div>
		</div>

		<div class="row-fluid">
			<!--为echarts准备一个容器，画图就画在里面-->
			<div id="boxline"
				style="width: 1200px; height: 400px; margin-left: 4%"></div>
			<div id="boxbar"
				style="width: 1200px; height: 400px; margin-left: 4%"></div>
			<div id="boxpie"
				style="width: 1200px; height: 400px; margin-left: 4%"></div>
		</div>
	</div>

	<table class="layui-table" border="solid 1px">
		<thead>
			<tr>
				<th width="500">类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th width="500">数量&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
			</tr>
		</thead>
		<tbody id="body">

			<c:if test="${tjzd=='attribute'}">
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.attribute}</td>
						<td>${item.num}</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${tjzd=='type'}">
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.type}</td>
						<td>${item.num}</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${tjzd=='solution'}">
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.solution}</td>
						<td>${item.num}</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${tjzd=='manageDept'}">
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.manageDept}</td>
						<td>${item.num}</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${tjzd=='e_address'}">
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.e_address}</td>
						<td>${item.num}</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${tjzd=='classify'}">
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.classify}</td>
						<td>${item.num}</td>
					</tr>
				</c:forEach>
			</c:if>


			<c:if test="${tjzd=='hangye'}">
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.hangye}</td>
						<td>${item.num}</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${tjzd=='glcs'}">
				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.glcs}</td>
						<td>${item.num}</td>
					</tr>
				</c:forEach>
			</c:if>

		</tbody>
	</table>
</body>

<script>
	$(function() {
		var mydataX = new Array(0);
		var mydataP = new Array(0);
		var mydataY = new Array(0);
		var btype = '${tblx}';
		//document.getElementById("here").click();
		var tjzd = '${tjzd}';
		var data = '${data}';
		var json = eval(data);
		//alert(data);
		if (tjzd != '') {
			if (tjzd == 'attribute') {
				for (var i = 0; i < json.length; i++) {
					mydataX.push(json[i].attribute);

					mydataY.push(json[i].num);
					var t = {
						'name' : json[i].attribute,
						'value' : json[i].num
					}
					mydataP.push(t);
				}
				//alert(json[0].jgsx);
				//初始化ehcharts实例

			} else if (tjzd == 'solution') {
				for (var i = 0; i < json.length; i++) {
					mydataX.push(json[i].solution);
					mydataY.push(json[i].num);
					var t = {
						'name' : json[i].solution,
						'value' : json[i].num
					}
					mydataP.push(t);
				}
			} else if (tjzd == 'type') {
				for (var i = 0; i < json.length; i++) {
					mydataX.push(json[i].type);
					mydataY.push(json[i].num);
					var t = {
						'name' : json[i].type,
						'value' : json[i].num
					}
					mydataP.push(t);
				}
			} else if (tjzd == 'manageDept') {
				for (var i = 0; i < json.length; i++) {
					mydataX.push(json[i].manageDept);
					mydataY.push(json[i].num);
					var t = {
						'name' : json[i].manageDept,
						'value' : json[i].num
					}
					mydataP.push(t);
				}
			} else if (tjzd == 'e_address') {
				for (var i = 0; i < json.length; i++) {
					mydataX.push(json[i].e_address);
					mydataY.push(json[i].num);
					var t = {
						'name' : json[i].e_address,
						'value' : json[i].num
					}
					mydataP.push(t);
				}
			} else if (tjzd == 'classify') {
				for (var i = 0; i < json.length; i++) {
					mydataX.push(json[i].classify);
					mydataY.push(json[i].num);
					var t = {
						'name' : json[i].classify,
						'value' : json[i].num
					}
					mydataP.push(t);
				}
			} else if (tjzd == 'hangye') {
				for (var i = 0; i < json.length; i++) {
					mydataX.push(json[i].hangye);
					mydataY.push(json[i].num);
					var t = {
						'name' : json[i].hangye,
						'value' : json[i].num
					}
					mydataP.push(t);
				}
			} else if (tjzd == 'glcs') {
				for (var i = 0; i < json.length; i++) {
					mydataX.push(json[i].bmsh);
					mydataY.push(json[i].num);
					var t = {
						'name' : json[i].glcs,
						'value' : json[i].num
					}
					mydataP.push(t);
				}
			}
			var myChartline = echarts.init(document.getElementById("boxline"));
			var myChartbar = echarts.init(document.getElementById("boxbar"));
			var myChartpie = echarts.init(document.getElementById("boxpie"));
			//指定图表的配置项和数据
			var option = {
				//标题
				title : {
					text : '重大需求统计图表'
				},
				//工具箱
				//保存图片
				toolbox : {
					show : true,
					feature : {
						saveAsImage : {
							show : true
						},

					},
				},
				//图例-每一条数据的名字叫销量
				legend : {
					data : [ '数量' ]
				},
				//x轴
				xAxis : {
					data : mydataX
				},
				//y轴没有显式设置，根据值自动生成y轴
				yAxis : {},
				//数据-data是最终要显示的数据
				series : [ {
					name : '数量',
					type : 'line',
					data : mydataY
				} ]
			};

			var option3 = {
				//标题
				title : {
					text : '重大需求统计图表'
				},
				//工具箱
				//保存图片
				toolbox : {
					show : true,
					feature : {
						saveAsImage : {
							show : true
						},

					},
				},
				//图例-每一条数据的名字叫销量
				legend : {
					data : [ '数量' ]
				},
				//x轴
				xAxis : {
					data : mydataX
				},
				//y轴没有显式设置，根据值自动生成y轴
				yAxis : {},
				//数据-data是最终要显示的数据
				series : [ {
					name : '数量',
					type : 'bar',
					data : mydataY
				} ]
			};

			var option2 = {

				title : {
					text : '重大需求统计图表',
					left : 'left',
					top : 20,

				},

				tooltip : {
					trigger : 'item',
					formatter : '{a} <br/>{b} : {c} ({d}%)'
				},
				series : [ {
					name : tjzd,
					type : 'pie',
					radius : '55%',
					center : [ '50%', '50%' ],
					data : mydataP.sort(function(a, b) {
						return a.value - b.value;
					}),
					roseType : 'radius',
					emphasis : {
						itemStyle : {
							shadowBlur : 10,
							shadowOffsetX : 0,
							shadowColor : 'rgba(0, 0, 0, 0.5)'
						}
					}

				} ]
			};
			myChartpie.setOption(option2);
			myChartline.setOption(option);
			myChartbar.setOption(option3);
			if (btype == 'pie') {
				$("#boxpie").show();
				$("#boxline").hide();
				$("#boxbar").hide();
			} else if (btype == 'line') {
				//使用刚刚指定的配置项和数据项显示图表
				$("#boxline").show();
				$("#boxpie").hide();
				$("#boxbar").hide();
			} else if (btype == 'bar') {
				$("#boxbar").show();
				$("#boxpie").hide();
				$("#boxline").hide();
			}

			myChartline.on('mouseover', function(params) {
				let trlist = $("#body").children('tr');
				var name = params.name;

				for (var i = 0; i < trlist.length; i++) {
					var tdArr = trlist.eq(i).find("td");
					var namec = tdArr.eq(0).text();//    备注

					if (namec == name) {
						trlist.eq(i).css("background-color", "red");
					} else {
						trlist.eq(i).css("background-color", "#E8F6FF");
					}
				}
				trlist.eq(0).focus();
			});
			myChartbar.on('mouseover', function(params) {
				let trlist = $("#body").children('tr');
				var name = params.name;

				for (var i = 0; i < trlist.length; i++) {
					var tdArr = trlist.eq(i).find("td");
					var namec = tdArr.eq(0).text();//    备注

					if (namec == name) {
						trlist.eq(i).css("background-color", "red");
					} else {
						trlist.eq(i).css("background-color", "#E8F6FF");
					}
				}
				trlist.eq(0).focus();
			});
			myChartpie.on('mouseover', function(params) {
				let trlist = $("#body").children('tr');
				var name = params.name;

				for (var i = 0; i < trlist.length; i++) {
					var tdArr = trlist.eq(i).find("td");
					var namec = tdArr.eq(0).text();//    备注

					if (namec == name) {
						trlist.eq(i).css("background-color", "red");
					} else {
						trlist.eq(i).css("background-color", "#E8F6FF");
					}
				}
				trlist.eq(0).focus();
			});
			/*             var $trTemp = $("<tr></tr>");
			for( var i = 0; i < mydataX.length; i++ ) {
			    $trTemp.append("<td>"+ mydataX[i]+"</td>");
			}
			$trTemp.appendTo("#thand");
			var $trTemp2 = $("<tr></tr>");
			for( var i = 0; i < mydataY.length; i++ ) {
			    $trTemp2.append("<td>"+ mydataY[i]+"</td>");
			}
			$trTemp2.appendTo("#trs");
			myChart.on('click', function (params) {
			    let trlist = $("#thand").children('tr');
			    let tdsnum = $("#trs").children('tr');
			    var name = params.name;
			    var tdArr = trlist.eq(0).find("td");
			    var tdArr2 = tdsnum.eq(0).find("td");
			    for(var i=0;i<tdArr.length;i++){
			        let thtext = tdArr.eq(i).text();
			        if(thtext==name){
			            tdArr.eq(i).css("background-color","red");
			            tdArr2.eq(i).css("background-color","red");
			        }else {
			            tdArr.eq(i).css("background-color","#E8F6FF");
			            tdArr2.eq(i).css("background-color","#E8F6FF");
			        }

			    }

			}); */
		}

	});
	function func() {
		var vs = $('.tblx  option:selected').val();
		alert(vs);
		if (vs == 'line') {
			$("#boxline").show();
			$("#boxpie").hide();
			$("#boxbar").hide();
		} else if (vs == 'bar') {
			$("#boxline").hide();
			$("#boxpie").hide();
			$("#boxbar").show();
		} else {
			$("#boxline").hide();
			$("#boxpie").show();
			$("#boxbar").hide();
		}
	}

	var i = 1;
	var first = 1;

	function insert_row() {
		if (i - first >= 5) {
			alert("不能再加了");
			return;
		}
		i++;
		R = tbl2.insertRow() //insertRow() 方法用于在表格中的指定位置插入一个新行。
		C1 = R.insertCell() //insertCell() 方法用于在 HTML 表的一行的指定位置插入一个空的 <td> 元素。
		//C2 = R.insertCell()

		C1.innerHTML = "<select id='h" + i + "' name='h" + i + "' class='form-control' style='width: 100px;display: inline'>"
				+ "<option value='1' >并且</option>"
				+ "<option value='2' >或者</option>"
				+ "<option value='3'>不含</option>"
				+ "</select>"
				+ "<select id='type" + i + "' name='type" + i + "' class='form-control' style='width: 150px;display: inline;margin-left: 5px'>"
				+ "<option value='jgmc'>机构全称</option>"
				+ "<option value='gkglbm'>归口管理单位</option>"
				+ "<option value='szdy'>所在地域</option>"
				+ "<option value='frdb'>法人代表</option>"
				+ "<option value='lxr'>联系人</option>"
				+ "<option value='jgsx'>机构属性</option>"
				+ "<option value='gjz'>关键字</option>"
				+ "<option value='zjxqze'>拟投入资金总额</option>"
				+ "<option value='jsxqhzms'>技术需求解决方式</option>"
				+ "<option value='yjlx'>科技活动类型</option>"
				+ "<option value='xkfl'>学科分类</option>"
				+ "<option value='xqjsssly'>需求技术所属领域</option>"
				+ "<option value='xqjsyyhy'>需求技术应用行业</option>"
				+ "</select>"
				+ "&nbsp;<input id='SearchBox" + i + "' name='SearchBox" + i + "' class='form-control' style='width: 150px;display: inline'/>"
				+ "<select id='t" + i + "' name='t" + i + "' class='form-control' style='width: 100px;display: inline;margin-left: 5px'>"
				+ "<option value='1' >模糊</option>"
				+ "<option value='0' >精确</option>" + "</select>"
		if (i % 14 == 2) {
			$("#type" + i + " option[value='gkglbm']").prop("selected", true);
		} else if (i % 14 == 3) {
			$("#type" + i + " option[value='szdy']").prop("selected", true);
		} else if (i % 14 == 4) {
			$("#type" + i + " option[value='frdb']").prop("selected", true);
		} else if (i % 14 == 5) {
			$("#type" + i + " option[value='lxr']").prop("selected", true);
		} else if (i % 14 == 6) {
			$("#type" + i + " option[value='jgsx']").prop("selected", true);
		} else if (i % 14 == 7) {
			$("#type" + i + " option[value='jsxqmc']").prop("selected", true);
		} else if (i % 14 == 8) {
			$("#type" + i + " option[value='gjz']").prop("selected", true);
		} else if (i % 14 == 9) {
			$("#type" + i + " option[value='zjxqze']").prop("selected", true);
		} else if (i % 14 == 0) {
			$("#type" + i + " option[value='jsxqhzms']").prop("selected", true);
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
		tbl2.deleteRow(obj.parentElement.parentElement.rowIndex + 1);
		first++;
	}

	function Submit() {
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
		//alert(sql);4
		//url+=sql;
		//window.location.href = url;<button id="Button" type="button"  onclick="Submit()">查询</button>
		//return true;
	}
</script>
</html>