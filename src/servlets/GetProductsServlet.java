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


@SuppressWarnings("serial")
@WebServlet("/products")
public class GetProductsServlet extends HttpServlet{
	
	ProductBean product;
	ProductDAO productDao;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet Prods");
		try {
			productDao = new ProductDAO();
            List<ProductBean> products = productDao.getAllProducts("all");
            req.setAttribute("products", products); // Will be available as ${products} in JSP
            req.getRequestDispatcher("/admin_products.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	
}
