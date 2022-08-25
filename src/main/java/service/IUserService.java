package service;

import java.util.List;

import model.UserModel;
import paging.Pageble;

public interface IUserService {
	public UserModel findByUserNameandPasswordAndStatus(String userName, String password, Integer status);
	public int countItem();
	public List<UserModel> findAll(Pageble pageable);
	UserModel update(Long id, UserModel userModel);
	void delete(Long[] ids);
	public UserModel findOne(Long id);
}
