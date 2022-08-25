package dao.impl;

import java.util.List;

import dao.INewsDAO;
import mapper.NewMapper;
import model.NewsModel;
import paging.Pageble;

public class NewsDAO extends AbstractDAO<NewsModel> implements INewsDAO {
	
	@Override
	public List<NewsModel> findByCategoryId(Long categoryId,Pageble pageble) {
		StringBuilder sql = new StringBuilder("select * from news as n inner join category as c on c.id=n.categoryid ");
		sql.append("where n.categoryid =? ");
		if(pageble.getSortName()!=null)
		{
			sql.append("order by "+pageble.getSortName()+" "+pageble.getSortBy()+" limit ");
		}
		if(pageble.getOffset()!=null&& pageble.getLimit()!=null)
		{
			sql.append(pageble.getOffset()+","+pageble.getLimit());
		}
		return query(sql.toString(), new NewMapper(), categoryId);
	}

	@Override
	public Long save(NewsModel newsModel) {
		String sql = "Insert into news(title, content,thumbnail, categoryid,shortdescripsion,createddate,createdby) values (?,?,?,?,?,?,?)";
		return insert(sql, newsModel.getTitle(), newsModel.getContent(), newsModel.getThumbnail(),newsModel.getCategoryId(),
				newsModel.getShortdescripsion(),newsModel.getCreatedDate(),newsModel.getCreatedBy());
	}

	@Override
	public NewsModel findOne(Long id) {
		String sql = "select * from news as n inner join category as c on c.id=n.categoryid where n.id=?";
		List<NewsModel> news = query(sql, new NewMapper(), id);
		return news.isEmpty() ? null : news.get(0);
	}

	@Override
	public void update(Long id, NewsModel newsModel) {
		StringBuilder sql=new StringBuilder("UPDATE news SET title=?, thumbnail=? ,");
		sql.append("shortdescripsion=?, content=? , categoryid=?,");
		sql.append("modifieddate=?,modifiedby=? where id=?");
		update(sql.toString(), newsModel.getTitle(), newsModel.getThumbnail(), newsModel.getShortdescripsion(),
				newsModel.getContent(),newsModel.getCategoryId() ,newsModel.getModifiedDate(),newsModel.getModifiedBy(), id);
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM news WHERE id=?";
		update(sql,id);
	}

	@Override
	public List<NewsModel> findAll(Pageble pageble) {
		StringBuilder sql=new StringBuilder("select * from news ");
		if(pageble.getSortName()!=null)
		{
			sql.append("order by "+pageble.getSortName()+" "+pageble.getSortBy()+" limit ");
		}
		if(pageble.getOffset()!=null&& pageble.getLimit()!=null)
		{
			sql.append(pageble.getOffset()+","+pageble.getLimit());
		}
//		String sql="select * from news limit "+offset+","+limit;
		List<NewsModel>news=query(sql.toString(),new NewMapper());
		return news;
	}
	
	@Override
	public int countItem() {
		String sql="select count(*) from news";
		return count(sql);
	}

	@Override
	public int countItemByCategoryId(Long id) {
		String sql="select count(*) from news where categoryid=?";
		return count(sql,id);
	}


}
