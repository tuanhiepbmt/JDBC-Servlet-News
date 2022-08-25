package dao;

import java.util.List;

import mapper.RowMapper;


public interface GennericDAO<T> {
	@SuppressWarnings("hiding")
	public <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameter);
	public Long insert(String sql, Object... parameter);
	public void update(String sql, Object... parameter);
	public int count(String sql, Object... parameter);
}
