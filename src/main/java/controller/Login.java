package controller;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;
import service.IUserService;
import utils.SessionUtil;

@WebServlet("/dang-nhap")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private	ResourceBundle rb= ResourceBundle.getBundle("message");
	@Inject
	public IUserService iUserservice;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message=request.getParameter("message");
		if(message!=null)
			request.setAttribute("message",rb.getString(message));
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password= request.getParameter("password");
		UserModel user=iUserservice.findByUserNameandPasswordAndStatus(username, password, 1);
		if(user!=null)
		{
			SessionUtil.getInstance().putValue(request, "USER", user);
			if(user.getRole().getCode().equals("ADMIN"))
			{
				response.sendRedirect(request.getContextPath()+"/admin-home");
				return;
			}
			else
			{
				response.sendRedirect(request.getContextPath()+"/home");
				return;
			}
				
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/dang-nhap?message=username_password_invalid");
			return;
		}
	}

}
