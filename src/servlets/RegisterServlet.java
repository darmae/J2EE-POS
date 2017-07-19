package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserBean;
import dao.UserDAO;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{


	UserBean user = new UserBean();
	UserDAO userDao = new UserDAO();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In register servlet do post");
		try{
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setFullname(request.getParameter("fullname"));
			user.setUsertype(Integer.parseInt(request.getParameter("userType")));
//			System.out.println();
			System.out.println("select box: " + request.getParameter("userType") + " " + user.getUsername() + " " + user.getFullname());

			user = userDao.addUserAccount(user);
			HttpSession session = null;
			
			if (user.isValid){			        
				System.out.println("VALID!");
			}
			        
			else{
				System.out.println("INVALID!");
			}			 
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
