package controller.client;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INewService;

/**
 * Servlet implementation class Details
 */
@SuppressWarnings("serial")
@WebServlet("/details")
public class Details extends HttpServlet { 
	
	@Inject
	public INewService iNewService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newsId=request.getParameter("id");
		request.setAttribute("news", iNewService.findOne(Long.parseLong(newsId)));
		request.getRequestDispatcher("/views/client/details.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
