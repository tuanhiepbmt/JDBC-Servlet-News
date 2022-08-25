package service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import dao.impl.NewsDAO;
import model.NewsModel;
import paging.Pageble;
import service.INewService;

public class NewService implements INewService {
	@Inject
	public NewsDAO newsDAO;
//
//	public NewService() {
//		newsDAO = new NewsDAO();
//	}

	@Override
	public List<NewsModel> findByCategoryId(Long categoryId,Pageble pageble) {
		return newsDAO.findByCategoryId(categoryId,pageble);
	}

	@Override
	public NewsModel save(NewsModel newsModel) {
		Timestamp creteddate=new Timestamp(System.currentTimeMillis());
		newsModel.setCreatedDate(creteddate);
		return newsDAO.findOne(newsDAO.save(newsModel));
	}

	@Override
	public NewsModel findOne(Long id) {
		return newsDAO.findOne(id);
	}

	@Override
	public NewsModel update(Long id, NewsModel newsModel) {
		Timestamp modifiedDate=new Timestamp(System.currentTimeMillis());
		NewsModel oldNew = newsDAO.findOne(id);
		newsModel.setCreatedBy(oldNew.getCreatedBy());
		newsModel.setCreatedDate(oldNew.getCreatedDate());
		newsModel.setModifiedDate(modifiedDate);
		newsDAO.update(id, newsModel);
		return newsDAO.findOne(id);
	}

	@Override
	public void delete(Long[] ids) {
		for (Long id : ids) {
			newsDAO.delete(id);
		}
	}

	@Override
	public List<NewsModel> findAll(Pageble pageble) {
		return newsDAO.findAll(pageble);
	}

	@Override
	public int countItem() {
		return newsDAO.countItem();
	}

	@Override
	public int countItemByCategoryId(Long id) {
		return newsDAO.countItemByCategoryId(id);
	}

}
