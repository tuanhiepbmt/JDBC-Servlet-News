package dao.impl;

import java.util.List;

import dao.ICategoryDAO;
import mapper.CategoryMapper;
import model.CategoryModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO{

	public List<CategoryModel> findAll() {
		String sql = "SELECT *FROM category";
		return query(sql, new CategoryMapper());
	}
}
