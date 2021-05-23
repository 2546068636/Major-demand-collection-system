
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>河北省重大技术需求征集调查系统需求系统登录成功</title>
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<link rel="stylesheet" href="layui/css/layui.css" />
<style>
.layui-tab-item {
	display: none;
	height: 5000px;
}
</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">重大科技需求系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->

			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img" />
						${user.username}
				</a></li>
				<li class="layui-nav-item"><a href="userservlet?method=logout">安全退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<c:if test="${qid==0}">
						<li class="layui-nav-item"><a href="javascript:;">需求操作</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang" data-url="addxq.jsp"
									mytitle="需求征集">
									<a>需求征集</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="listxq.jsp?name=${user.username }" mytitle="管理需求">
									<a>管理需求</a>
								</dd>
							</dl></li>
						<li class="layui-nav-item"><a href="javascript:;">用户操作</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="updatemyself.jsp?username=${user.username }&credit=${user.credit}&password=${user.password}&name=${user.name}&sex=${user.sex}&province=${user.province}&dept=${user.dept}&post=${user.post}&phone=${user.gddh}&email=${user.yx}"
									mytitle="查看、修改个人信息">
									<a>查看、修改个人信息</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="updatepass.jsp?username=${user.username }&passwordcode=${user.password}"
									mytitle="修改密码">
									<a>修改密码</a>
								</dd>
							</dl></li>
					</c:if>

					<c:if test="${qid==1}">


						<li class="layui-nav-item"><a href="javascript:;">形式审核统计查询</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xuqiuservlet?method=getwsh"
									mytitle="分类查询">
									<a>分类查询</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xuqiuservlet?method=getwshzh"
									mytitle="综合查询">
									<a>综合查询</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xstb.jsp"
									mytitle="图表查询">
									<a>图表查询</a>
								</dd>
							</dl></li>

						<li class="layui-nav-item"><a href="javascript:;">用户操作</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="updatemyself.jsp?username=${user.username }&credit=${user.credit}&password=${user.password}&name=${user.name}&sex=${user.sex}&province=${user.province}&dept=${user.dept}&post=${user.post}&phone=${user.gddh}&email=${user.yx}"
									mytitle="查看、修改个人信息">
									<a>查看、修改个人信息</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="updatepass.jsp?username=${user.username }&passwordcode=${user.password}"
									mytitle="修改密码">
									<a>修改密码</a>
								</dd>
							</dl></li>

					</c:if>


					<c:if test="${qid==2}">
						<li class="layui-nav-item"><a href="javascript:;">部门审核统计查询</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xuqiuservlet?method=getbmwshname&glcs=${user.glcs}"
									mytitle="分类查询">
									<a>分类查询</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xuqiuservlet?method=getbmwshnamezh&glcs=${user.glcs}"
									mytitle="综合查询">
									<a>综合查询</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/bmtb.jsp?glcs=${user.glcs}"
									mytitle="图表查询">
									<a>图表查询</a>
								</dd>
							</dl></li>

						<li class="layui-nav-item"><a href="javascript:;">用户操作</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="updatemyself.jsp?username=${user.username }&credit=${user.credit}&password=${user.password}&name=${user.name}&sex=${user.sex}&province=${user.province}&dept=${user.dept}&post=${user.post}&phone=${user.gddh}&email=${user.yx}"
									mytitle="查看、修改个人信息">
									<a>查看、修改个人信息</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="updatepass.jsp?username=${user.username }&passwordcode=${user.password}"
									mytitle="修改密码">
									<a>修改密码</a>
								</dd>
							</dl></li>

					</c:if>


					<c:if test="${qid==3}">
						<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/register.jsp?user=admin"
									mytitle="添加用户">
									<a>添加用户</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/listuser.jsp"
									mytitle="管理用户">
									<a>管理用户</a>
								</dd>
							</dl></li>
						<li class="layui-nav-item"><a href="javascript:;">形式审核统计查询</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xuqiuservlet?method=getwsh"
									mytitle="分类查询">
									<a>分类查询</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xuqiuservlet?method=getwshzh"
									mytitle="综合查询">
									<a>综合查询</a>
								</dd>
							</dl></li>
						<li class="layui-nav-item"><a href="javascript:;">部门审核统计查询</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xuqiuservlet?method=getbmwshname&glcs=${user.glcs}"
									mytitle="分类查询">
									<a>分类查询</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="${pageContext.request.contextPath}/xuqiuservlet?method=getbmwshnamezh&glcs=${user.glcs}"
									mytitle="综合查询">
									<a>综合查询</a>
								</dd>
							</dl></li>

						<li class="layui-nav-item"><a href="javascript:;">用户操作</a>
							<dl class="layui-nav-child">
								<dd class="layui-nav-item leftdaohang"
									data-url="updatemyself.jsp?username=${user.username }&credit=${user.credit}&password=${user.password}&name=${user.name}&sex=${user.sex}&province=${user.province}&dept=${user.dept}&post=${user.post}&phone=${user.gddh}&email=${user.yx}"
									mytitle="查看、修改个人信息">
									<a>查看、修改个人信息</a>
								</dd>
								<dd class="layui-nav-item leftdaohang" data-url="listuser.jsp"
									mytitle="遍历用户">
									<a>遍历用户</a>
								</dd>
								<dd class="layui-nav-item leftdaohang"
									data-url="updatepass.jsp?username=${user.username }&passwordcode=${user.password}"
									mytitle="修改密码">
									<a>修改密码</a>
								</dd>
																<dd class="layui-nav-item leftdaohang"
									data-url="updatepass.jsp?username=${user.username }&passwordcode=${user.password}"
									mytitle="修改密码">
									<a>权限管理</a>
								</dd>
																<dd class="layui-nav-item leftdaohang"
									data-url="updatepass.jsp?username=${user.username }&passwordcode=${user.password}"
									mytitle="修改密码">
									<a>角色管理</a>
								</dd>
							</dl></li>

					</c:if>


				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!--tabs标签-->
			<div class="layui-tab layui-tab-card" lay-filter="demo"
				lay-allowclose="true">
				<ul class="layui-tab-title">
					<!--<li class="layui-this">角色管理</li>-->
				</ul>
				<div class="layui-tab-content" style="height: 300000px;">
					<!--<div class="layui-tab-item layui-show">
                  1. 我个人比较喜欢卡片风格的，所以你发现又是以卡片的风格举例
                  2. 删除功能适用于所有风格
                </div>-->
					<!--<div class="layui-tab-item">
                    <iframe  style="width: 100%;height: 100%;" scrolling="no" src="jiaose.html" ></iframe>
                </div>-->
				</div>
			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			业务咨询电话：0311-85813216 技术服务电话：0311-87936070
		</div>
	</div>
	<script src="layui/layui.all.js"></script>
	<script>
		layui
				.use(
						'element',
						function() {
							var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

							//触发事件
							var active = {
								tabAdd : function() {
									//新增一个Tab项
									var htmlurl = $(this).attr('data-url');
									var mytitle = $(this).attr('mytitle');
									//alert("触发tab增加事件："+mytitle);
									//先判断是否已经有了tab
									var arrayObj = new Array();//创建一个数组  
									$(".layui-tab-title").find('li').each(
											function() {
												var y = $(this).attr("lay-id");
												arrayObj.push(y);
											});
									//                    alert("遍历取到的数组："+arrayObj);
									var have = $.inArray(mytitle, arrayObj); //返回 3,
									if (have >= 0) {
										//tab已有标签
										//                        alert("遍历的已有标签："+mytitle);
										element.tabChange('demo', mytitle); //切换到当前点击的页面
									} else {
										//没有相同tab
										//                      alert("遍历的没有相同tab："+mytitle);
										element
												.tabAdd(
														'demo',
														{
															title : mytitle //用于演示
															,
															content : '<iframe style="width: 100%;height: 100%;" scrolling="no" src='
																	+ htmlurl
																	+ ' ></iframe>',
															id : mytitle
														//实际使用一般是规定好的id，这里以时间戳模拟下
														})
										element.tabChange('demo', mytitle); //切换到当前点击的页面
									}
								}

							};
							$(".leftdaohang").click(
									function() {
										var type = "tabAdd";
										var othis = $(this);
										//                var htmlurl=$(this).attr('data-url');
										//                var mytitle=$(this).attr('mytitle');
										active[type] ? active[type].call(this,
												othis) : '';
									});

						});
	</script>

</body>
</html>