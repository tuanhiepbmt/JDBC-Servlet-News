package dao.impl;


import java.util.List;

import dao.IUserDAO;
import mapper.NewMapper;
import mapper.UserMapper;
import model.NewsModel;
import model.UserModel;
import paging.Pageble;

public class UserDAO extends AbstractDAO<UserDAO> implements IUserDAO{

	@Override
	public List<UserModel> findByUserNameandPasswordAndStatus(String userName, String password, Integer status) {
		StringBuilder sql=new StringBuilder("select * from user");
		sql.append(" as u inner join role as r on r.id=u.roleid");
		sql.append(" where userName=? and password=? and status=?");
		return query(sql.toString(),new UserMapper(),userName,password,status);
	}

	@Override
	public int countItem() {
		String sql="select count(*) from user";
		return count(sql);
	}
	
	@Override
	public List<UserModel> findAll(Pageble pageble) {
		StringBuilder sql=new StringBuilder("select * from user as u inner join role as r on r.id=u.roleid ");
		if(pageble.getSortName()!=null)
		{
			sql.append("order by "+pageble.getSortName()+" "+pageble.getSortBy()+" limit ");
		}
		if(pageble.getOffset()!=null&& pageble.getLimit()!=null)
		{
			sql.append(pageble.getOffset()+","+pageble.getLimit());
		}
//		String sql="select * from news limit "+offset+","+limit;
		List<UserModel>users=query(sql.toString(),new UserMapper());
		return users;
	}

	@Override
	public void update(Long id, UserModel user) {
			StringBuilder sql=new StringBuilder("UPDATE user SET username=?, ");
			sql.append("fullname=?, status=? , roleid=?,");
			sql.append("modifieddate=?,modifiedby=? where id=?");
			update(sql.toString(), user.getUserName(), user.getFullName(),
					user.getStatus(),user.getRoleId() ,user.getModifiedDate(),user.getModifiedBy(), id);
		
		
	}

	@Override
	public UserModel findOne(Long id) {
		String sql="select * from user where id=?";
		return query(sql, new UserMapper(), id).get(0);
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM user WHERE id=?";
		update(sql,id);
	}

}
