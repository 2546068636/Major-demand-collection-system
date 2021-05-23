package com.me.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.me.bean.IPBean;
import com.me.bean.MyData;
import com.me.dao.KSHDao;

/**
 * Servlet implementation class IPServlet
 */
@WebServlet("/ipServlet")
public class IPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String geshu=request.getParameter("num");
		int num1=Integer.parseInt(geshu);
		String chose=request.getParameter("chose");
		System.out.println(geshu+chose);
		List<IPBean> list=null;
		try {
			list=KSHDao.tuke(num1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		List<MyData> mydata = new ArrayList<MyData>();
		for (IPBean ipbean :list) //遍历集合
	    {
		    	MyData info = new MyData();
				info.setName(ipbean.getIp());
				info.setValue(String.valueOf(ipbean.getSum()));
				mydata.add(info);
	            
	            
	    }
	    Gson gson = new Gson();
		String json = gson.toJson(mydata);
		request.setAttribute("list",list);
		request.setAttribute("json",json);
		request.setAttribute("tuway",chose);
		request.getRequestDispatcher("/keshihua.jsp").forward(request,response);
				
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
