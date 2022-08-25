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
import utils.SessionUtil;

/**
 * Servlet implementation class NewAPI
 */
@WebServlet("/api-admin-news")	
public class NewAPI extends HttpServlet {

	private static final long serialVersionUID = 2680238117351004246L;
	@Inject
	private INewService iNewService;

//	public NewAPI() {
//		iNewService = new NewService();
//	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		NewsModel newModel=mapper(request, response, objectMapper);
		UserModel userModel=(UserModel) SessionUtil.getInstance().getValue(request, "USER");
		if(userModel==null)
		{
			JSONObject oj=(JSONObject) new JSONObject();
			oj.put("message", "dang nhap di tk ngu hack cc");
			objectMapper.writeValue(response.getOutputStream(), oj);
			return;
		}
		newModel.setCreatedBy(userModel.getFullName());
		newModel = iNewService.save(newModel);
		objectMapper.writeValue(response.getOutputStream(), newModel);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		NewsModel newModel=mapper(request, response, objectMapper);
		UserModel userModel=(UserModel) SessionUtil.getInstance().getValue(request, "USER");
		newModel.setModifiedBy(userModel.getFullName());
		iNewService.update(newModel.getId(), newModel);
		objectMapper.writeValue(response.getOutputStream(), "{}");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ngu");
		ObjectMapper objectMapper = new ObjectMapper();
		NewsModel newModel=mapper(request, response, objectMapper);
		iNewService.delete(newModel.getIds());
		objectMapper.writeValue(response.getOutputStream(), "{}");
	}

	public NewsModel mapper(HttpServletRequest request, HttpServletResponse response, ObjectMapper objectMapper) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("Aplication/json");
			NewsModel newsModel = objectMapper.readValue(request.getReader(), NewsModel.class);
			return newsModel;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
