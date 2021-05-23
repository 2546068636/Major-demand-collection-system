package com.me.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.me.bean.UserBean;
import com.me.dbutils.DBUtils;
import com.me.dbutils.MD5Utils;

public class UserDao {

	public UserDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * 
	 *@Title: login 
	 *@description  用户登录的方法
	 *@author lenovo
	 *@return: UserBean
	 *@param user
	 *@return
	 */
	public static UserBean login(UserBean user) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "select * from t_user where username=? and password=?";
			UserBean bean;
			bean = qr.query(sql, new BeanHandler<UserBean>(UserBean.class), user.getUsername(), user.getPassword());
			return bean;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	
	/**
	 * 
	 *@Title: deleteuser 
	 *@description 删除用户的方法
	 *@author lenovo
	 *@return: int
	 *@param username
	 *@return
	 */
	public static int deleteuser(String username) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "delete from t_user where username=?";
			int i = 0;
			i = qr.update(sql, username);
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	
	/**
	 * 
	 *@Title: listuser 
	 *@description 遍历所有用户的方法
	 *@author lenovo
	 *@return: List<UserBean>
	 *@return
	 */
	public static List<UserBean> listuser() {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "select * from t_user";
			List<UserBean> list = null;
			list = qr.query(sql, new BeanListHandler<UserBean>(UserBean.class));
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	
	/**
	 * 
	 *@Title: register 
	 *@description 注册的方法
	 *@author lenovo
	 *@return: boolean
	 *@param u
	 *@return
	 */
	public static boolean register(UserBean u) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "insert into t_user (qid,username,credit,password,name,sex,province,dept,post,gddh,yx)values(?,?,?,?,?,?,?,?,?,?,?)";
			int i;
			i = qr.update(sql, 1, u.getUsername(), u.getCredit(), u.getPassword(), u.getName(), u.getSex(),
					u.getProvince(), u.getDept(), u.getPost(), u.getGddh(), u.getYx());
			if (i > 0) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * 
	 *@Title: updateuser 
	 *@description 修改用户的方法
	 *@author lenovo
	 *@return: int
	 *@param a
	 *@return
	 */
	public static int updateuser(UserBean a) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "update t_user set credit=?,password=?,name=?,sex=?,province=?,dept=?,post=?,gddh=?,yx=? where username=?";
			int i = 0;
			i = qr.update(sql, a.getCredit(), a.getPassword(), a.getName(), a.getSex(), a.getProvince(), a.getDept(),
					a.getPost(), a.getGddh(), a.getYx(), a.getUsername());
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	/**
	 * 
	 *@Title: updatePassword 
	 *@description 修改密码的方法
	 *@author lenovo
	 *@return: int
	 *@param username
	 *@param password
	 *@return
	 */
	public static int updatePassword(String username, String password) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "update t_user set password=? where username=?";
		int i = 0;
		try {
			i = qr.update(sql, password, username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
	/**
	 * 
	 *@Title: resetpass 
	 *@description 重置密码的方法
	 *@author lenovo
	 *@return: int
	 *@param username
	 *@return
	 *@throws SQLException
	 */
	public static int resetpass(String username) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String pass = MD5Utils.toMD5("123456");
		String sql = "update t_user set password=? where username=?";
		return qr.update(sql, pass, username);
	}
}
