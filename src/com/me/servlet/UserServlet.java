package com.me.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.me.bean.UserBean;
import com.me.bean.XuQiuBean;
import com.me.dao.UserDao;
import com.me.dao.XuQiuDao;
import com.me.dbutils.MD5Utils;

import net.sf.json.JSONObject;



/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/userservlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method=request.getParameter("method");
		System.out.println("method"+method);
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if(method.equals("login")) {
			login(request,response);
		}else if(method.equals("register")) {
			register(response,request);
		}else if(method.equals("logout")) {
			logout(request,response);
		}else if(method.equals("userlist")) {
			listuser(request,response);
		}else if(method.equals("deleteuser")) {
			deleteuser(request,response);
		}else if(method.equals("updateuser")) {
			updateuser(request,response);
		}else if(method.equals("updatemyself")) {
			updatemyself(request,response);
		}else if(method.equals("updatepassword")) {
			updatepassword(request,response);
		}else if(method.equals("resetpass")){
			try {
				resetpass(request,response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

		
	
	/**
	 * 
	 *@Title: resetpass 
	 *@description 重置密码方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 *@throws SQLException
	 */
	private void resetpass(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		int i=UserDao.resetpass(username);
		System.out.println(i>0?1:2);
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("state",i>0?1:2);
        jsonObject.put("code",0);
        jsonObject.put("msg","null");
        System.out.println(jsonObject);
        response.getWriter().print(jsonObject);
	}
	/**
	 * 
	 *@Title: updatepassword 
	 *@description 修改密码的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 */
	private void updatepassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String password=request.getParameter("password");
		String username=request.getParameter("username");
		String passwordcode=MD5Utils.toMD5(password);
			if(UserDao.updatePassword(username, passwordcode)>0) {
				response.getWriter().write("修改成功");
			}else {
				response.getWriter().write("修改失败");
			}
		
	}

	/**
	 * 
	 *@Title: updatemyself 
	 *@description 修改信息的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 */
	private void updatemyself(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String credit=request.getParameter("credit");
		String password=request.getParameter("password");
		String passwordmd5=MD5Utils.toMD5(password);
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String province =request.getParameter("province");
		System.out.println(province);
		String dept=request.getParameter("dept");
		String post=request.getParameter("post");
		String gddh=request.getParameter("gddh");
		String yx=request.getParameter("yx");
		UserBean user=new UserBean();
		user.setUsername(username);
		user.setCredit(credit);
		user.setPassword(passwordmd5);
		user.setSex(sex);
		user.setProvince(province);
		user.setDept(dept);
		user.setPost(post);
		user.setGddh(gddh);
		user.setYx(yx);
		user.setName(name);
		int i =0;
		i=UserDao.updateuser(user);
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("state",i>0?1:2);
        jsonObject.put("code",0);
        jsonObject.put("msg","null");
        System.out.println(jsonObject);
        try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 *@Title: updateuser 
	 *@description 修改用户
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 */
	private void updateuser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String credit=request.getParameter("credit");
		String password=request.getParameter("password");
		String passwordmd5=MD5Utils.toMD5(password);
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String province =request.getParameter("province");
		System.out.println(province);
		String dept=request.getParameter("dept");
		String post=request.getParameter("post");
		String gddh=request.getParameter("gddh");
		String yx=request.getParameter("yx");
		UserBean user=new UserBean();
		user.setUsername(username);
		user.setCredit(credit);
		user.setPassword(passwordmd5);
		user.setSex(sex);
		user.setProvince(province);
		user.setDept(dept);
		user.setPost(post);
		user.setGddh(gddh);
		user.setYx(yx);
		user.setName(name);
		int i =0;
		i=UserDao.updateuser(user);
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("state",i>0?1:2);
        jsonObject.put("code",0);
        jsonObject.put("msg","null");
        System.out.println(jsonObject);
        response.getWriter().print(jsonObject);
	}

	/**
	 * 
	 *@Title: deleteuser 
	 *@description 删除用户的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 */
	private void deleteuser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		int i=UserDao.deleteuser(username);
		System.out.println(i>0?1:2);
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("state",i>0?1:2);
        jsonObject.put("code",0);
        jsonObject.put("msg","null");
        System.out.println(jsonObject);
        response.getWriter().print(jsonObject);
	}

	/**
	 * 
	 *@Title: listuser 
	 *@description 遍历所有用户的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 *@throws ServletException
	 */
	private void listuser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		List<UserBean> list=null;
		list=UserDao.listuser();
		if(!list.isEmpty()) {
		        Gson gson=new Gson();

			response.getWriter().write(gson.toJson(list));
			
		}else {
			request.setAttribute("message", "遍历失败！");
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: logout 
	 *@description 退出登录的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 */
	private void logout(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.getSession().removeAttribute("qid");
			request.getSession().removeAttribute("user");
			response.sendRedirect("login.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * 
	 *@Title: register 
	 *@description 注册的方法
	 *@author lenovo
	 *@return: void
	 *@param response
	 *@param request
	 *@throws IOException
	 *@throws ServletException
	 */
	private void register(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String registerstatus="registerfail";
		String usertype=request.getParameter("user");
		String username=request.getParameter("username");
//		String username1=new String(username.getBytes("ISO-8859-1"),"utf-8");
		String credit=request.getParameter("credit");
		String password=request.getParameter("password");
		String passwordmd5=MD5Utils.toMD5(password);
		String name=request.getParameter("name");
//		String name1=new String(name.getBytes("ISO-8859-1"),"utf-8");
		String sex=request.getParameter("sex");
//		String sex1=new String(sex.getBytes("ISO-8859-1"),"utf-8");
		String province =request.getParameter("province");
//		String province1=new String(province.getBytes("ISO-8859-1"),"utf-8");
		System.out.println(province);
		String dept=request.getParameter("dept");
//		String dept1=new String(dept.getBytes("ISO-8859-1"),"utf-8");
		String post=request.getParameter("post");
//		String post1=new String(post.getBytes("ISO-8859-1"),"utf-8");
		String gddh=request.getParameter("gddh");
		String yx=request.getParameter("yx");
		UserBean user=new UserBean();
		user.setUsername(username);
		user.setCredit(credit);
		user.setPassword(passwordmd5);
		user.setSex(sex);
		user.setProvince(province);
		user.setDept(dept);
		user.setPost(post);
		user.setGddh(gddh);
		user.setYx(yx);
		user.setName(name);
		System.out.println(usertype);
		if(UserDao.register(user)) {
			if(usertype.equals("admin")) {
				registerstatus="adminregistersuccess";
				System.out.println(registerstatus);
				response.getWriter().write(registerstatus);
			}else {
				registerstatus="registersuccess";
				System.out.println(registerstatus);
				response.getWriter().write(registerstatus);
			}

		}
		else {
			registerstatus="registerfail";
			response.getWriter().write(registerstatus);
		}
	}

	/**
	 * 
	 *@Title: login 
	 *@description 登录的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 *@throws ServletException
	 */
	@SuppressWarnings("unused")
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String loginstatus="loginfail";
		String username=request.getParameter("username");
		
		String password=request.getParameter("password");
		String passwordmd5=MD5Utils.toMD5(password);
		UserBean user=new UserBean();
		user.setPassword(passwordmd5);
		user.setUsername(username);
		UserBean user1=null;
		user1=UserDao.login(user);
		String vcode=request.getSession().getAttribute("loginCapcha").toString();
		String code=request.getParameter("vcode");
		System.out.println(code+"=?"+vcode);
		loginstatus="loginfail";
		if(code.equals(vcode)) {
			
			if(user1!=null) {
				request.getSession().setAttribute("user", user1);
				request.getSession().setAttribute("qid", user1.getQid());
				request.setAttribute("message", "登录成功");
				loginstatus="loginsuccess";
				response.getWriter().write("loginsuccess");
			}else{
				request.setAttribute("message", "登录失败");
				loginstatus="loginError";
				response.getWriter().write("loginError");
			}
		}else {
			loginstatus="vcodeError";
			response.getWriter().write("vcodeError");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
