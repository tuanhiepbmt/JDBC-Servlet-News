package controller.client;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NewsModel;
import paging.PageRequest;
import paging.Pageble;
import service.INewService;
import utils.FormUtil;

@WebServlet("/list")
public class List extends HttpServlet { 
	
	@Inject
	private INewService iNewService;
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long categoryid=Long.parseLong(request.getParameter("categoryid"));
		NewsModel newModel=FormUtil.toModel(request, NewsModel.class);
		newModel.setTotalItem(iNewService.countItemByCategoryId(categoryid));
		newModel.setTotalPage((int)Math.ceil((double)newModel.getTotalItem()/newModel.getLimit()));
		Pageble pageable=new PageRequest(newModel.getPage(), newModel.getLimit(), newModel.getSortName(), newModel.getSortBy());
		request.setAttribute("list", iNewService.findByCategoryId(categoryid,pageable));
		request.setAttribute("model", newModel);
		request.getRequestDispatcher("/views/client/list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
