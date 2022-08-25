package service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import dao.IUserDAO;
import model.NewsModel;
import model.UserModel;
import paging.Pageble;
import service.IUserService;

public class UserService implements IUserService {
	@Inject
	private IUserDAO iUserDAO;

	@Override
	public UserModel findByUserNameandPasswordAndStatus(String userName, String password, Integer status) {
		List<UserModel> user = iUserDAO.findByUserNameandPasswordAndStatus(userName, password, status);
		return user.isEmpty() ? null : user.get(0);
	}

	@Override
	public int countItem() {
		return iUserDAO.countItem();
	}

	@Override
	public List<UserModel> findAll(Pageble pageable) {
		return iUserDAO.findAll(pageable);
	}

	@Override
	public UserModel update(Long id, UserModel userModel) {
		Timestamp modifiedDate=new Timestamp(System.currentTimeMillis());
		UserModel oldUser = iUserDAO.findOne(id);
		userModel.setCreatedBy(oldUser.getCreatedBy());
		userModel.setCreatedDate(oldUser.getCreatedDate());
		userModel.setModifiedDate(modifiedDate);
		iUserDAO.update(id, userModel);
		return iUserDAO.findOne(id);
	}
	@Override
	public void delete(Long[] ids) {
		for (Long id : ids) {
			iUserDAO.delete(id);
		}
	}

	@Override
	public UserModel findOne(Long id) {
		return iUserDAO.findOne(id);
	}

}
