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
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
<script type="text/javascript">



        

 </script>
<script>
layui.use(['form','laypage'], function(){
  var form = layui.form
  ,laypage = layui.laypage;
  
  //各种基于事件的操作，下面会有进一步介绍
  laypage.render({
    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
    ,count: 50 //数据总数，从服务端得到
  });
  form.render();
});
</script>
</head>
<body style="margin-top: 15px; margin-left: 10px;">
	<div style="text-align: center;">
		<h1>综合检索</h1>
	</div>
	<form class="layui-form"
		action="${pageContext.request.contextPath}/GuanServlet?method=searchzong"
		method="post">
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>


				</select>
			</div>

			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;形式审核:
			<input type="radio" name="shen1" value="同意" lay-ignore />通过 <input
				type="radio" name="shen1" value="不同意" lay-ignore />未通过
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门审核: <input type="radio" name="shen"
				value="同意" lay-ignore />通过 <input type="radio" name="shen"
				value="不同意" lay-ignore />未通过 <input type="submit" value="检索"
				align="center"
				style="height: 30px; width: 100px; border-color: #FAFAD2; border-radius: 10px; background: #87CEFA; margin-top: 3px; margin-left: 55px;">
			<input type="hidden" name="username"
				value="<%=request.getParameter("username")%>">
		</div>
		<div class="layui-form-item shu1">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu2">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu3">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu4">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu5">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu6">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu7">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu8">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu9">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu10">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu11">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>
		<div class="layui-form-item shu12">
			<div class="layui-input-inline">
				<select name="classzong" lay-verType="alert" lay-search>
					<option value="">请选择想检索的条件</option>
					<option value="oname">机构全称</option>
					<option value="sub">归口管理单位</option>
					<option value="saddress">所在地域</option>
					<option value="representative">法人代表</option>
					<option value="linkman">联系人</option>
					<option value="attribute">机构属性</option>
					<option value="demandname">技术需求名称</option>
					<option value="keyword">关键字</option>
					<option value="money1">拟投入资金总额</option>
					<option value="medel">技术需求解决方式</option>
					<option value="type">科技活动类型</option>
					<option value="classify">学科分类</option>
					<option value="field">需求技术所属领域</option>
					<option value="industry">需求技术应用行业</option>

				</select>
			</div>
			<select name="luo" lay-ignore id="sway">
				<option value="并含">并含</option>
				<option value="或者">或者</option>
				<option value="非">非</option>
			</select>
			<div class="layui-input-inline">
				<input type="text" name="zhi" placeholder="" autocomplete="off"
					class="layui-input zhi">
			</div>
			<select name="sway" lay-ignore id="sway">
				<option value="模糊查询">模糊查询</option>
				<option value="精准查询">精准查询</option>
			</select>


		</div>

	</form>
	<button class="ti">添加</button>
	<button class="ji">消除</button>
	<table class="layui-table">
		<thead>
			<tr>
				<th>需求名称</th>
				<th>机构名称</th>
				<th>所在地域</th>
				<th>归口管理单位</th>
				<th>机构属性</th>
				<th>科技活动类型</th>

				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<%
				try {
				Class.forName("com.mysql.jdbc.Driver"); //驱动程序名
				String db_url = "jdbc:mysql://localhost:3306/sys?&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

				String db_user = "root";

				String db_pass = "123456";
				Connection conn = DriverManager.getConnection(db_url, db_user, db_pass);

				if (conn != null) {
					out.print("查询成功！");
					//out.print("<br />");
					Statement stmt = null;
					ResultSet rs = null;
					String sql = null;
					String way = request.getParameter("roleway");
					String username = request.getParameter("username");
					System.out.println(username);
					//String username2=request.getParameter("username");
					System.out.println(way);
					//System.out.println(username2);

					if (way.equals("all")) { //通过界面跳转时传一个roleway的参数来判断是查询整个界面还是进行了精准查询
				if (username != "薛普") {
					sql = "select * from  Biao";
					PreparedStatement prpe1 = (PreparedStatement) conn.prepareStatement(sql);
					rs = prpe1.executeQuery();

				} else {
					sql = "select * from  Biao where guan=?";
					PreparedStatement prpe1 = (PreparedStatement) conn.prepareStatement(sql);
					prpe1.setString(1, username);
					rs = prpe1.executeQuery();
				}
					} else if (way.equals("one")) {
				sql = "select * from Biao where ";
				String[] classzong = request.getParameterValues("classzong");
				String[] zhi = request.getParameterValues("zhi");
				String shen = request.getParameter("shen");
				String shen1 = request.getParameter("shen1");//形式审核
				String[] sway = request.getParameterValues("sway");
				String[] luo = request.getParameterValues("luo");
				String jiesql = null;
				int a = 0;
				//根据你选择了的检索的标引个数来判断 该次检索有几个条件来查询
				for (int i = 0; i < classzong.length; i++) {
					//因为我的框是预先存在，只是用hide隐藏了，点击提交时所有12个模块都会被提交，所以我们根据标引下拉框数组的长度来确定条件的个数
					if (classzong[i].equals("")) { //如果为空就跳出整个循环确定前面有几个不为空就是条件个数
						a = i;
						break;
					}
				}
				/*for (int i = 0; i < a; i++)
				{
					System.out.println(classzong[i]);
					System.out.println(luo[i]);
				}
				
				for (int i = 0; i < a; i++)
				{
					System.out.println(luo[i]);
				}*/
				//根据a即条件个数动态的拼接sql语句
				for (int i = 0; i < a; i++) {
					if (zhi[i].equals("") || zhi == null) {//如果某一个标引输入框值为空就跳出本次循环忽略该标引对应的sql拼接继续拼接下一条
						System.out.println(i + "为空");
						continue;

					}
					//查询值默认就是输入值
					String searchValue = zhi[i];
					//如果符号是like，再将前后加上%
					if (sway[i].equals("精准查询")) {

						sql = sql + " " + classzong[i] + " ='" + zhi[i] + "'";
					} else if (sway[i].equals("模糊查询")) {
						sql = sql + " " + classzong[i] + " like '%" + zhi[i] + "%'";
					}

					if (luo[i].equals("并含")) {
						if (!zhi[i + 1].equals("")) {//如果下一个标引被忽略则它前面的逻辑拼接也要被去除
							if (i < a - 1) { //防止多加一个逻辑条件
								sql = sql + " and";
							}
						}

					} else if (luo[i].equals("或者")) {
						if (!zhi[i + 1].equals("")) {//如果下一个标引被忽略则它前面的逻辑拼接也要被去除
							if (i < a - 1) {
								sql = sql + " or";
							}
						}
					}

				}
				if (shen1 != null && shen != null) {
					jiesql = " and shen='" + shen + "'" + " and shen2='" + shen1 + "'";

				} else if (shen != null && shen1 == null) {
					jiesql = " and shen='" + shen + "'";
				} else if (shen == null && shen1 != null) {
					jiesql = " and shen2='" + shen1 + "'";
				} else {
					jiesql = null;
				}
				if (jiesql != null) {
					sql = sql + jiesql;
				}

				System.out.println(sql);
				PreparedStatement prpe = (PreparedStatement) conn.prepareStatement(sql);

				rs = prpe.executeQuery();

					}

					String stus = null;//部门审核
					String stus2 = null;//形式审核
					//out.print("查询结果：");  
					//out.print("<br/>");
					while (rs.next()) {
			%>
			<tr data-id="1">
				<td><%=rs.getString("demandname")%></td>
				<td><%=rs.getString("oname")%></td>
				<td><%=rs.getString("saddress")%></td>
				<td><%=rs.getString("sub")%></td>
				<td><%=rs.getString("attribute")%></td>
				<td><%=rs.getString("type")%></td>

				<td class="td-manage"><a title="查看"
					href="${pageContext.request.contextPath}/BrowserServlet?method=search&way=look&id=<%=rs.getInt("id") %>&oname=<%=request.getParameter("workplace") %>">
						<i class="layui-icon layui-icon-edit"></i>
				</a></td>
			</tr>

			<%
				}
			} else {
			out.print("连接失败！");
			}
			} catch (Exception e) {
			e.printStackTrace();
			out.print("数据库连接异常！");
			}
			%>
		</tbody>
	</table>
	<div id="test1"></div>
</body>

<script type="text/javascript">
//综合查询框

$(".shu1").hide();
$(".shu2").hide();
$(".shu3").hide();
$(".shu4").hide();
$(".shu5").hide();
$(".shu6").hide();
$(".shu7").hide();
$(".shu8").hide();
$(".shu9").hide();
$(".shu10").hide();
$(".shu11").hide();
$(".shu12").hide();

var a=1;
$(".ti").click(function () {
	
	var s=".shu"+a;
	
	$(s).show();
	a++;

});
$(".ji").click(function () {
	
	var s=".shu"+a;
	
	$(s).hide();
	a--;

});
//修改提示弹窗


var xiu='<%=request.getParameter("tell")%>';
if(xiu=="no")
{
	alert("正在审核中不可修改！");
}
else if(xiu=="true"){
	alert("修改成功！");
}
//删除需求的按钮监听
function del(id) {
    var flag = confirm("确认要删除该需求吗？");
    if(flag){
    	location.href = "${pageContext.request.contextPath}/QuestServlet?method=deletequest&id="+id;
    	alert("删除成功");
    }
}
//删除成功提示
var deleteq='<%=request.getParameter("deletequest") %>
	';
	if (deleteq == "true") {
		alert("删除成功！");
	}
</script>
</html>