package dao;

import java.util.List;

import model.UserModel;
import paging.Pageble;

public interface IUserDAO{
	List<UserModel> findByUserNameandPasswordAndStatus(String userName,String password, Integer status);
	int countItem();
	List<UserModel> findAll(Pageble pageble);
	void update(Long id, UserModel user);
	UserModel findOne(Long id);
	void delete(Long id);
}
