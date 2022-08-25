package service;

import java.util.List;

import model.NewsModel;
import paging.Pageble;

public interface INewService {
	public NewsModel findOne(Long id);
	List<NewsModel> findByCategoryId(Long categoryId,Pageble pageble);
	NewsModel save(NewsModel newsModel);
	NewsModel update(Long id, NewsModel newsModel);
	void delete(Long[] ids);
	List<NewsModel> findAll(Pageble pageble);
	int countItem();
	int countItemByCategoryId(Long id);
}
