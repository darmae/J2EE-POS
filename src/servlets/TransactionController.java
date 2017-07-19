package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductBean;
import dao.ProductDAO;

/**
 * Servlet implementation class TransactionController
 */
@WebServlet("/transactions")
public class TransactionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProductDAO prodDao;   
    ProductBean prod;
	
    public TransactionController() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("doGet TransactionController");
        
		try {
			prodDao = new ProductDAO();
            List<ProductBean> products = prodDao.getAllProducts(" ");
            req.setAttribute("products", products); // Will be available as ${products} in JSP
            req.getRequestDispatcher("/cashier_prods.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		prod = new ProductBean();
		String forward="";
        String action = request.getParameter("action");
        int qty = Integer.parseInt(request.getParameter("quantity"));
        prod.setId((Integer.parseInt(request.getParameter("prodID"))));
        if(action.equals("add")){
        	prod = prodDao.getProduct(prod);
        	
        }
	}

}
