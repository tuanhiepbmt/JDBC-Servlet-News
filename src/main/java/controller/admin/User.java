package controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;
import paging.PageRequest;
import service.IUserService;
import utils.FormUtil;

@WebServlet("/admin-user")
public class User extends HttpServlet {
	
	@Inject
	private IUserService iUserService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModel userModel=FormUtil.toModel(request, UserModel.class);
		String type=request.getParameter("type");
		String view="";
		if(type.equals("list"))
		{
			PageRequest page=new PageRequest(userModel.getPage(), userModel.getLimit(), userModel.getSortName(), userModel.getSortBy());
			userModel.setTotalItem(iUserService.countItem());
			userModel.setTotalPage((int) Math.ceil((double) userModel.getTotalItem() / userModel.getLimit()));
			request.setAttribute("users", iUserService.findAll(page));
			view="/views/admin/news/list.jsp";
			request.setAttribute("model", userModel);
		}
		else if(type.equals("edit"))
		{
			UserModel user=iUserService.findOne(userModel.getId());
			System.out.println(user.getStatus());
			request.setAttribute("userModel", user);
			view="/views/admin/news/add-edit-user.jsp";
		}
		request.getRequestDispatcher(view).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
