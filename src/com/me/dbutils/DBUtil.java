package com.me.dbutils;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * <p>
 * Title: DBUtil.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2020
 * </p>
 * 
 * @author CuiXingYu
 * @date 2020��10��5��
 * @version 1.0
 */
public class DBUtil {
	// �������ݿ� url·�����û��� ���� //���������ݿ������ ҲҪ�޸�
	public static String db_url = "jdbc:mysql://localhost:3306/jscs5?serverTimezone=UTC&characterEncoding=UTF-8&useSSL=false&allowPublicKeyRetrieval=true";
	public static String db_user = "root"; // ���ݸ��˵�MySQL ���ݿ��s���޸�
	public static String db_password = "root"; // ��������ҲҪ�޸�

	/**
	 *@Title: getConn 
	 *@description
	 *@author lenovo
	 *@return: Connection
	 *@return
	 */
	public static Connection getConn() {
		Connection conn = null;
		try {
			// ���ݿ���������
			Class.forName("com.mysql.jdbc.Driver");
			try {
				// �������ݿ�
				conn = DriverManager.getConnection(db_url, db_user, db_password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("�������Ӽ��سɹ���");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ��������
		return conn;

	}

	// ���������� ����Java����������
	@SuppressWarnings("static-access")
	public static void main(String[] args) throws SQLException {
		DBUtil dbu = new DBUtil();
		Connection conn = dbu.getConn();
		/*
		 * String sql="insert into student values (?,?,?,?)"; PreparedStatement
		 * pstmt=conn.prepareStatement(sql); pstmt.setString(1, "scofield");
		 * pstmt.setInt(2, 45); pstmt.setInt(3, 89); pstmt.setInt(4, 100);
		 * pstmt.executeUpdate();
		 * 
		 * String sql1="select name,English from student where name = 'scofield'";
		 * PreparedStatement preparedStatement=conn.prepareStatement(sql1); ResultSet
		 * rs=preparedStatement.executeQuery(); if(rs.next()) {
		 * System.out.println(rs.getString("name"));
		 * System.out.println(rs.getInt("English")); }
		 */
	}

	// �رպ���
	public static void close(Statement state, Connection conn) {
		// ֻ��״̬������ʱ���ȹر�״̬
		if (state != null) {
			try {
				((Connection) state).close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// �رպ���
	public static void close(PreparedStatement state, Connection conn) {
		if (state != null) {
			try {
				((Connection) state).close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void close(ResultSet rs, Statement state, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (state != null) {
			try {
				((Connection) state).close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// �رպ���
	public static void close(java.sql.Statement state, Connection conn) {
		// TODO Auto-generated method stub
		if (state != null) {
			try {
				state.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * <p>
	 * Title: close
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 * 
	 * @param connection
	 * @param preparedStatement
	 * @param rs
	 */
	public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet rs) {
		// TODO Auto-generated method stub
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
