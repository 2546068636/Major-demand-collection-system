package com.me.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.me.bean.three;
import com.me.dao.Dao;

/**
 * Servlet implementation class getinfo3
 */
@WebServlet("/getinfo3")
public class getinfo3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getinfo3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		// ͼ������
		String tblx=request.getParameter("tblx");
		// ��������
		//String types=request.getParameter("type"); 
		
		List<three> list1=Dao.method3();
		
		 Gson gson=new Gson();
		 String json=gson.toJson(list1);
		 System.out.println(json);
		 request.setAttribute("json", json);
		 request.setAttribute("type", tblx);
		 request.setAttribute("info", list1);
		 //request.setAttribute("types",types);
		 request.getRequestDispatcher("EchartTest3.jsp").forward(request, response);
	}

}
