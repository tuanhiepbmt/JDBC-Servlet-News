package controller.admin;

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
import service.ICategoryService;
import service.INewService;
import utils.FormUtil;

@WebServlet(urlPatterns = {"/admin-news"})
public class News extends HttpServlet {
	@Inject
	private INewService iNewService;
	
	@Inject
	private ICategoryService iCategoryService;
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		System.out.println(type);
		NewsModel newModel=FormUtil.toModel(request, NewsModel.class);
		String view="";
		if(type.equals("list"))
		{
			Pageble pageRequest=new PageRequest(newModel.getPage(), newModel.getLimit(), newModel.getSortName(), newModel.getSortBy());
			newModel.setTotalItem(iNewService.countItem());
			newModel.setTotalPage((int) Math.ceil((double) newModel.getTotalItem() / newModel.getLimit()));
			request.setAttribute("list", iNewService.findAll(pageRequest));
			request.setAttribute("model", newModel);
			view="/views/admin/news/list.jsp";
		}
		else if(type.equals("edit"))
		{
			if(newModel.getId() != null)
			{
				request.setAttribute("model", iNewService.findOne(newModel.getId()));
			}
			view="/views/admin/news/add-edit-news.jsp";
			request.setAttribute("category", iCategoryService.findAll());
		}
		request.getRequestDispatcher(view).forward(request, response);
	}
}
