package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductBean;
import dao.ProductDAO;
import dao.UserDAO;

@WebServlet("/productCtrl")
public class ProductController extends HttpServlet {
	
//	private static String INSERT_OR_EDIT = "/admin_products.jsp";
//    private static String LIST_USER = "/listUser.jsp";
	private static String LIST_PRODUCTS_ADMIN = "/admin_products.jsp"; //products
	private static String LIST_PRODUCTS_CASHIER = "/cashier_prods.jsp";
	ProductDAO prodDao;
	ProductBean product = new ProductBean();
	private static final long serialVersionUID = 1L;
	
	public ProductController() {
        super();
        prodDao = new ProductDAO();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In doGet ProductController");
    	String forward="";
        String action = request.getParameter("action");
        int userType = (Integer.parseInt(request.getParameter("userType")));
        int productId = (Integer.parseInt(request.getParameter("prodID")));

        if (action.equalsIgnoreCase("listProds")){
        	System.out.println("In doGet ProductController listUser");
        	forward = (userType==2) ? LIST_PRODUCTS_CASHIER : LIST_PRODUCTS_ADMIN;
//            request.setAttribute("users", userDao.getAllUsers());
        } 
        else if(action.equalsIgnoreCase("delete")){
        	System.out.println("In doGet delete");
        	prodDao.deleteProduct(productId);
        	forward = LIST_PRODUCTS_ADMIN;
        }
    	else {
    		System.out.println("in doGet else");
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward="";
        String action = request.getParameter("action");
        int userType = (Integer.parseInt(request.getParameter("userType")));
        int productId = (Integer.parseInt(request.getParameter("prodID")));
        System.out.println("PRODID: " + productId);

        if (action.equalsIgnoreCase("delete")){
        	System.out.println("in doPost delete");
        	prodDao.deleteProduct(productId);
            forward = LIST_PRODUCTS_ADMIN;
//        	forward = "/products";
            request.setAttribute("products", prodDao.getAllProducts("all"));   
        } 
        else if (action.equalsIgnoreCase("edit")){
//            forward = INSERT_OR_EDIT;
//            int userId = Integer.parseInt(request.getParameter("userId"));
//            User user = dao.getUserById(userId);
//            request.setAttribute("user", user);
        	System.out.println("in Edit action");
        } else if (action.equalsIgnoreCase("listProds")){
//            forward = LIST_USER;
//            request.setAttribute("users", dao.getAllUsers());
        	System.out.println("in list products action");
        } else {
//            forward = INSERT_OR_EDIT;
        	System.out.println("add/edit product");
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}
		
}
