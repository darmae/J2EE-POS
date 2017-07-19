package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.UserDatabase;

import beans.ProductBean;
import beans.UserBean;
import dao.ProductDAO;
import dao.UserDAO;


@SuppressWarnings("serial")
@WebServlet("/users")
public class UserController extends HttpServlet{
	
	UserBean user;
	UserDAO userDao;
	private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/users.jsp";
    private static String LIST_USER = "/users.jsp";
	
	public UserController() {
        super();
        userDao = new UserDAO();
    }

//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("doGet Prods");
//		try {
//			productDao = new ProductDAO();
//            List<ProductBean> products = productDao.getAllProducts();
//            req.setAttribute("products", products); // Will be available as ${products} in JSP
//            req.getRequestDispatcher("/admin_products.jsp").forward(req, resp);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//	}



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("In doGet UserController");
    	String forward="";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("listUser")){
        	System.out.println("In doGet UserController listUser");
            forward = LIST_USER;
            request.setAttribute("users", userDao.getAllUsers());
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("In doPost UserController");
        UserBean user = new UserBean();
        user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setFullname(request.getParameter("fullname"));
		user.setUsertype(Integer.parseInt(request.getParameter("userType")));
		System.out.println("userType: " + user.getUsertype());
		
		user = userDao.addUserAccount(user);
		
		if (user.isValid){			        
			RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
            request.setAttribute("users", userDao.getAllUsers());
            view.forward(request, response);
		}
		        
		else{
			System.out.println("INVALID!");
		}			
        
    }
	
}
