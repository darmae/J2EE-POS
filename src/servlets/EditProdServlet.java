package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductBean;
import dao.ProductDAO;

@WebServlet("/editProd")
public class EditProdServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	ProductDAO prodDao = new ProductDAO();
	ProductBean product = new ProductBean();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("In doPost EditProd");
		try{
			product.setId(Integer.parseInt(req.getParameter("prodID")));
			product.setName(req.getParameter("prodName"));
			product.setPrice(Double.parseDouble(req.getParameter("prodPrice")));
			product.setQuantity(Integer.parseInt(req.getParameter("quantity")));

			Boolean res = prodDao.editProduct(product);
			
			if (res){			        
				resp.sendRedirect(req.getContextPath()+"/products"); //logged-in page   				
				System.out.println("VALID!");
			}
			        
			else{
				req.setAttribute("errorMessage", "Invalid input");
//                RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
//                rd.forward(req, resp);  
				System.out.println("INVALID PROD INPUTS!");
			}			 
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	
	
}
