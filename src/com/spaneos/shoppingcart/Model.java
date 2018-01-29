package com.spaneos.shoppingcart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

public class Model {
	private final static Logger LOG = Logger.getLogger(Model.class.getName());

	public String register() {
		Connection con = JDBCHelper.getConnection();
		if (con == null) {
			return "cannot connect to DB. Contact admin!!!";
		}
		return null;
	}

	public String adminLogin(AdminLoginBean bean) {
		Connection con = null;
		PreparedStatement ps_sql = null, ps_ins = null;
		ResultSet rs = null;
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				return "cannot connect to DB. Contact admin!!!";
			} else {
				String name=bean.getAdminUserName();
				String pass=bean.getAdminPassword();
				ps_sql = con.prepareStatement("select * from Admins where AdminUserName=? and AdminPassword=?");
				ps_sql.setString(1, bean.getAdminUserName());
				ps_sql.setString(2, bean.getAdminPassword());
				LOG.info("login bean user name {}" + bean.getAdminUserName());
				LOG.info("login bean pass {}" + bean.getAdminPassword());
				ps_sql.execute();
				rs = ps_sql.getResultSet();
				if (!rs.next()) {
					return "Email id or Password is incorrect..";
				} else {
					// business validation succeeded
					// forward to menu.jsp
					return "SUCCESS";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!" + e.getMessage();
		}
	}

	public String addCategory(CategoryBean bean) {
		Connection con=null;
		PreparedStatement ps_sql=null, ps_ins=null;
		ResultSet rs=null;						
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				return "cannot connect to DB. Contact admin!!!";
			}
			else {
				ps_ins=con.prepareStatement("insert into Categories (CategoryName,CategoryDescription) values(?,?)");
				ps_ins.setString(1, bean.getCategoryName());
				ps_ins.setString(2, bean.getCategoryDescription());
				ps_ins.execute();	
				return "SUCCESS";		
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!"+e.getMessage();
		}

	}
	public List<String> getCategories(){
		Connection con=null;
		PreparedStatement ps_sql=null, ps_ins=null;
		ResultSet rs=null;
		List<String> categories=null;
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				return null;
			}
			else {
				ps_sql=con.prepareStatement("select CategoryName from Categories");
				ps_sql.execute();
				rs=ps_sql.getResultSet();
				categories=new ArrayList<String>();
				while(rs.next()) {
					String name=rs.getString("CategoryName");
					categories.add(name);
				}
				return categories;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}	
	}
	
	public String userRegisteration(UserRegistrationBean bean) {
		Connection con=null;
		PreparedStatement ps_sql=null, ps_ins=null;
		ResultSet rs=null;						
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				return "cannot connect to DB. Contact admin!!!";
			}
			else {
				ps_ins=con.prepareStatement("insert into Users"
						+ "(Name,Email,Mobile,Password,Gender,Address,DOB)"
						+ " values(?,?,?,?,?,?,?)");
				ps_ins.setString(1, bean.getUserName());
				ps_ins.setString(2, bean.getUserEmail());
				ps_ins.setString(3, bean.getUserMobile());
				ps_ins.setString(4, bean.getUserPassword());
				ps_ins.setString(5, bean.getUserGender());
				ps_ins.setString(6, bean.getUserAddress());
				ps_ins.setString(7, bean.getUserDob());
				ps_ins.execute();	
				return Constants.SUCCESS;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String userLogin(UserLoginBean bean) {
		Connection con = null;
		PreparedStatement ps_sql = null, ps_ins = null;
		ResultSet rs = null;
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				return "cannot connect to DB. Contact admin!!!";
			} else {
				ps_sql = con.prepareStatement("select * from Users where Email=? and Password=?");
				ps_sql.setString(1, bean.getUserId());
				ps_sql.setString(2, bean.getUserPass());
				ps_sql.execute();
				rs = ps_sql.getResultSet();
				if (!rs.next()) {
					return "Email id or Password is incorrect..";
				} else {
					// business validation succeeded
					// forward to menu.jsp
					return Constants.SUCCESS;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!" + e.getMessage();
		}

	}
	
	public List<UserBean> fetchusers(){
		Connection con = null;
		PreparedStatement ps_sql = null, ps_ins = null;
		ResultSet rs = null;
		List<UserBean> users=new ArrayList<UserBean>();
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				return null;
			} else {
				ps_sql = con.prepareStatement("select * from Users");
				ps_sql.execute();
				rs = ps_sql.getResultSet();
				while(rs.next()) {
					String name=rs.getString("Name");
					String email=rs.getString("Email");
					String mobile=rs.getString("Mobile");
					LOG.info("name "+name);
					LOG.info("user email "+email);
					LOG.info("user mobile "+mobile);
					UserBean user=new UserBean(name,email,mobile);
					users.add(user);
				}
				return users;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}