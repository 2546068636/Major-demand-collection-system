package com.me.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.me.bean.IPBean;
import com.me.dbutils.DBUtils;

public class KSHDao {

	public KSHDao() {
		// TODO Auto-generated constructor stub
	}
public  static List<IPBean> tuke(int limit)throws  IOException, SQLException{
		QueryRunner qr=new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from iptu order by sum desc limit ?";
		List<IPBean> list=null;
		list=qr.query(sql, new BeanListHandler<IPBean>(IPBean.class), limit);
		System.out.println(list);
		return list;
}
}
