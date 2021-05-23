package com.me.dao;
import com.me.bean.one;
import com.me.bean.two;
import com.me.bean.three;
import com.me.bean.four;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.me.dbutils.DBUtil;


public class Dao {

	public static List<one> method(String types) {
		// TODO Auto-generated method stub
		List<one> list =new ArrayList<one>();
		Connection conn=DBUtil.getConn();
		ResultSet rs=null;
		//String sql= "select "+method+" "+method+" ,count(*) num from xuqiu where "+method+" = '"+method+"'";
		String sql= "select  *  from one where hkgs = 'all' limit 50";
		try {
			rs=conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				String dlr=rs.getString("dlr");
				String hkgs=rs.getString("hkgs");
				String xsl=rs.getString("xsl");
				String xse=rs.getString("xse");
				//int a=rs.getInt("num");
				one x=new one();
				x.setDlr(dlr);
				x.setHkgs(hkgs);
				x.setXse(xse);
				x.setXsl(xsl);
				list.add(x);
			}
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return list;
	}

	public static List<two> method2(String types) {
		// TODO Auto-generated method stub
		List<two> list =new ArrayList<two>();
		Connection conn=DBUtil.getConn();
		ResultSet rs=null;
		//String sql= "select "+method+" "+method+" ,count(*) num from xuqiu where "+method+" = '"+method+"'";
		String sql= "select  *  from two order by '"+types+"' limit 50";
		try {
			rs=conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				String dlr=rs.getString("dlr");
				String hyd=rs.getString("hyd");
				String rd=rs.getString("rd");
				String cd=rs.getString("cd");
				String pagerank=rs.getString("pagerank");
				//int a=rs.getInt("num");
				two x=new two();
				x.setDlr(dlr);
				x.setHyd(hyd);
				x.setRd(rd);
				x.setCd(cd);
				x.setPagerank(pagerank);
				list.add(x);
			}
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		
		
		return list;
	}

	public static List<three> method3() {
		// TODO Auto-generated method stub
		List<three> list =new ArrayList<three>();
		Connection conn=DBUtil.getConn();
		ResultSet rs=null;
		//String sql= "select "+method+" "+method+" ,count(*) num from xuqiu where "+method+" = '"+method+"'";
		String sql= "select  *  from three order by yll desc  limit 50   ";
		try {
			rs=conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				String dlr=rs.getString("dlr");
				String yll=rs.getString("yll");
				//int a=rs.getInt("num");
				three x=new three();
				x.setDlr(dlr);
				x.setYll(yll);
				list.add(x);
			}
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return list;
	}

	public static List<four> method4(String num) {
		// TODO Auto-generated method stub
		List<four> list =new ArrayList<four>();
		Connection conn=DBUtil.getConn();
		ResultSet rs=null;
		//String sql= "select "+method+" "+method+" ,count(*) num from xuqiu where "+method+" = '"+method+"'";
		String sql= "select * from five order by xsl limit "+num+"";
		try {
			rs=conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				String hkgs=rs.getString("hkgs");
				String xsl=rs.getString("xsl");
				String xse=rs.getString("xse");
				//int a=rs.getInt("num");
				four x=new four();
				x.setHkgs(hkgs);
				x.setXse(xse);
				x.setXsl(xsl);
				list.add(x);
			}
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		return list;
	}

}
