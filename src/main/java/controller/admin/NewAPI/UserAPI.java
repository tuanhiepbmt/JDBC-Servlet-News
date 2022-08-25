package controller.admin.NewAPI;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.NewsModel;
import model.UserModel;
import service.INewService;
import service.IUserService;
import utils.SessionUtil;

@WebServlet("/api-admin-user")	
public class UserAPI extends HttpServlet {

	private static final long serialVersionUID = 2680238117351004246L;
	@Inject
	private IUserService iUserService;

//	public NewAPI() {
//		iNewService = new NewService();
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		UserModel userModel=mapper(request, response, objectMapper);
		UserModel user=(UserModel) SessionUtil.getInstance().getValue(request, "USER");
		userModel.setModifiedBy(user.getFullName());
		iUserService.update(userModel.getId(), userModel);
		objectMapper.writeValue(response.getOutputStream(), "{}");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ngu");
		ObjectMapper objectMapper = new ObjectMapper();
		UserModel userModel=mapper(request, response, objectMapper);
		iUserService.delete(userModel.getIds());
		objectMapper.writeValue(response.getOutputStream(), "{}");
	}

	public UserModel mapper(HttpServletRequest request, HttpServletResponse response, ObjectMapper objectMapper) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("Aplication/json");
			UserModel userModel = objectMapper.readValue(request.getReader(), UserModel.class);
			return userModel;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
