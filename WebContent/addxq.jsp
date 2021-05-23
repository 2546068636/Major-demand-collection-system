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

						//模拟数据

						, data1 = [ {
							title : '数学',
							id : 1,
							children : [ {
								title : '数理逻辑与数学基础',
								id : 1000,
								children : [ {
									title : '演绎逻辑学',
									id : 10001
								}, {
									title : '证明论',
									id : 10002
								}, {
									title : '递归论',
									id : 10003
								}, {
									title : '模型论',
									id : 10004
								} ]
							}, {
								title : '代数学',
								id : 1001,
								children : [ {
									title : '线性代数',
									id : 10011
								}, {
									title : '群论',
									id : 10012
								}, {
									title : '域论',
									id : 10013
								}, {
									title : '李代数',
									id : 10014
								} ]
							}, {
								title : '常微分方程',
								id : 1002,
								children : [ {
									title : '定性理论',
									id : 10021
								} ]
							} ]
						}, {
							title : '信息科学与系统科学',
							id : 2,
							children : [ {
								title : '系统学',
								id : 2000
							}, {
								title : '基础学科',
								id : 2001
							} ]
						}, {
							title : '力学',
							id : 3,
							children : [ {
								title : '基础力学',
								id : 3000
							}, {
								title : '固体力学',
								id : 3001
							} ]
						} ], data2 = [ {
							title : '农、林、牧、渔业',
							id : 1,
							children : [ {
								title : '农业',
								id : 1000,
								children : [ {
									title : '谷物种植',
									id : 10001
								}, {
									title : '证明论',
									id : 10002
								}, {
									title : '递归论',
									id : 10003
								}, {
									title : '模型论',
									id : 10004
								} ]
							}, {
								title : '代数学',
								id : 1001,
								children : [ {
									title : '线性代数',
									id : 10011
								}, {
									title : '群论',
									id : 10012
								}, {
									title : '域论',
									id : 10013
								}, {
									title : '李代数',
									id : 10014
								} ]
							}, {
								title : '常微分方程',
								id : 1002,
								children : [ {
									title : '定性理论',
									id : 10021
								} ]
							} ]
						}, {
							title : '信息科学与系统科学',
							id : 2,
							children : [ {
								title : '系统学',
								id : 2000
							}, {
								title : '基础学科',
								id : 2001
							} ]
						}, {
							title : '力学',
							id : 3,
							children : [ {
								title : '基础力学',
								id : 3000
							}, {
								title : '固体力学',
								id : 3001
							} ]
						} ];

						//常规用法
						tree.render({
							elem : '#test1' //默认是点击节点可进行收缩
							,
							data : data1,
							showCheckbox : false //是否显示复选框
							,
							id : 'demoId1',
							isJump : true //是否允许点击节点时弹出新窗口跳转
							,
							click : function(obj) {
								var data = obj.data; //获取当前点击的节点数据
								$(".classify").prop("value", data.title);

							}
						});
						tree.render({
							elem : '#test2' //默认是点击节点可进行收缩
							,
							data : data2,
							showCheckbox : false //是否显示复选框
							,
							id : 'demoId2',
							isJump : true //是否允许点击节点时弹出新窗口跳转
							,
							click : function(obj) {
								var data = obj.data; //获取当前点击的节点数据
								$(".industry").prop("value", data.title);

							}
						});

						var nowTime = new Date();
						var startTime = laydate.render({
							elem : '#test3',
							type : 'year',
							btns : [ 'confirm' ],
							max : 'nowTime',//默认最大值为当前日期
							done : function(value, date) {
								//	  		console.log(value); //得到日期生成的值，如：2017-08-18
								//	  	    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
								endTime.config.min = {
									year : date.year,
									month : date.month - 1,//关键
									date : date.date,
									hours : date.hours,
									minutes : date.minutes,
									seconds : date.seconds
								};

							}
						});
						var endTime = laydate.render({
							elem : '#test4',
							type : 'year',
							btns : [ 'confirm' ],
							min : 'nowTime',
							done : function(value, date) {
								//	  		console.log(value); //得到日期生成的值，如：2017-08-18
								//	  	    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}    	   
								startTime.config.max = {
									year : date.year,
									month : date.month - 1,//关键
									date : date.date,
									hours : date.hours,
									minutes : date.minutes,
									seconds : date.seconds
								}

							}
						});

						//重置
						$("#btn-resert").on("click", function() {
							$("#sch-form")[0].reset();
							endTime.config.min = '1900-1-1';
							startTime.config.max = endTime.config.max;
						})

						form.on('submit(*)', function(data) {
							return false;
						});

						form
								.verify({
									fuxuan : function(value, item) { //value：表单的值、item：表单的DOM对象
										var checked = document
												.getElementById("field")
										if (checked.checked == false) {
											return '多选项必选，至少选择一个';
										}
									},
									characters : function(v) {
										var numasc = 0;
										var charasc = 0;
										var otherasc = 0;
										for (var i = 0; i < v.length; i++) {
											var asciiNumber = v.substr(i, 1)
													.charCodeAt();
											if (asciiNumber >= 48
													&& asciiNumber <= 57) {
												numasc += 1;
											}
											if ((asciiNumber >= 65 && asciiNumber <= 90)
													|| (asciiNumber >= 97 && asciiNumber <= 122)) {
												charasc += 1;
											}
											if ((asciiNumber >= 33 && asciiNumber <= 47)
													|| (asciiNumber >= 58 && asciiNumber <= 64)
													|| (asciiNumber >= 91 && asciiNumber <= 96)
													|| (asciiNumber >= 123 && asciiNumber <= 126)) {
												otherasc += 1;
											}
										}
										if (numasc > 0 || charasc > 0
												|| otherasc > 0) {
											return "只能输入中文";
										}
									},
									clength : function(value) {
										var i, sum;
										sum = 0;
										for (i = 0; i < value.length; i++) {
											if ((value.charCodeAt(i) >= 0)
													&& (value.charCodeAt(i) <= 255)) {
												sum = sum + 1;
											} else {
												sum = sum + 2;
											}
										}
										if (sum > 1000) {
											return '课程介绍最多只能输入500个中文字';
										}
									},
									pass : [ /^[1-9]d*.d*|0.d*[1-9]d*$/,
											'金额只能是正数' ],
									pass2 : [ /^[0-9]*$/, '金额只能是数字' ]
								//我们既支持上述函数式的方式，也支持下述数组的形式
								//数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
								});
						layer.config({
							offset : [ '1000px', '580px' ]
						});
						form.on('radio(filter)', function(data) {
							var sex = data.value;
							if (this.value == '基础研究') {
								$(".count").show();
								$(".fl").hide();
								$(".talk").hide();
								$(".indust").hide();

							} else {
								$(".count").hide();
								$(".fl").show();

								$(".indust").show();
							}
							form.render();
						});
						form.on('checkbox(aaa)', function(data) {
							if ($("input[name='fields']:checked").length >= 4) {
								$(data.elem).removeProp('checked'); //或者$(this)
								form.render();
								alert("最多选3个!");
							}
							if ($(this).val() == "其他技术") {
								$(".talk").show();
							}

						});
					});
</script>
<!--   <script type="text/javascript">

</script>  -->
</head>
<body style="margin-top: 15px; margin-left: 33px;">
	<div style="text-align: center;">
		<h1>河北省重大技术需求征集表</h1>

	</div>
	<form class="layui-form" method="post" id="form"
		action="xuqiuservlet?method=addxq">
		<button type="button"
			class="layui-btn layui-btn-radius layui-btn-danger"
			style="margin-left: 520px;">
			<i class="layui-icon">&#xe608;</i> 添加技术需求
		</button>
		<div style="margin-top: 25px;">
			<div class="layui-form-item">
				<label class="layui-form-label"
					style="font-size: 12px; font-style: SimHei">*机构全称</label>
				<div class="layui-input-inline">
					<input type="text" name="organizationName" value="${user.dept}"
						required lay-verType="tips" lay-verify="required"
						autocomplete="off" class="layui-input" readonly> <input
						type="hidden" value="${user.username }" name="name">
				</div>

				<div style="float: right;">
					<label class="layui-form-label"
						style="font-size: 12px; font-style: SimHei">归口管理部门</label>
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
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"
					style="font-size: 12pxl; font-style: SimHei">*通讯地址</label>
				<div class="layui-input-inline">
					<input type="text" name="eaddress" required lay-verType="tips"
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>

				<div style="float: right;">
					<label class="layui-form-label"
						style="font-size: 12px; font-style: SimHei">*所在地域</label>
					<div class="layui-input-inline">
						<select name="province" lay-verify="required" lay-verType="alert">
							<option value="">请选择一个城市</option>
							<option value="北京">北京</option>
							<option value="上海">上海</option>
							<option value="石家庄市">石家庄市</option>
							<option value="唐山市">唐山市</option>
							<option value="秦皇岛市">秦皇岛市</option>
							<option value="邯郸市">邯郸市</option>
							<option value="邢台市">邢台市</option>

						</select>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"
					style="font-size: 12px; font-style: SimHei">网址</label>
				<div class="layui-input-inline">
					<input type="text" name="web" lay-verType="tips" lay-verify="url"
						autocomplete="off" class="layui-input">
				</div>
				<div style="float: right;">
					<label class="layui-form-label"
						style="font-size: 12px; font-style: SimHei">*电子信箱</label>
					<div class="layui-input-inline">
						<input type="text" name="email" lay-verType="tips" required
							lay-verify="required|email" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"
					style="font-size: 12px; font-style: SimHei">*法人代表</label>
				<div class="layui-input-inline">
					<input type="text" name="represent" lay-verType="tips" required
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
				<div style="float: right;">
					<label class="layui-form-label"
						style="font-size: 12px; font-style: SimHei">邮政编码</label>
					<div class="layui-input-inline">
						<input type="text" name="post" value="${code}" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"
					style="font-size: 12px; font-style: SimHei">*联系人</label>
				<div class="layui-input-inline">
					<input type="text" name="contact" lay-verType="tips" required
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
				<div style="float: right;">
					<label class="layui-form-label"
						style="font-size: 12px; font-style: SimHei">固定电话</label>
					<div class="layui-input-inline">
						<input type="text" name="gddh" lay-verType="tips"
							autocomplete="off" class="layui-input">
					</div>

				</div>
			</div>
			<div class="layui-form-item">

				<label class="layui-form-label"
					style="font-size: 12px; font-style: SimHei">*移动电话</label>
				<div class="layui-input-inline">
					<input type="text" name="phone" lay-verType="tips" required
						lay-verify="required|phone" autocomplete="off" class="layui-input">
				</div>
				<div style="float: right;">
					<label class="layui-form-label"
						style="font-size: 12px; font-style: SimHei">传真</label>
					<div class="layui-input-inline">
						<input type="text" name="fax" autocomplete="off"
							class="layui-input">
					</div>
				</div>

			</div>
			<div class="layui-form-item" pane="">
				<label class="layui-form-label"
					style="font-size: 12px; font-style: SimHei">*机构属性</label>
				<div class="layui-input-block">
					<input type="radio" name="attribute" value="企业" checked="checked" />企业
					<!-- 单选按钮的name要一样 -->
					<input type="radio" name="attribute" value="高等院校" />高等院校
					<!-- selected 和它的区别是什么？都是选择 -->
					<input type="radio" name="attribute" value="研究机构" />研究机构 <input
						type="radio" name="attribute" value="其他" />其他
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label"
					style="font-size: 12px; font-style: SimHei">*机构简介</label>
				<div class="layui-input-block">
					<textarea name="jj" required lay-verType="tips"
						lay-verify="required|clength" placeholder="请输入内容"
						class="layui-textarea brief"></textarea>
					<p>
						<em class="textarea-length">0</em>/500<span style="color: red">(字符数控制在500汉字以内)</span>
					</p>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"
					style="font-size: 12px; font-style: SimHei">*需求名称</label>
				<div class="layui-input-inline">
					<input type="text" name="xqname" lay-verType="tips" required
						lay-verify="required" autocomplete="off" class="layui-input">
				</div>
				<div style="float: right;">
					<div class="layui-inline">
						<label class="layui-form-label"
							style="font-size: 12px; font-style: SimHei">*需求年限</label>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" id="test3" lay-verType="tips" required
								lay-verify="required" name="qsyear" placeholder=""
								autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid">-</div>
						<div class="layui-input-inline"
							style="width: 100px; font-style: SimHei">
							<input type="text" id="test4" lay-verType="tips" required
								lay-verify="required" name="jzyear" placeholder=""
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">*需求概述</label>
			<div class="layui-input-block">
				<textarea name="overview" required lay-verType="tips"
					lay-verify="required|clength"
					placeholder="主要问题（需要解决的重大技术问题，限500字以内）"
					class="layui-textarea overview"></textarea>
				<p>
					<em class="textarea-length1">0</em>/500<span style="color: red">(字符数控制在500汉字以内)</span>
				</p>
				<textarea name="overview2" required lay-verType="tips"
					lay-verify="required|clength"
					placeholder="技术关键（所需的关键技术、主要指标，限500字以内）"
					class="layui-textarea overview2"></textarea>
				<p>
					<em class="textarea-length2">0</em>/500<span style="color: red">(字符数控制在500汉字以内)</span>
				</p>
				<textarea name="overview3" required lay-verType="tips"
					lay-verify="required|clength"
					placeholder="预期目标（技术创新性、经济社会效益，限500字以内）"
					class="layui-textarea overview3"></textarea>
				<p>
					<em class="textarea-length3">0</em>/500<span style="color: red">(字符数控制在500汉字以内)</span>
				</p>
			</div>
		</div>
		<div class="layui-form-item ">
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">*关键字</label>
			<div class="layui-input-inline">
				<input type="text" name="keyword1" lay-verType="tips" required
					lay-verify="required" autocomplete="off"
					class="layui-input keyword">

			</div>
			<div class="layui-input-inline">
				<input type="text" name="keyword2" lay-verType="tips" required
					lay-verify="required" autocomplete="off"
					class="layui-input keyword2">

			</div>
			<div class="layui-input-inline">
				<input type="text" name="keyword3" lay-verType="tips" required
					lay-verify="required" autocomplete="off"
					class="layui-input keyword3">

			</div>
			<div class="layui-input-inline">
				<input type="text" name="keyword4" lay-verType="tips" required
					lay-verify="required" autocomplete="off"
					class="layui-input keyword4">

			</div>
			<div class="layui-input-inline">
				<input type="text" name="keyword5" lay-verType="tips" required
					lay-verify="required" autocomplete="off"
					class="layui-input keyword5">

			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">拟投入资金总额</label>
			<div class="layui-input-block">
				<input type="text" name="money" value="" lay-verType="tips" required
					lay-verify="required|pass|pass2" placeholder="￥" autocomplete="off"
					class="layui-input">
			</div>
			<span style="color: red">(只能是正整数)</span>
		</div>
		<div class="layui-form-item" pane="">
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">*解决方式</label>
			<div class="layui-input-block">
				<input type="radio" id="medel" name="solution" value="独立研发" />独立研发 <input
					type="radio" id="medel" name="solution" value="委托研发" />委托研发 <input
					type="radio" id="medel" name="solution" value="合作研发" />合作研发 <input
					type="radio" id="medel" name="solution" value="其他" />其他
			</div>
		</div>
		<div class="layui-form-item" pane="">
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">*科技活动</label>
			<div class="layui-input-block">
				<input type="radio" lay-filter="filter" name="type" value="基础研究"
					checked="checked" />基础研究
				<!-- 单选按钮的name要一样 -->
				<input type="radio" lay-filter="filter" name="type" value="应用研究" />应用研究
				<!-- selected 和它的区别是什么？都是选择 -->
				<input type="radio" lay-filter="filter" name="type" value="试验发展" />试验发展
				<input type="radio" lay-filter="filter" name="type"
					value="研究与试验发展成果应用" />研究与试验发展成果应用 <input type="radio"
					lay-filter="filter" name="type" value="技术推广与科技服务" />技术推广与科技服务 <input
					type="radio" lay-filter="filter" name="type" value="生产性活动" />生产性活动
			</div>
		</div>
		<div class="layui-form-item count">

			<div id="test1"></div>
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">*学科分类</label>
			<div class="layui-input-block">
				<input type="text" name="classify" autocomplete="off"
					class="layui-input classify" />
			</div>
		</div>
		<div class="layui-form-item fl" pane="">
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">*所属领域</label>
			<div class="layui-input-block">
				<input type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields" value="电子信息技术" />电子信息技术
				<input type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields" value="光机电一体化" />光机电一体化
				<input type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields" value="软件" />软件 <input
					type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields" value="生物制药技术" />生物制药技术
				<input type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields" value="新材料及应用技术" />新材料及应用技术
				<input type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields" value="先进制造技术" />先进制造技术
				<input type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields" value="现代农业技术" />现代农业技术
				<input type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields"
					value="新能源与高效节能技术" />新能源与高效节能技术 <input type="checkbox"
					lay-verType="alert" lay-verify="fuxuan" lay-filter="aaa"
					lay-skin="primary" name="fields" value="资源与环境保护新技术" />资源与环境保护新技术 <input
					type="checkbox" lay-verType="alert" lay-verify="fuxuan"
					lay-filter="aaa" lay-skin="primary" name="fields" value="其他技术" />其他技术
				<span style="color: red">(至少选一个)</span>
			</div>
		</div>
		<div class="layui-form-item layui-form-text talk">
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">其他技术的描述</label>
			<div class="layui-input-block">
				<textarea name="other" lay-verType="tips" lay-verify="clength"
					placeholder="请输入内容" class="layui-textarea othertalk"></textarea>
				<p>
					<em class="textarea-length4">0</em>/500<span style="color: red">(字符数控制在500汉字以内)</span>
				</p>
			</div>
		</div>
		<div class="layui-form-item indust">

			<div id="test2"></div>
			<label class="layui-form-label"
				style="font-size: 12px; font-style: SimHei">*应用行业</label>
			<div class="layui-input-block">
				<input type="text" name="hangye" autocomplete="off"
					class="layui-input industry" />
			</div>
		</div>



		<div class="layui-form-item">
			<div class="layui-input-inline"
				style="margin-left: 500px; margin-top: 10px;">
				<button class="layui-btn" id="btn" lay-submit lay-filter="*">保存并提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	$(".fl").hide();
	$(".talk").hide();
	$(".indust").hide();
	$(".keyword2").hide();
	$(".keyword3").hide();
	$(".keyword4").hide();
	$(".keyword5").hide();
	$(".layui-btn-danger").click(function() {
		location.href = "${pageContext.request.contextPath}/addxq.jsp";
	});
	$(".brief").bind('input propertychange', function() {
		var summary = $(this).val();

		$(".textarea-length").html(summary.length);
	});
	$(".overview").bind('input propertychange', function() {
		var summary = $(this).val();

		$(".textarea-length1").html(summary.length);
	});
	$(".overview2").bind('input propertychange', function() {
		var summary = $(this).val();

		$(".textarea-length2").html(summary.length);
	})
	$(".overview3").bind('input propertychange', function() {
		var summary = $(this).val();

		$(".textarea-length3").html(summary.length);
	})
	$(".othertalk").bind('input propertychange', function() {
		var summary = $(this).val();

		$(".textarea-length4").html(summary.length);
	})
	$(".keyword").bind('input propertychange', function() {
		var summary = $(this).val();
		if ($(this).val() != null) {
			$(".keyword2").show();
		}
	});
	$(".keyword2").bind('input propertychange', function() {
		var summary = $(this).val();
		if ($(this).val() != null) {
			$(".keyword3").show();
		}
	});
	$(".keyword3").bind('input propertychange', function() {
		var summary = $(this).val();
		if ($(this).val() != null) {
			$(".keyword4").show();
		}
	});
	$(".keyword4").bind('input propertychange', function() {
		var summary = $(this).val();
		if ($(this).val() != null) {
			$(".keyword5").show();
		}
	});
</script>
</html>