package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.CategoryModel;
import model.NewsModel;
import model.RoleModel;

public class NewMapper implements RowMapper<NewsModel>{

	@Override
	public NewsModel mapRow(ResultSet resultSet) {
		NewsModel news= new NewsModel();
		try {
			news.setId(resultSet.getLong("id"));
			news.setCategoryId(resultSet.getLong("categoryid"));
			news.setContent(resultSet.getString("content"));
			news.setTitle(resultSet.getString("title"));
			news.setShortdescripsion(resultSet.getString("shortdescripsion"));
			news.setThumbnail(resultSet.getString("thumbnail"));
			news.setCreatedDate(resultSet.getTimestamp("createddate"));
			news.setCreatedBy(resultSet.getString("createdby"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				news.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			if (resultSet.getString("modifiedby") != null) {
				news.setModifiedBy(resultSet.getString("modifiedby"));
			}
			try {
				CategoryModel category = new CategoryModel();
				category.setCode(resultSet.getString("code"));
				category.setName(resultSet.getString("name"));
				news.setCategory(category);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return news;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}
	}

}
