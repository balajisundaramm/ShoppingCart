package com.spaneos.shoppingcart;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

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

		List<CategoryBean> categories=model.getCategories();
		LOG.info("Category bean "+categories);
		request.setAttribute("category",categories);

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
				rd=request.getRequestDispatcher("userHome.jsp");
				rd.forward(request, response);
			}
		}

		if(uri.contains("/home.udo")) {
			HttpSession session = request.getSession(false);
			if(session==null || session.getAttribute("user")==null) {
				request.setAttribute("errorMsg", "First login, then add Contact!");
				rd = request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			}
			else {
				rd=request.getRequestDispatcher("userHome.jsp");
				rd.forward(request, response);
			}
		}

		if(uri.contains("/listOfProducts.udo")) {
			HttpSession session = request.getSession(false);
			if(session==null || session.getAttribute("user")==null) {
				request.setAttribute("errorMsg", "First login, then add Contact!");
				rd = request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			}
			else {
				List<ProductBean> products=model.fetchAllProducts();
				if(products!=null) {
					request.setAttribute("allProducts", products);
					rd=request.getRequestDispatcher("userProducts.jsp");
					rd.forward(request, response);
				}
				else {
					//request.setAttribute("errorMsg", );
					rd=request.getRequestDispatcher("home.html");
					rd.forward(request, response);
				}
			}
		}

		if(uri.contains("/category.udo")) {
			HttpSession session = request.getSession(false);
			if(session==null || session.getAttribute("user")==null) {
				request.setAttribute("errorMsg", "First login, then add Contact!");
				rd = request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			} 
			else {
				String category=request.getParameter("categoryName");
				request.setAttribute("categoryName", category);
				List<ProductBean> products=model.fetchProducts(category);
				request.setAttribute("listOfProducts", products);
				rd=request.getRequestDispatcher("userCategories.jsp");
				rd.forward(request, response);

			}
		}

		if(uri.contains("/addCat.udo")) {
			HttpSession session = request.getSession(false);
			if(session==null || session.getAttribute("user")==null) {
				request.setAttribute("errorMsg", "First login, then add Contact!");
				rd = request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			} 
			else {
				rd=request.getRequestDispatcher("addCartInt.jsp");
				rd.forward(request, response);
			}
		}

		if(uri.contains("/addToCartDB.udo")) {
			HttpSession session = request.getSession(false);
			if(session==null || session.getAttribute("user")==null) {
				request.setAttribute("errorMsg", "First login, then add Contact!");
				rd = request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			} 
			else {
				String userEmail=(String)session.getAttribute("user");
				LOG.info("User Email "+userEmail);
				Enumeration<String> names=request.getParameterNames();
				List<String> params=new ArrayList<String>();
				PurchaseBean bean1=null, bean2=null, bean3=null;
				while (names.hasMoreElements()) {
					String param = names.nextElement();
					params.add(param);
					LOG.info("Param "+param);
				}
				for (String string : params) {
					LOG.info("ALl parameters "+string);
				}
				LOG.info("Length is "+params.size());

				if(params.size()>=2) {
					String name1=request.getParameter(params.get(0));
					int number1=Integer.parseInt(request.getParameter(params.get(1)));
					bean1=new PurchaseBean(name1, number1);

				}
				if(params.size()>=4) {
					String name2=request.getParameter(params.get(2));
					int number2=Integer.parseInt(request.getParameter(params.get(3)));
					bean2=new PurchaseBean(name2, number2);

				}
				if(params.size()>=6) {
					String name3=request.getParameter(params.get(4));
					int number3=Integer.parseInt(request.getParameter(params.get(5)));
					bean3=new PurchaseBean(name3, number3);

				}
				List<PurchaseBean> beans=new ArrayList<PurchaseBean>();
				if(bean1!=null) {
					beans.add(bean1);

				}
				if(bean2!=null) {
					beans.add(bean2);

				}
				if(bean3!=null) {
					beans.add(bean3);

				}
				String result=model.addCart(beans, userEmail);
				if(result.equals(Constants.SUCCESS)) {
					request.setAttribute("message", "Registrtation Successfull!!! ");
					rd=request.getRequestDispatcher("viewCart.jsp");
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
	}

}
