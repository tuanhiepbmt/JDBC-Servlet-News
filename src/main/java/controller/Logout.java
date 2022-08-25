package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.SessionUtil;

/**
 * Servlet implementation class Logout
 */
@SuppressWarnings("serial")
@WebServlet("/dang-xuat")
public class Logout extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionUtil.getInstance().removeValue(request, "USER");
		response.sendRedirect(request.getContextPath()+"/dang-nhap");
		return;
	}

}
