package com.me.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.me.bean.TJBean;
import com.me.bean.XuQiuBean;
import com.me.dao.XuQiuDao;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class XuQiuServlet
 */
@WebServlet("/xuqiuservlet")
public class XuQiuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuQiuServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		System.out.println(method);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if (method.equals("addxq")) {
			addXuQiu(request, response);
		} else if (method.equals("listxq")) {
			listxq(request, response);
		} else if (method.equals("deletexq")) {
			deletexq(request, response);
		} else if (method.equals("updatexq")) {
			try {
				updatexq(request, response);
			} catch (UnsupportedEncodingException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (method.equals("listxswsh")) {
			listxswsh(request, response);
		} else if (method.equals("listbmwsh")) {
			listbmwsh(request, response);
		} else if (method.equals("xsagreeornot")) {
			xsagreeornot(request, response);
		} else if (method.equals("bmagreeornot")) {
			bmagreeornot(request, response);
		} else if (method.equals("xsflcx")) {
			try {
				flcx(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (method.equals("getwsh")) {
			getwsh(request, response);
		} else if (method.equals("getbmwshname")) {
			getbmwshname(request, response);
		} else if (method.equals("bmflcx")) {
			try {
				flcxbm(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (method.equals("zhcx")) {
			zhcx(request, response);
		} else if (method.equals("getwshzh")) {
			getwshzh(request, response);
		} else if (method.equals("getbmwshnamezh")) {
			getbmwshnamezh(request, response);
		} else if (method.equals("xstb")) {
			xstb(request, response);
		} else if (method.equals("bmtb")) {
			bmtb(request, response);
		}
	}
	
	/**
	 * 
	 *@Title: getbmwshnamezh 
	 *@description 获得部门未审核需求的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void getbmwshnamezh(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String glcs = request.getParameter("glcs");
		List<XuQiuBean> list = null;
		list = XuQiuDao.listbmwshbyname(glcs);
		if (!list.isEmpty()) {
			request.setAttribute("list", list);
			System.out.println(list);
			request.getRequestDispatcher("listbmwshzh.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: getwshzh 
	 *@description 获得未审核需求的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void getwshzh(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<XuQiuBean> list = null;
		list = XuQiuDao.getxswsh();
		if (!list.isEmpty()) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("listxswshzh.jsp").forward(request, response);

		}
	}

	
	/**
	 * 
	 *@Title: zhcx 
	 *@description 综合查询的servlet
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 *@throws ServletException
	 */
	private void zhcx(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String sql = request.getParameter("sql");
		String glcs = request.getParameter("glcs");

		List<XuQiuBean> list = XuQiuDao.zhcx(sql, glcs);
		request.setAttribute("list", list);
		// System.out.println(xvQiuList.get(0).getModel()+"123");
		if (list == null) {
			response.getWriter().write("加载失败！");
		} else {
			request.getRequestDispatcher("listxswshzh.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: flcxbm 
	 *@description 部门审核员进行分类查询的servlet
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws SQLException
	 *@throws ServletException
	 *@throws IOException
	 */
	private void flcxbm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		String xssh = request.getParameter("xssh");
		String bmsh = request.getParameter("bmsh");
		String content = request.getParameter("content");
		String mode = request.getParameter("mode");
		String option = request.getParameter("option");
		String glcs = request.getParameter("glcs");
		System.out.println("形式审核" + xssh + "部门审核" + bmsh + "内容" + content + "精确模糊" + mode + "option" + option);
		List<XuQiuBean> list = null;
		list = XuQiuDao.flcxbm(glcs, mode, content, xssh, bmsh, option);
		if (!list.isEmpty()) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("listbmwshfl.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: getbmwshname 
	 *@description 获得部门审核员本部门的需求
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void getbmwshname(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String glcs = request.getParameter("glcs");
		List<XuQiuBean> list = null;
		list = XuQiuDao.listbmwshbyname(glcs);
		if (!list.isEmpty()) {
			request.setAttribute("list", list);
			System.out.println(list);
			request.getRequestDispatcher("listbmwshfl.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: getwsh 
	 *@description 获得形式未审核的所有需求
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void getwsh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<XuQiuBean> list = null;
		list = XuQiuDao.getxswsh();
		if (!list.isEmpty()) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("listxswshfl.jsp").forward(request, response);

		}
	}

	/**
	 * 
	 *@Title: flcx 
	 *@description 分类查询的servlet
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws SQLException
	 *@throws IOException
	 *@throws ServletException
	 */
	private void flcx(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		// TODO Auto-generated method stub
		String xssh = request.getParameter("xssh");
		String bmsh = request.getParameter("bmsh");
		String content = request.getParameter("content");
		String mode = request.getParameter("mode");
		String option = request.getParameter("option");
		System.out.println("形式审核" + xssh + "部门审核" + bmsh + "内容" + content + "精确模糊" + mode + "option" + option);
		List<XuQiuBean> list = null;
		list = XuQiuDao.flcx(mode, content, xssh, bmsh, option);
		if (!list.isEmpty()) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("listxswshfl.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: bmagreeornot 
	 *@description 部门审核的servlet
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void bmagreeornot(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String isornot = request.getParameter("isornotbm");
		String comment = request.getParameter("bmcomment");
		String tp = request.getParameter("tp");
		System.out.println(tp + "tp");
		String glcs = request.getParameter("glcs");
		if (isornot.equals("同意")) {
			int i = XuQiuDao.xbmagree(id);
			if (i > 0) {
				if (tp.equals("fl")) {

					request.getRequestDispatcher("listbmwshfl.jsp").forward(request, response);
				} else {

					request.getRequestDispatcher("listbmwshzh.jsp").forward(request, response);
				}

			}
		} else {
			int y = XuQiuDao.bmdisagree(id, comment);
			if (y > 0) {
				if (tp.equals("fl")) {
					request.getRequestDispatcher("listbmwshfl.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("listbmwshzh.jsp").forward(request, response);
				}
			}

		}
	}

	/**
	 * 
	 *@Title: xsagreeornot 
	 *@description 形式审核的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void xsagreeornot(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String isornot = request.getParameter("isornotxs");
		String comment = request.getParameter("xscomment");
		String tp = request.getParameter("tp");
		String glcs = request.getParameter("glcs");

		if (isornot.equals("同意")) {
			int i = XuQiuDao.xsagree(id);
			if (i > 0) {
				int p = XuQiuDao.setDept(id, glcs);
				if (p > 0) {
					if (tp.equals("fl")) {

						request.getRequestDispatcher("xuqiuservlet?method=getwsh").forward(request, response);
					} else {

						request.getRequestDispatcher("xuqiuservlet?method=getwsh").forward(request, response);
					}
				}
			}
		} else {
			int y = XuQiuDao.xsdisagree(id, comment);
			if (y > 0) {
				if (tp.equals("fl")) {
					request.getRequestDispatcher("listxswshfl.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("listxswshzh.jsp").forward(request, response);
				}
			}

		}
	}

	/**
	 * 
	 *@Title: updatexq 
	 *@description 修改需求的servlet
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws SQLException
	 *@throws IOException
	 */
	private void updatexq(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		System.out.println(name);
		String organization = request.getParameter("organizationName");
		String manageDept = request.getParameter("manageDept");
		String eaddress = request.getParameter("eaddress");
		String province = request.getParameter("province");
		System.out.println(province);
		String web = request.getParameter("web");
		System.out.println(web);
		String email = request.getParameter("email");
		String represent = request.getParameter("represent");
		String post = request.getParameter("post");
		String contact = request.getParameter("contact");
		String gddh = request.getParameter("gddh");
		String phone = request.getParameter("phone");
		String fax = request.getParameter("fax");
		String jj = request.getParameter("jj");
		String attribute = request.getParameter("attribute");
		String solution = request.getParameter("solution");
		String xqname = request.getParameter("xqname");
		String qsyear = request.getParameter("qsyear");
		String jzyear = request.getParameter("jzyear");
		String mainProblem = request.getParameter("overview");
		String tkey = request.getParameter("overview2");
		String destination = request.getParameter("overview3");
		String keyword1 = request.getParameter("keyword1");
		String keyword2 = request.getParameter("keyword2");
		String keyword3 = request.getParameter("keyword3");
		String keyword4 = request.getParameter("keyword4");
		String keyword5 = request.getParameter("keyword5");
		String money = request.getParameter("money");
		String type = request.getParameter("type");
		String classify = request.getParameter("classify");
		String fields = request.getParameter("fields");
		String hangye = request.getParameter("hangye");
		String others = request.getParameter("others");
		XuQiuBean b = new XuQiuBean();
		b.setJj(jj);
		b.setId(id);
		b.setAttribute(attribute);
		b.setClassify(classify);
		b.setContact(contact);
		b.setDestination(destination);
		b.setE_address(eaddress);
		b.setEmail(email);
		b.setFax(fax);
		b.setFields(fields);
		b.setGddh(gddh);
		b.setHangye(hangye);
		b.setJzyear(jzyear);
		b.setKeyword1(keyword1);
		b.setKeyword2(keyword2);
		b.setKeyword3(keyword3);
		b.setKeyword4(keyword4);
		b.setKeyword5(keyword5);
		b.setMainProblem(mainProblem);
		b.setManageDept(manageDept);
		b.setMoney(money);
		b.setName(name);
		b.setOrganizationName(organization);
		b.setOthers(others);
		b.setPhone(phone);
		b.setPost(post);
		b.setProvince(province);
		b.setQsyear(qsyear);
		b.setRepresent(represent);
		b.setSolution(solution);
		b.setTkey(tkey);
		b.setType(type);
		b.setWeb(web);
		b.setXqname(xqname);
		int i = XuQiuDao.updateXuQiu(b);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("state", i > 0 ? 1 : 2);
		jsonObject.put("code", 0);
		jsonObject.put("msg", "null");
		System.out.println(jsonObject);
		response.getWriter().print(jsonObject);

	}

	/**
	 * 
	 *@Title: deletexq 
	 *@description 删除需求的servlet
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void deletexq(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int id = Integer.parseInt(request.getParameter("id"));
		int i = XuQiuDao.deleteXuQiu(id);
		System.out.println(i > 0 ? 1 : 2);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("state", i > 0 ? 1 : 2);
		jsonObject.put("code", 0);
		jsonObject.put("msg", "null");
		System.out.println(jsonObject);
		response.getWriter().print(jsonObject);
	}

	/**
	 * 
	 *@Title: listxq 
	 *@description 获得需求的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void listxq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		List<XuQiuBean> list = null;
		list = XuQiuDao.getXuQiu(name);
		if (!list.isEmpty()) {
			Gson gson = new Gson();

			response.getWriter().write(gson.toJson(list));

		} else {
			request.setAttribute("message", "遍历失败！");
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: listxswsh 
	 *@description 获得形式未审核的需求
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void listxswsh(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<XuQiuBean> list = null;
		list = XuQiuDao.getxswsh();
		if (!list.isEmpty()) {
			Gson gson = new Gson();

			response.getWriter().write(gson.toJson(list));

		} else {
			request.setAttribute("message", "遍历失败！");
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: listbmwsh 
	 *@description 获得部门未审核的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws ServletException
	 *@throws IOException
	 */
	private void listbmwsh(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<XuQiuBean> list = null;
		String glcs = request.getParameter("glcs");
		System.out.println(glcs);
		list = XuQiuDao.getbmwsh(glcs);
		if (!list.isEmpty()) {
			Gson gson = new Gson();

			response.getWriter().write(gson.toJson(list));

		} else {
			request.setAttribute("message", "遍历失败！");
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

	/**
	 * 
	 *@Title: addXuQiu 
	 *@description 添加需求的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 *@throws ServletException
	 */
	private void addXuQiu(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		System.out.println(name);
		String organization = request.getParameter("organizationName");
		String manageDept = request.getParameter("manageDept");
		String eaddress = request.getParameter("eaddress");
		String province = request.getParameter("province");
		System.out.println(province);
		String web = request.getParameter("web");
		System.out.println(web);
		String email = request.getParameter("email");
		String represent = request.getParameter("represent");
		String post = request.getParameter("post");
		String contact = request.getParameter("contact");
		String gddh = request.getParameter("gddh");
		String phone = request.getParameter("phone");
		String fax = request.getParameter("fax");
		String jj = request.getParameter("jj");
		String attribute = request.getParameter("attribute");
		String solution = request.getParameter("solution");
		String xqname = request.getParameter("xqname");
		String qsyear = request.getParameter("qsyear");
		String jzyear = request.getParameter("jzyear");
		String mainProblem = request.getParameter("overview");
		String tkey = request.getParameter("overview2");
		String destination = request.getParameter("overview3");
		String keyword1 = request.getParameter("keyword1");
		String keyword2 = request.getParameter("keyword2");
		String keyword3 = request.getParameter("keyword3");
		String keyword4 = request.getParameter("keyword4");
		String keyword5 = request.getParameter("keyword5");
		String money = request.getParameter("money");
		String type = request.getParameter("type");
		String classify = request.getParameter("classify");
		String fields = request.getParameter("fields");
		String hangye = request.getParameter("hangye");
		String others = request.getParameter("others");
		XuQiuBean b = new XuQiuBean();
		b.setJj(jj);
		b.setAttribute(attribute);
		b.setClassify(classify);
		b.setContact(contact);
		b.setDestination(destination);
		b.setE_address(eaddress);
		b.setEmail(email);
		b.setFax(fax);
		b.setFields(fields);
		b.setGddh(gddh);
		b.setHangye(hangye);
		b.setJzyear(jzyear);
		b.setKeyword1(keyword1);
		b.setKeyword2(keyword2);
		b.setKeyword3(keyword3);
		b.setKeyword4(keyword4);
		b.setKeyword5(keyword5);
		b.setMainProblem(mainProblem);
		b.setManageDept(manageDept);
		b.setMoney(money);
		b.setName(name);
		b.setOrganizationName(organization);
		b.setOthers(others);
		b.setPhone(phone);
		b.setPost(post);
		b.setProvince(province);
		b.setQsyear(qsyear);
		b.setRepresent(represent);
		b.setSolution(solution);
		b.setTkey(tkey);
		b.setType(type);
		b.setWeb(web);
		b.setXqname(xqname);
		if (XuQiuDao.addXuQiu(b)) {
			request.getRequestDispatcher("listxq.jsp").forward(request, response);
		}

	}

	/**
	 * 
	 *@Title: xstb 
	 *@description 获得形式审核图表的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 *@throws ServletException
	 */
	private void xstb(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String sql = request.getParameter("sql");
		String tjzd = request.getParameter("tjzd");
		String tblx = request.getParameter("tblx");
		System.out.println(sql + tjzd);
		List<TJBean> list2 = XuQiuDao.gettb(tjzd, sql);
		// System.out.println(list2);
		List<String> list4 = new ArrayList<String>();
		for (TJBean tjtb : list2) {
			String tjzdz = tjtb.getTjzdz();
			list4.add(tjzdz);
		}
		LinkedHashSet<String> hashSet = new LinkedHashSet<>(list4);
		ArrayList<String> listWithoutDuplicates = new ArrayList<>(hashSet);
		List<TJBean> list3 = new ArrayList<TJBean>();
		for (int i = 0; i < listWithoutDuplicates.size(); i++) {
			TJBean tjtb = XuQiuDao.tjtbxs(tjzd, listWithoutDuplicates.get(i));
			list3.add(tjtb);
		}
		System.out.println("list3" + list3);
		Gson gson = new Gson();
		String json = gson.toJson(list3);
		request.setAttribute("list", list3);
		request.setAttribute("tjzd", tjzd);
		request.setAttribute("data", json);
		request.setAttribute("tblx", tblx);
		System.out.println(tblx + "ssss");
		System.out.println(json);

		if (list3 == null) {
			response.getWriter().write("加载失败！");
		} else {
			request.getRequestDispatcher("xstb.jsp").forward(request, response);
		}
	}

	/**
	 * 
	 *@Title: bmtb 
	 *@description 获得部门审核图表的方法
	 *@author lenovo
	 *@return: void
	 *@param request
	 *@param response
	 *@throws IOException
	 *@throws ServletException
	 */
	private void bmtb(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String sql = request.getParameter("sql");
		String tjzd = request.getParameter("tjzd");
		String tblx = request.getParameter("tblx");
		String glcs = request.getParameter("glcs");
		// sql+=" and glcs="+ glcs +" ";
		sql += " and glcs=" + "'" + glcs + "'" + " ";
		System.out.println(glcs + "管理处是");
		System.out.println(sql + tjzd);
		List<TJBean> list2 = XuQiuDao.gettb(tjzd, sql);
		// System.out.println(list2);
		List<String> list4 = new ArrayList<String>();
		for (TJBean tjtb : list2) {
			String tjzdz = tjtb.getTjzdz();
			list4.add(tjzdz);
		}
		System.out.println("LIST4" + list4);

		LinkedHashSet<String> hashSet = new LinkedHashSet<>(list4);
		ArrayList<String> listWithoutDuplicates = new ArrayList<>(hashSet);
		List<TJBean> list3 = new ArrayList<TJBean>();
		for (int i = 0; i < listWithoutDuplicates.size(); i++) {
			TJBean tjtb = XuQiuDao.tjtb(tjzd, listWithoutDuplicates.get(i), glcs);
			list3.add(tjtb);
		}
		System.out.println("list3" + list3);
		Gson gson = new Gson();
		String json = gson.toJson(list3);
		request.setAttribute("list", list3);
		request.setAttribute("tjzd", tjzd);
		request.setAttribute("data", json);
		request.setAttribute("tblx", tblx);
		System.out.println(tjzd);
		System.out.println(tblx + "ssss");
		System.out.println(json);

		if (list3 == null) {
			response.getWriter().write("加载失败！");
		} else {
			request.getRequestDispatcher("bmtb.jsp").forward(request, response);
		}
	}

}
