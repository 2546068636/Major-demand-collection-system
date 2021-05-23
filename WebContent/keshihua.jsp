<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.sql.*"%>
<%--导入java.sql包--%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>需求浏览</title>
<script type="text/javascript" src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<script src="js/jquery-2.1.0.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/echarts.min.js"></script>
<script>
	layui.use('form', function() {
		var form = layui.form;

		//各种基于事件的操作，下面会有进一步介绍
		form.render();
	});
</script>
</head>
<body style="margin-top: 15px; margin-left: 10px;">
	<div style="text-align: center;">
		<h1>统计图表</h1>
	</div>
	<form class="layui-form" action="ipServlet" method="post">
		<div class="layui-form-item">
			<div class="layui-input-inline"></div>

			<div class="layui-input-inline">
				<input type="text" name="num" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<input type="submit" value="检索统计" align="center"
				style="height: 30px; width: 100px; border-color: #FAFAD2; border-radius: 10px; background: #87CEFA; margin-top: 3px; margin-left: 20px;">

		</div>
	</form>
	<select name="chose" id="chose">
		<option value="bar">圆柱图</option>
		<option value="line">折线图</option>
		<option value="pie">饼图</option>
	</select>
	<div id="main"
		style="width: 600px; height: 352px; margin-top: 30px; margin-left: 350px"></div>
	<div id="main2"
		style="width: 600px; height: 352px; margin-top: 30px; margin-left: 350px"></div>
	<div id="main3"
		style="width: 600px; height: 352px; margin-top: 30px; margin-left: 350px"></div>
	<table class="layui-table">
		<thead>
			<tr>
				<th>类型</th>
				<th>数量</th>

			</tr>
		</thead>
		<tbody id="body">
			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.ip}</td>
						<td>${list.sum}</td>
					</tr>
				</c:forEach>
			</c:if>

		</tbody>
	</table>

</body>

<script type="text/javascript">
	//综合查询框

	$("#main").hide();
	$("#main2").hide();
	$("#main3").hide();

	var tu = '${tuway}';
	if (tu == "show") {
		$("#main").show();

	}

	var mydataX = new Array(0);
	var mydataY = new Array(0);
	var mydataP = new Array(0);
	var data = '${json}';
	var json = eval('(' + data + ')');
	//alert(data);
	for (var i = 0; i < json.length; i++) {
		//alert(json[i].name+json[i].value);
		mydataX.push(json[i].name);
		mydataY.push(json[i].value);
		var t = {
			'name' : json[i].name,
			'value' : json[i].value
		}
		mydataP.push(t);
	}

	var myChart = echarts.init(document.getElementById("main"));
	var myChart2 = echarts.init(document.getElementById("main2"));
	var myChart3 = echarts.init(document.getElementById("main3"));
	//指定图表的配置项和数据
	var option = {
		//标题
		title : {
			text : '重大需求统计图表'
		},
		//工具箱
		//保存图片
		tooltip : {
			show : true
		},
		yAxis : {
			type : 'value'
		},
		toolbox : {
			show : true,
			feature : {
				mark : {
					show : true
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true,
					pixelRatio : 1,
					title : '保存为图片',
					type : 'png',
					lang : [ '点击保存' ]
				}
			}
		},
		//图例-每一条数据的名字叫销量
		legend : {
			data : [ '数量' ]
		},
		//x轴
		xAxis : {
			data : mydataX,
			type : 'category'
		},
		//y轴没有显式设置，根据值自动生成y轴
		yAxis : {},
		//数据-data是最终要显示的数据
		series : [ {
			name : '数量',
			//type:'line', smooth: true, seriesLayoutBy: 'row', symbolSize: 10,
			type : 'bar',
			data : mydataY
		} ]
	};
	var option2 = {
		//标题
		title : {
			text : '重大需求统计图表'
		},
		//工具箱
		//保存图片
		tooltip : {
			show : true
		},
		yAxis : {
			type : 'value'
		},
		toolbox : {
			show : true,
			feature : {
				mark : {
					show : true
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true,
					pixelRatio : 1,
					title : '保存为图片',
					type : 'png',
					lang : [ '点击保存' ]
				}
			}
		},
		//图例-每一条数据的名字叫销量
		legend : {
			data : [ '数量' ]
		},
		//x轴
		xAxis : {
			data : mydataX,
			type : 'category'
		},
		//y轴没有显式设置，根据值自动生成y轴
		yAxis : {},
		//数据-data是最终要显示的数据
		series : [ {
			name : '数量',
			type : 'line',
			smooth : true,
			seriesLayoutBy : 'row',
			symbolSize : 10,

			data : mydataY
		} ]
	};
	var option3 = {
		title : {
			text : '重大需求统计图表',
			subtext : '',
			x : 'center'
		},
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b} : {c} ({d}%)"
		},
		toolbox : {
			show : true,
			feature : {
				mark : {
					show : true
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true,
					pixelRatio : 1,
					title : '保存为图片',
					type : 'png',
					lang : [ '点击保存' ]
				}
			}
		},
		legend : {
			orient : 'vertical',
			left : 'left',
			data : mydataX.baseDataCategory
		},
		series : [ {
			name : '值域占比',
			type : 'pie',
			radius : '55%',
			center : [ '50%', '50%' ],
			data : mydataP,
			itemStyle : {
				emphasis : {
					shadowBlur : 10,
					shadowOffsetX : 0,
					shadowColor : 'rgba(0, 0, 0, 0.5)'
				},
				normal : {
					label : {
						show : true,
						formatter : '{b}-{d}%',
						textStyle : {
							fontWeight : 300,
							fontSize : 16
						//文字的字体大小
						},
					},
					lableLine : {
						show : true
					}
				}
			}
		} ]
	};
	myChart.setOption(option);
	myChart2.setOption(option2);
	myChart3.setOption(option3);
	//使用刚刚指定的配置项和数据项显示图表

	var sel = document.getElementById("chose");
	sel.onchange = function() {
		if (sel.options[sel.selectedIndex].value == "line") {
			$("#main").hide();
			$("#main2").show();
			$("#main3").hide();
		} else if (sel.options[sel.selectedIndex].value == "pie") {
			$("#main").hide();
			$("#main2").hide();
			$("#main3").show();
		} else {
			$("#main").show();
			$("#main2").hide();
			$("#main3").hide();
		}
	}
	myChart3.on('mouseover', function(params) {
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
	myChart2.on('mouseover', function(params) {
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
	myChart.on('mouseover', function(params) {
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
</script>

</html>