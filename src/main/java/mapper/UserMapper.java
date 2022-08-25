package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.RoleModel;
import model.UserModel;

public class UserMapper implements RowMapper<UserModel>{

	@Override
	public UserModel mapRow(ResultSet rs) {
		UserModel userModel=new UserModel();
		try {
			userModel.setUserName(rs.getString("username"));
			userModel.setPassword(rs.getString("password"));
			userModel.setStatus(rs.getInt("status"));
			userModel.setRoleId(rs.getInt("roleid"));
			userModel.setId(rs.getLong("id"));
			userModel.setFullName(rs.getString("fullname"));
			try {
				RoleModel role = new RoleModel();
				role.setCode(rs.getString("code"));
				role.setName(rs.getString("name"));
				userModel.setRole(role);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return userModel;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
