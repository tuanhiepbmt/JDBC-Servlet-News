package controller.client;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INewService;

@WebServlet("/home")
public class Home extends HttpServlet { 
 
	@Inject
	private INewService iNewService;
 
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setAttribute("tt", iNewService.findOne(84L));
		request.setAttribute("tg", iNewService.findOne(88L));
		request.setAttribute("ct", iNewService.findOne(93L));
		request.setAttribute("ts", iNewService.findOne(98L));
		request.setAttribute("gn", iNewService.findOne(103L));
		request.getRequestDispatcher("/views/client/home.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
