package dao;

import java.util.List;

import model.NewsModel;
import paging.Pageble;

public interface INewsDAO{
	NewsModel findOne(Long id);
	List<NewsModel> findByCategoryId(Long categoryId,Pageble pageble);
	Long save(NewsModel newsModel);
	void update(Long id, NewsModel NewsModel);
	void delete(Long id);
	List<NewsModel> findAll(Pageble pageble);
	int countItem();

	public int countItemByCategoryId(Long id);
}
