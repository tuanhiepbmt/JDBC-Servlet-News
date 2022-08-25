package service.impl;

import java.util.List;

import javax.inject.Inject;

import dao.impl.CategoryDAO;
import model.CategoryModel;
import service.ICategoryService;


public class CategoryService implements ICategoryService{
	@Inject
	public CategoryDAO CategoryDAO;
//	public CategoryService() {
//		CategoryDAO = new CategoryDAO();
//	}
	
	public List<CategoryModel> findAll() {
		// TODO Auto-generated method stub
		return CategoryDAO.findAll();
	}
}
