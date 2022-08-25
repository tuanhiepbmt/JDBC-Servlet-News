package dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import dao.GennericDAO;
import mapper.RowMapper;

public class AbstractDAO<T> implements GennericDAO<T> {
	
	private ResourceBundle rb=ResourceBundle.getBundle("db");
	
	public Connection getConnect() {
		try {
			Class.forName(rb.getString("driverName"));
			String url = rb.getString("url");
			String user = rb.getString("user");
			String password = rb.getString("password");
//			Class.forName("com.mysql.jdbc.Driver");
//			String url = "jdbc:mysql://localhost:3306/lingu";
//			String user = "root";
//			String password = "vnt.lg123";
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("hiding")
	@Override
	public <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameter) {
		List<T> result = new ArrayList<>();
		Connection connect = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		try {
			connect = getConnect();
			pstatement = connect.prepareStatement(sql);
			setParameter(pstatement, parameter);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				result.add(rowMapper.mapRow(rs));
			}
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (connect != null)
					connect.close();
				if (pstatement != null)
					pstatement.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	private void setParameter(PreparedStatement pstatement, Object... parameter) {
		try {
			for (int i = 0; i < parameter.length; i++) {
				Object p = parameter[i];
				int index = i + 1;
				if (p instanceof Long) {
					pstatement.setLong(index, (long) p);
				} else if (p instanceof String)
					pstatement.setString(index, (String) p);
				else if(p instanceof Integer)
					pstatement.setInt(index, (Integer) p);
				else if(p instanceof Timestamp)
					pstatement.setTimestamp(index, (Timestamp) p);
				else if(p == null)
					pstatement.setNull(index, Types.NULL);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Long insert(String sql, Object... parameter) {
		Connection connect = null;
		PreparedStatement pstatement = null;
		connect = getConnect();
		ResultSet rs = null;
		Long id = null;
		try {
			connect.setAutoCommit(false);
			pstatement = connect.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			setParameter(pstatement, parameter);
			pstatement.executeUpdate();
			connect.commit();
//			Long id = pstatement.getGeneratedKeys().getLong(1);
			rs = pstatement.getGeneratedKeys();
			if (rs.next())
				id = rs.getLong(1);
			return id;
		} catch (SQLException e) {
			if (connect != null) {
				try {
					connect.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
		} finally {
			try {
				if (connect != null)
					connect.close();
				if (pstatement != null)
					pstatement.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public void update(String sql, Object... parameter) {
		Connection connect = null;
		PreparedStatement pstatement = null;
		connect = getConnect();
		try {
			connect.setAutoCommit(false);
			pstatement = connect.prepareStatement(sql);
			setParameter(pstatement, parameter);
			pstatement.executeUpdate();
			connect.commit();
		} catch (SQLException e) {
			if (connect != null)
				try {
					connect.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			e.printStackTrace();
		} finally {
			try {
				if (connect != null)
					connect.close();
				if (pstatement != null)
					pstatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public int count(String sql, Object... parameter) {
		Connection connect = null;
		PreparedStatement pstatement = null;
		ResultSet rs = null;
		try {
			int count=0;
			connect = getConnect();
			pstatement = connect.prepareStatement(sql);
			setParameter(pstatement, parameter);
			rs = pstatement.executeQuery();
			while (rs.next()) {
				count=rs.getInt(1);
			}
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (connect != null)
					connect.close();
				if (pstatement != null)
					pstatement.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

}
