package com.spaneos.shoppingcart;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOG=Logger.getLogger(AdminServlet.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		LOG.info("Admin servlet has been instantiated.");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BasicConfigurator.configure();
		// Getting URI
		String uri=request.getRequestURI();
		LOG.info("URI-->"+uri);

		// Create Request Dispatcher & assign null
		RequestDispatcher rd=null;
		//Create Modal 
		Model model= new Model();

		if(uri.contains("/adminLoginView.ado")) {
			rd=request.getRequestDispatcher("adminLoginView.jsp");
			rd.forward(request, response);
		}

		if(uri.contains("/adminHome.ado")) {
			rd=request.getRequestDispatcher("adminHome.jsp");
			rd.forward(request, response);
		}

		if(uri.contains("/login.ado")) {
			AdminLoginBean bean=(AdminLoginBean) request.getAttribute("adminLogin");
			LOG.info("AdminLoginBean "+bean);

			HttpSession session = request.getSession(true);
			session.setAttribute("admin", bean.getAdminUserName());

			String result=model.adminLogin(bean);
			LOG.info("admin login"+result);
			if(result.equals("SUCCESS")) {
				// Registration succeeded
				// forward to Menu.jsp
				request.setAttribute("message", "You have loggedin successfully!!! ");
				List<String> categories=model.getCategories();
				LOG.info("list"+categories);
				request.setAttribute("category",categories);
				rd=request.getRequestDispatcher("adminHome.jsp");
				rd.forward(request, response);
			}
			else {
				// Login failed
				request.setAttribute("errorMsg", result);
				rd=request.getRequestDispatcher("adminLoginView.jsp");
				rd.forward(request, response);
			}
		}

		if(uri.contains("categorySuccess.ado")) {
			HttpSession session = request.getSession(false);
			if(session==null || session.getAttribute("admin")==null) {
				request.setAttribute("errorMsg", "First login, then add Contact!");
				rd = request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			}
			else {
				CategoryBean bean=(CategoryBean) request.getAttribute("category");
				LOG.info("Category "+bean);
				String result=model.addCategory(bean);
				if(result.equals(Constants.SUCCESS)) {
					// Registration succeeded
					// forward to Menu.jsp
					request.setAttribute("message", "Category has been added successfully!!!");
					rd=request.getRequestDispatcher("adminHome.jsp");
					rd.forward(request, response);
				}
				else {
					// Login failed
					request.setAttribute("errorMsg", result);
					rd=request.getRequestDispatcher("home.html");
					rd.forward(request, response);
				}
			}
		} 
		
		if(uri.contains("/listOfUsers.ado")) {
			HttpSession session = request.getSession(false);
			if(session==null || session.getAttribute("admin")==null) {
				request.setAttribute("errorMsg", "First login, then add Contact!");
				rd = request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			}
			else {
		 		List<UserBean> users=model.fetchusers();
				if(users!=null) {
					request.setAttribute("userDetails", users);
					rd=request.getRequestDispatcher("users.jsp");
					rd.forward(request, response);
				}
				else {
					//request.setAttribute("errorMsg", );
					rd=request.getRequestDispatcher("home.html");
					rd.forward(request, response);
		 		}
			} 
			 
		} 
	}
}