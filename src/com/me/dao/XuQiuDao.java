package com.me.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.me.bean.TJBean;
import com.me.bean.UserBean;
import com.me.bean.XuQiuBean;
import com.me.dbutils.DBUtils;

public class XuQiuDao {

	public XuQiuDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 
	 *@Title: addXuQiu 
	 *@description 添加需求的方法
	 *@author lenovo
	 *@return: boolean
	 *@param x
	 *@return
	 */
	public static boolean addXuQiu(XuQiuBean x) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "insert into t_xq (bmstatus,jj,status,name,organizationName,manageDept,e_address,province,web,email,represent,post,contact,gddh,phone,fax,attribute,solution,xqname,qsyear,jzyear,mainProblem,tkey,destination,money,keyword1,keyword2,keyword3,keyword4,keyword5,type,classify,fields,hangye,others) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			int i;
			i = qr.update(sql, "未审核", x.getJj(), "未审核", x.getName(), x.getOrganizationName(), x.getManageDept(),
					x.getE_address(), x.getProvince(), x.getWeb(), x.getEmail(), x.getRepresent(), x.getPost(),
					x.getContact(), x.getGddh(), x.getPhone(), x.getFax(), x.getAttribute(), x.getSolution(),
					x.getXqname(), x.getQsyear(), x.getJzyear(), x.getMainProblem(), x.getTkey(), x.getDestination(),
					x.getMoney(), x.getKeyword1(), x.getKeyword2(), x.getKeyword3(), x.getKeyword4(), x.getKeyword5(),
					x.getType(), x.getClassify(), x.getFields(), x.getHangye(), x.getOthers());
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
	 *@Title: xsagree 
	 *@description 形式审核同意方法
	 *@author lenovo
	 *@return: int
	 *@param id
	 *@return
	 */
	public static int xsagree(int id) {
		int i = 0;
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "update t_xq set status=? where id=?";
			i = qr.update(sql, "同意", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	/**
	 * 
	 *@Title: setDept 
	 *@description 设置管理处室的方法
	 *@author lenovo
	 *@return: int
	 *@param id
	 *@param dept
	 *@return
	 */
	public static int setDept(int id, String dept) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "update t_xq set glcs=? where id=?";
			int i = qr.update(sql, dept, id);
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

	
	/**
	 * 
	 *@Title: xsdisagree 
	 *@description 形式审核不同意的方法
	 *@author lenovo
	 *@return: int
	 *@param id
	 *@param comment
	 *@return
	 */
	public static int xsdisagree(int id, String comment) {
		int i = 0;
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "update t_xq set status=?,xscomment=? where id=?";
			i = qr.update(sql, "不同意", comment, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	/**
	 * 
	 *@Title: flcx 
	 *@description 分类查询的方法
	 *@author lenovo
	 *@return: List<XuQiuBean>
	 *@param mode 模式 模糊查询或者精确查询
	 *@param content 查询的内容
	 *@param xssh 形式审核是否同意
	 *@param bmsh 部门审核是否同意
	 *@param option 查询的条件 如机构属性，等等
	 *@return
	 *@throws SQLException
	 */
	@SuppressWarnings("unused")
	public static List<XuQiuBean> flcx(String mode, String content, String xssh, String bmsh, String option)
			throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_xq where 1=1 ";
		List<XuQiuBean> list = null;
		if (xssh != null) {
			if (xssh.equals("通过")) {
				sql += " and status='同意'  ";
			} else {
				sql += " and status!='同意'  ";
			}
		} else {
		}
		if (bmsh != null) {
			if (bmsh.equals("通过")) {
				sql += " and bmstatus='同意'  ";
			} else {
				sql += " and bmstatus!='同意'  ";
			}
		} else {
		}
		if (mode.equals("模糊查询")) {
			if (option.equals("keyword")) {// 关键字查询
				if (content.equals("")) {// 内容为空
					// 无需参数
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class));
				} else {
					sql += " and (keyword1 like ? or keyword2 like ? or keyword3 like? or keyword4 like? or keyword5 like ?) ";
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), "%" + content + "%",
							"%" + content + "%", "%" + content + "%", "%" + content + "%", "%" + content + "%");
				}
			} else {// 不为关键字查询
				if ("".equals(option)) {
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class));
				} else {
					if (!content.equals("")) {
						sql += " and " + " " + option + " " + " like ?  ";
						System.out.println(sql);
						list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), "%" + content + "%");
					} else {
						list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class));
					}

				}
			}
		} else {// 为精确查询
			if (option.equals("keyword")) {// 关键字查询
				if (content.equals("")) {// 内容为空
					// 无需参数
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class));
				} else {
					sql += " and (keyword1 = ? or = like ? or = like? or = like? or = like ?) ";
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), content, content, content,
							content, content);
				}
			} else {// 不为关键字查询
				if ("".equals(option)) {
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class));

				} else {
					if (!content.equals("")) {
						sql += " and " + " " + option + " " + " = ?  ";
						list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), content);
					} else {
						list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class));
					}

				}
			}
		}
		return list;
	}
	/**
	 * 
	 *@Title: flcxbm 
	 *@description 部门人员分类查询的方法
	 *@author lenovo
	 *@return: List<XuQiuBean>
	 *@param glcs 部门审核人员的管理处室
	 *@param mode 查询模式 模糊查询或者精确查询
	 *@param content 查询内容
 	 *@param xssh 形式审核是否通过
	 *@param bmsh 部门审核是否通过
	 *@param option 查询条件
	 *@return
	 *@throws SQLException
	 */
	@SuppressWarnings("unused")
	public static List<XuQiuBean> flcxbm(String glcs, String mode, String content, String xssh, String bmsh,
			String option) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select * from t_xq where 1=1 ";
		List<XuQiuBean> list = null;
		if (xssh != null) {
			if (xssh.equals("通过")) {
				sql += " and status='同意'  ";
			} else {
				sql += " and status!='同意'  ";
			}
		} else {
		}
		if (bmsh != null) {
			if (bmsh.equals("通过")) {
				sql += " and bmstatus='同意'  ";
			} else {
				sql += " and bmstatus!='同意'  ";
			}
		} else {
		}
		if (mode.equals("模糊查询")) {
			if (option.equals("keyword")) {// 关键字查询
				if (content.equals("")) {// 内容为空
					// 无需参数
					sql += " and glcs =?";
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), glcs);
				} else {
					sql += " and (keyword1 like ? or keyword2 like ? or keyword3 like? or keyword4 like? or keyword5 like ?) and glcs=?";
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), "%" + content + "%",
							"%" + content + "%", "%" + content + "%", "%" + content + "%", "%" + content + "%", glcs);
				}
			} else {// 不为关键字查询
				if ("".equals(option)) {
					sql += " and  glcs= ?";
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), glcs);
				} else {
					if (!content.equals("")) {
						sql += " and " + " " + option + " " + " like ?  and glcs=?";
						System.out.println(sql);
						list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), "%" + content + "%",
								glcs);
					} else {
						sql += " and glcs =? ";
						list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), glcs);
					}
				}
			}
		} else {// 为精确查询
			if (option.equals("keyword")) {// 关键字查询
				if (content.equals("")) {// 内容为空
					// 无需参数
					sql += " and glcs=? ";
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), glcs);
				} else {
					sql += " and (keyword1 = ? or = like ? or = like? or = like? or = like ?) and glcs =?";
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), content, content, content,
							content, content, glcs);
				}
			} else {// 不为关键字查询
				if ("".equals(option)) {
					sql += " and glcs=?";
					list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), glcs);
				} else {
					if (!content.equals("")) {
						sql += " and " + " " + option + " " + " = ?   and glcs=?";
						list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), content, glcs);
					} else {
						sql += " and glcs=?";
						list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), glcs);
					}

				}
			}
		}
		return list;

	}
	
	/**
	 * 
	 *@Title: zhcx 
	 *@description 形式审核员综合查询的方法
	 *@author lenovo
	 *@return: List<XuQiuBean>
	 *@param sql 前台拼接的sql语句
	 *@param glcs 管理处室
	 *@return
	 */
	public static List<XuQiuBean> zhcx(String sql, String glcs) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		sql += " and glcs = ? ";
		List<XuQiuBean> query = null;
		try {
			query = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), glcs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}
	
	/**
	 * 
	 *@Title: listbmwshbyname 
	 *@description 查询自己部门的需求的方法
	 *@author lenovo
	 *@return: List<XuQiuBean>
	 *@param glcs 管理处室
	 *@return
	 */
	public static List<XuQiuBean> listbmwshbyname(String glcs) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "select * from t_xq where glcs= ?";
			List<XuQiuBean> list = null;
			list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), glcs);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 
	 *@Title: xbmagree 
	 *@description 部门审核同意的方法
	 *@author lenovo
	 *@return: int
	 *@param id
	 *@return
	 */
	public static int xbmagree(int id) {
		int i = 0;
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "update t_xq set bmstatus=? where id=?";
			i = qr.update(sql, "同意", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	/**
	 * 
	 *@Title: bmdisagree 
	 *@description 部门审核不同意的方法
	 *@author lenovo
	 *@return: int
	 *@param id
	 *@param comment 不同意的意见
	 *@return
	 */
	public static int bmdisagree(int id, String comment) {
		int i = 0;
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "update t_xq set bmstatus=?,bmcomment=? where id=?";
			i = qr.update(sql, "不同意", comment, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public static List<XuQiuBean> getXuQiu(String name) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "select * from t_xq where name=?";
			List<XuQiuBean> list = null;
			list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), name);
			System.out.println(list);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	/**
	 * 
	 *@Title: updateXuQiu 
	 *@description 更新需求的方法
	 *@author lenovo
	 *@return: int
	 *@param x
	 *@return
	 *@throws SQLException
	 */
	public static int updateXuQiu(XuQiuBean x) throws SQLException {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "update t_xq set organizationName=?,manageDept=?,e_address=?,province=?,web=?,email=?,represent=?,post=?,contact=?,gddh=?,phone=?,fax=?,attribute=?,others=?,solution=?,xqname=?,qsyear=?,jzyear=?,mainProblem=?,tkey=?,destination=?,money=?,keyword1=?,keyword2=?,keyword3=?,keyword4=?,keyword5=?,type=?,classify=?,fields=?,hangye=?,jj=? where id =?";
		int i = qr.update(sql, x.getOrganizationName(), x.getManageDept(), x.getE_address(), x.getProvince(),
				x.getWeb(), x.getEmail(), x.getRepresent(), x.getPost(), x.getContact(), x.getGddh(), x.getPhone(),
				x.getFax(), x.getAttribute(), x.getOthers(), x.getSolution(), x.getXqname(), x.getQsyear(),
				x.getJzyear(), x.getMainProblem(), x.getTkey(), x.getDestination(), x.getMoney(), x.getKeyword1(),
				x.getKeyword2(), x.getKeyword3(), x.getKeyword4(), x.getKeyword5(), x.getType(), x.getClassify(),
				x.getFields(), x.getHangye(), x.getJj(), x.getId());
		return i;
	}
	
	
	/**
	 * 
	 *@Title: deleteXuQiu 
	 *@description 删除需求的方法
	 *@author lenovo
	 *@return: int
	 *@param id 需求id
	 *@return
	 */
	public static int deleteXuQiu(int id) {
		int i = 0;
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "delete from t_xq where id=?";

			i = qr.update(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}
	
	/**
	 * 
	 *@Title: getxswsh 
	 *@description 查询形式未审核的方法
	 *@author lenovo
	 *@return: List<XuQiuBean>
	 *@return
	 */
	public static List<XuQiuBean> getxswsh() {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "select * from t_xq";
			List<XuQiuBean> list = null;
			list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class));
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
	
	/**
	 * 
	 *@Title: getbmwsh 
	 *@description 查询部门未审核的方法
	 *@author lenovo
	 *@return: List<XuQiuBean>
	 *@param glcs
	 *@return
	 */
	public static List<XuQiuBean> getbmwsh(String glcs) {
		try {
			QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
			String sql = "select * from t_xq where bmstatus =? and glcs=?";
			List<XuQiuBean> list = null;
			list = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class), "未审核", glcs);
			System.out.println(list);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * 
	 *@Title: gettb 
	 *@description 查询图表的方法
	 *@author lenovo
	 *@return: List<TJBean>
	 *@param tjzd 统计字段
	 *@param sql 前台的sql语句
	 *@return
	 */
	public static List<TJBean> gettb(String tjzd, String sql) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql1 = "select " + tjzd + " tjzdz from (" + sql + ")  aa";
		System.out.println("实际上是是是是" + sql1);
		List<TJBean> query = null;
		try {
			query = qr.query(sql1, new BeanListHandler<TJBean>(TJBean.class));
			System.out.println(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}

	
	/**
	 * 
	 *@Title: tb 
	 *@description 获取图表的数据源的方法
	 *@author lenovo
	 *@return: List<XuQiuBean>
	 *@param sql
	 *@return
	 */
	public static List<XuQiuBean> tb(String sql) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		System.out.println(sql);
		List<XuQiuBean> query = null;
		try {
			query = qr.query(sql, new BeanListHandler<XuQiuBean>(XuQiuBean.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}
	
	
	/**
	 * 
	 *@Title: tjtb 
	 *@description 获取统计图表的数据源
	 *@author lenovo
	 *@return: TJBean 
	 *@param tjzd 统计字段
	 *@param tjzdz 统计字段值
	 *@param glcs 管理处室
	 *@return
	 */
	public static TJBean tjtb(String tjzd, String tjzdz, String glcs) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select " + tjzd + " " + tjzd + " ,count(*) num from t_xq where " + tjzd + " = '" + tjzdz + "'"
				+ " and glcs= " + "'" + glcs + "'";
		System.out.println(sql);
		TJBean query = null;
		try {
			query = qr.query(sql, new BeanHandler<TJBean>(TJBean.class));
			System.out.println("tjtb" + query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}

	/**
	 * 
	 *@Title: tjtbxs 
	 *@description 获取形式审核图表数据的方法
	 *@author lenovo
	 *@return: TJBean
	 *@param tjzd
	 *@param tjzdz
	 *@return
	 */
	public static TJBean tjtbxs(String tjzd, String tjzdz) {
		QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
		String sql = "select " + tjzd + " " + tjzd + " ,count(*) num from t_xq where " + tjzd + " = '" + tjzdz + "'";
		System.out.println(sql);
		TJBean query = null;
		try {
			query = qr.query(sql, new BeanHandler<TJBean>(TJBean.class));
			System.out.println("tjtb" + query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return query;
	}
	
	public static int getStart(int page,int limit) {
		return (page-1)*limit;
	}
	
	public static int getEnd(int page,int limit) {
		return page*limit-1;
	}
	public static List<XuQiuBean> getPage(List<XuQiuBean> list,int page,int limit){
		return list.subList(getStart(page,limit),getEnd(page,limit));
	}
	
	public static List<UserBean> getPageUser(List<UserBean> list,int page,int limit){
		return list.subList(getStart(page,limit),getEnd(page,limit));
	}

	public static void main(String[] args) {
//		 List<TJBean> list=gettb("attribute");
//		 System.out.println(list);
	}
}
