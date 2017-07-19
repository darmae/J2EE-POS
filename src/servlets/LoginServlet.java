package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserBean;
import dao.ProductDAO;
import dao.UserDAO;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	UserBean userBean = new UserBean();
	UserDAO userDao = new UserDAO();
	private static String LIST_PRODUCTS_CASHIER = "/cashier_prods.jsp";
	private static String LIST_PRODUCTS_ADMIN = "/admin_products.jsp";
	private static String LOGIN_PAGE = "/index.jsp";
	ProductDAO prodDao = new ProductDAO();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward=LOGIN_PAGE;
		try{
			userBean.setUsername(request.getParameter("username"));
			userBean.setPassword(request.getParameter("password"));

			userBean = userDao.getUserDetails(userBean);
			HttpSession session = null;
			
			if (userBean.isValid){
				String path = (userBean.getUsertype()==2) ? "/transactions" : "/products";
				session = request.getSession(true);	    
				session.setAttribute("currentSessionUser", userBean); 
				response.sendRedirect(request.getContextPath()+path); //logged-in page  
//				forward = (userBean.getUsertype()==2) ? LIST_PRODUCTS_CASHIER : LIST_PRODUCTS_ADMIN;
//				forward = (userBean.getUsertype()==2) ? "/transactions" : "/products";
//				String prodGet = (userBean.getUsertype()==1) ? "all" : " ";
//	            request.setAttribute("products", prodDao.getAllProducts(prodGet));
				
				System.out.println("VALID!");
			}
			        
			else{
                request.setAttribute("errorMessage", "Invalid username or password");
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
//                forward = LOGIN_PAGE;
                rd.forward(request, response);  
				System.out.println("INVALID!");
//				RequestDispatcher view = request.getRequestDispatcher(forward);
//		        view.forward(request, response);
			}	
//			RequestDispatcher view = request.getRequestDispatcher(forward);
//	        view.forward(request, response);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
