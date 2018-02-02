package com.spaneos.shoppingcart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.apache.log4j.Logger;
//import org.json.JSONException;
//import org.json.JSONObject;

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
	/**
	 * 
	 * @param bean
	 * @return
	 */
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

	public String updateCategory(CategoryBean bean) {
		Connection con=null;
		PreparedStatement ps_up=null;						
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				throw new RuntimeException("Cannot connect to DB.");
			}
			else {
				ps_up=con.prepareStatement("UPDATE Categories SET CategoryDescription=? WHERE CategoryName=?");
				ps_up.setString(1, bean.getCategoryDescription());
				ps_up.setString(2, bean.getCategoryName());
				ps_up.execute();	
				return "SUCCESS";		
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!"+e.getMessage();
		}

	}
	/**
	 * 
	 * @return
	 */
	public List<CategoryBean> getCategories(){
		Connection con=null;
		PreparedStatement ps_sql=null, ps_ins=null;
		ResultSet rs=null;
		List<CategoryBean> categories=null;
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				return null;
			}
			else {
				ps_sql=con.prepareStatement("select * from Categories");
				ps_sql.execute();
				rs=ps_sql.getResultSet();
				categories=new ArrayList<CategoryBean>();
				while(rs.next()) {
					String name=rs.getString("CategoryName");
					String description=rs.getString("CategoryDescription");
					CategoryBean bean=new CategoryBean();
					bean.setCategoryName(name);
					bean.setCategoryDescription(description);
					categories.add(bean);
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

	public String updateUser(UserRegistrationBean bean) {
		Connection con=null;
		PreparedStatement ps_up=null;				
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				throw new RuntimeException("Cannot connect to DB.");
			}
			else {
				ps_up=con.prepareStatement("UPDATE Users SET Name=?, Mobile=?, Password=?, Gender=?, Address=?, DOB=? WHERE Email=?");
				ps_up.setString(1, bean.getUserName());
				ps_up.setString(2, bean.getUserMobile());
				ps_up.setString(3, bean.getUserPassword());
				ps_up.setString(4, bean.getUserGender());
				ps_up.setString(5, bean.getUserAddress());
				ps_up.setString(6, bean.getUserDob());
				ps_up.setString(7, bean.getUserEmail());
				ps_up.execute();	
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

	public List<UserBean> fetchUsers(){
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


	public List<UserRegistrationBean> fetchSpecificUser(String requestEmail){
		Connection con = null;
		PreparedStatement ps_sql = null, ps_ins = null;
		ResultSet rs = null;
		List<UserRegistrationBean> specificUser=new ArrayList<UserRegistrationBean>();
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				return null;
			} else {
				ps_sql = con.prepareStatement("select * from Users where Email=?");
				ps_sql.setString(1, requestEmail);
				ps_sql.execute();
				rs = ps_sql.getResultSet();
				while(rs.next()) {
					String name=rs.getString("Name");
					String email=rs.getString("Email");
					String mobile=rs.getString("Mobile");
					String password=rs.getString("Password");
					String gender=rs.getString("Gender");
					String address=rs.getString("Address");
					String dob=rs.getString("DOB");
					UserRegistrationBean bean=new UserRegistrationBean();
					bean.setUserName(name);
					bean.setUserEmail(email);
					bean.setUserPassword(password);
					bean.setUserMobile(mobile);
					bean.setUserAddress(address);
					bean.setUserGender(gender);
					bean.setUserDob(dob);
					LOG.info("Specific user bean "+bean);
					specificUser.add(bean);
				}
				return specificUser;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 
	 */
	public String deleteUser(String email) {
		Connection con = null;
		PreparedStatement ps_del = null;
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connect to DB. Contact admin");
			} else {
				ps_del = con.prepareStatement("delete from Users where Email=?");
				ps_del.setString(1, email);
				if(ps_del.executeUpdate()==1) {
					return Constants.SUCCESS;
				}
				else {
					return "Cannot delete the user.";
				}
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!" + e.getMessage();
		}
	}
	/**
	 * 
	 * @param bean
	 * @return
	 */
	public String addProduct(ProductBean bean) {
		Connection con=null;
		PreparedStatement ps_ins=null;
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				throw new RuntimeException("Cannot connect to DB. Contact admin.");
			}
			else {
				ps_ins=con.prepareStatement("insert into Products (CategoryName,Name,Description,Price,InStock) values(?,?,?,?,?)");
				ps_ins.setString(1, bean.getCategoryName());
				ps_ins.setString(2, bean.getProductName());
				ps_ins.setString(3, bean.getDescription());
				ps_ins.setInt(4, bean.getPrice());
				ps_ins.setInt(5, bean.getStock());

				ps_ins.execute();	
				return "SUCCESS";		
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!"+e.getMessage();
		}

	}


	public String updateProduct(ProductBean bean) {
		Connection con=null;
		PreparedStatement ps_up=null;
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				throw new RuntimeException("Cannot connect to DB. Contact admin.");
			}
			else {
				ps_up=con.prepareStatement("Update Products SET CategoryName=?,Description=?,Price=?,InStock=? Where Name=?");
				ps_up.setString(1, bean.getCategoryName());
				ps_up.setString(2, bean.getDescription());
				ps_up.setInt(3, bean.getPrice());
				ps_up.setInt(4, bean.getStock());
				ps_up.setString(5, bean.getProductName());
				ps_up.execute();	
				return "SUCCESS";		
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!"+e.getMessage();
		}

	}
	/**
	 * 
	 * @param categoryName
	 * @return
	 */
	public List<ProductBean> fetchProducts(String categoryName){
		LOG.info("Modal category name"+categoryName);
		Connection con = null;
		PreparedStatement ps_sql = null, ps_ins = null;
		ResultSet rs = null;
		List<ProductBean> products=new ArrayList<ProductBean>();
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connct to DB. Contact admin.");
			} else {
				ps_sql = con.prepareStatement("select * from Products where CategoryName=?");
				ps_sql.setString(1, categoryName);
				ps_sql.execute();
				rs = ps_sql.getResultSet();
				while(rs.next()) {
					String name=rs.getString("Name");
					int price=rs.getInt("Price");
					int stock=rs.getInt("InStock");
					LOG.info("product name "+name);
					LOG.info("product price"+price);
					LOG.info("product in stock"+stock);
					ProductBean product=new ProductBean();
					product.setProductName(name);
					product.setPrice(price);
					product.setStock(stock);
					product.setCategoryName(categoryName);
					products.add(product);
					LOG.info("Products in modal "+products);

				}
				return products;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<ProductBean> fetchSpecificProduct(String productName){
		LOG.info("Modal product name"+productName);
		Connection con = null;
		PreparedStatement ps_sql = null, ps_ins = null;
		ResultSet rs = null;
		List<ProductBean> products=new ArrayList<ProductBean>();
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connct to DB. Contact admin.");
			} else {
				ps_sql = con.prepareStatement("select * from Products where Name=?");
				ps_sql.setString(1, productName);
				ps_sql.execute();
				rs = ps_sql.getResultSet();
				while(rs.next()) {
					String name=rs.getString("Name");
					int price=rs.getInt("Price");
					int stock=rs.getInt("InStock");
					String description=rs.getString("Description");
					String categoryName=rs.getString("CategoryName");
					LOG.info("product name "+name);
					LOG.info("product price"+price);
					LOG.info("product in stock"+stock);
					LOG.info("product in description"+description);

					ProductBean product=new ProductBean();
					product.setProductName(name);
					product.setPrice(price);
					product.setStock(stock);
					product.setDescription(description);
					product.setCategoryName(productName);
					product.setCategoryName(categoryName);
					products.add(product);
					LOG.info("Products in modal "+products);

				}
				return products;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}



	/**
	 * 
	 * @param name
	 * @return
	 */
	public String deleteProduct(String name) {
		Connection con = null;
		PreparedStatement ps_del = null;
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connect to DB. Contact admin");
			} else {
				ps_del = con.prepareStatement("delete from Products where Name=?");
				ps_del.setString(1, name);
				if(ps_del.executeUpdate()==1) {
					LOG.info("product deleted successfully!!!");
					return Constants.SUCCESS;
				}
				else {
					return "Cannot delete the user.";
				}
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!" + e.getMessage();
		}
	}

	public String deleteCategory(String name) {
		Connection con = null;
		PreparedStatement ps_del = null;
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connect to DB. Contact admin");
			} else {
				ps_del = con.prepareStatement("delete from Products where CategoryName=?");
				ps_del.setString(1, name);
				ps_del.execute();
				ps_del = con.prepareStatement("delete from Categories where CategoryName=?");
				ps_del.setString(1, name);
				if(ps_del.executeUpdate()==1) {
					LOG.info("Category deleted successfully!!!");
					return Constants.SUCCESS;
				}
				else {
					return "Cannot delete the user.";
				}
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!" + e.getMessage();
		}
	}

	public List<ProductBean> fetchAllProducts(){
		Connection con = null;
		PreparedStatement ps_sql = null;
		ResultSet rs = null;
		List<ProductBean> products=new ArrayList<ProductBean>();
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connct to DB. Contact admin.");
			} else {
				ps_sql = con.prepareStatement("select * from Products");
				ps_sql.execute();
				rs = ps_sql.getResultSet();
				while(rs.next()) {
					String name=rs.getString("Name");
					int price=rs.getInt("Price");
					int stock=rs.getInt("InStock");
					String categoryName=rs.getString("CategoryName");
					String description=rs.getString("Description");
					LOG.info("product name "+name);
					LOG.info("product price"+price);
					LOG.info("product in stock"+stock);
					ProductBean product=new ProductBean();
					product.setProductName(name);
					product.setDescription(description);
					product.setPrice(price);
					product.setStock(stock);
					product.setCategoryName(categoryName);
					products.add(product);
					LOG.info("Products in modal "+products);

				}
				return products;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	public String addCart(List<PurchaseBean> beans, String userEmail) {
		Connection con=null;
		PreparedStatement ps_ins=null, ps_up=null;
		try {
			con=JDBCHelper.getConnection();
			if(con==null) {
				throw new RuntimeException("Cannot connect to DB. Contact admin.");
			}
			else {
				for (PurchaseBean purchaseBean : beans) {
					ps_ins=con.prepareStatement("insert into Cart (UserEmail,ProductName,ProductPrice,Items) values(?,?,?,?)");
					ps_ins.setString(1, userEmail);
					ps_ins.setString(2, purchaseBean.getProductName());
					for (ProductBean product : fetchSpecificProduct(purchaseBean.getProductName())) {
						ps_ins.setInt(3, (product.getPrice()*purchaseBean.getQuantity()));
					}
					ps_ins.setInt(4, purchaseBean.getQuantity());
					ps_ins.execute();

					for (ProductBean product : fetchSpecificProduct(purchaseBean.getProductName())) {
						ps_up=con.prepareStatement("Update Products SET InStock=? Where Name=?");
						int newStock=product.getStock()-purchaseBean.getQuantity();
						ps_up.setInt(1, newStock);
						ps_up.setString(2, purchaseBean.getProductName());
						ps_up.execute();

					}

				}
				return "SUCCESS";		
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!"+e.getMessage();
		}
	}
	
	
	public List<CartBean> fetchCartProducts(String userEmail){	
		Connection con = null;
		PreparedStatement ps_sql = null, ps_ins = null;
		ResultSet rs = null;
		List<CartBean> products=new ArrayList<CartBean>();
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connct to DB. Contact admin.");
			} else {
				ps_sql = con.prepareStatement("select * from Cart where UserEmail=?");
				ps_sql.setString(1, userEmail);
				ps_sql.execute();
				rs = ps_sql.getResultSet();
				while(rs.next()) {
					String name=rs.getString("ProductName");
					int price=rs.getInt("ProductPrice");
					int quantity=rs.getInt("Items");
					CartBean bean=new CartBean();
					bean.setProductName(name);
					bean.setPrice(price);
					bean.setQuantity(quantity);
					products.add(bean);
					LOG.info("Products in modal "+products);

				}
				return products;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	
	public List<CartBean> fetchSpecificCartProducts(List<String> productNames, String userEmail){	
		Connection con = null;
		PreparedStatement ps_sql = null;
		ResultSet rs = null;
		List<CartBean> products=new ArrayList<CartBean>();
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connct to DB. Contact admin.");
			} else {
				for (String productName : productNames) {
					ps_sql = con.prepareStatement("select * from Cart where ProductName=? and UserEmail=?");
					ps_sql.setString(1, productName);
					ps_sql.setString(2, userEmail);
					ps_sql.execute();
					rs = ps_sql.getResultSet();
					while(rs.next()) {
						String name=rs.getString("ProductName");
						int price=rs.getInt("ProductPrice");
						int quantity=rs.getInt("Items");
						CartBean bean=new CartBean();
						bean.setProductName(name);
						bean.setPrice(price);
						bean.setQuantity(quantity);
						products.add(bean);
						LOG.info("Products in modal "+products);
					}
	
				}
				return products;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String deleteCartProduct(String productName, String email) {
		Connection con = null;
		PreparedStatement ps_del = null;
		try {
			con = JDBCHelper.getConnection();
			if (con == null) {
				throw new RuntimeException("Cannot connect to DB. Contact admin");
			} else {
				ps_del = con.prepareStatement("delete from Cart where UserEmail=? and ProductName=?");
				ps_del.setString(1, email);
				ps_del.setString(2, productName);
				if(ps_del.executeUpdate()==1) {
					return Constants.SUCCESS;
				}
				else {
					return "Cannot delete the Product from Cart.";
				}
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			return "Oops something went wrong!" + e.getMessage();
		}
	} 
}