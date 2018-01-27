package com.spaneos.shoppingcart;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import com.spaneos.shoppingcart.Model;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOG=Logger.getLogger(UserServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		LOG.info("User servlet has been initiated.");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		process(request,response);
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
		Model model= new Model();
		String con=new Model().register();
		LOG.info(con);

		// Create Request Dispatcher & assign null
		RequestDispatcher rd=null;
		// Create Model 
		//Model model= new Model();

		if(uri.contains("/userLoginView.udo")) {
			rd=request.getRequestDispatcher("userLoginView.jsp");
			rd.forward(request, response);
		}
		
		if(uri.contains("/register.udo")) {
			UserRegistrationBean bean=(UserRegistrationBean) request.getAttribute("user");
			LOG.info("Registeration bean "+bean);
			String result=model.userRegisteration(bean);
			LOG.info(result);
			if(result.equals(Constants.SUCCESS)) {
				request.setAttribute("message", "Registrtation Successfull!!! ");
				rd=request.getRequestDispatcher("userLoginView.jsp");
				rd.forward(request, response);
			}
			else {
				// Login failed
				request.setAttribute("errorMsg", result);
				rd=request.getRequestDispatcher("home.html");
				rd.forward(request, response);
			}
			
		}
		
		if(uri.contains("/login.udo")) {
			UserLoginBean bean=(UserLoginBean) request.getAttribute("userLogin");
			LOG.info("Login credentials, "+bean);
			
			HttpSession session = request.getSession(true);
			session.setAttribute("user", bean.getUserId());
			
			String result=model.userLogin(bean);
			if(result.equals(Constants.SUCCESS)) {
				request.setAttribute("message", "Login successfull!!!");
				rd=request.getRequestDispatcher("userHome.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("errorMsg", result);
				rd=request.getRequestDispatcher("home.html");
				rd.forward(request, response);
			}
		}
	}

}
