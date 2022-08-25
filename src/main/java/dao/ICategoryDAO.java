package dao;

import java.util.List;

import model.CategoryModel;

public interface ICategoryDAO{
	List<CategoryModel> findAll();
}
