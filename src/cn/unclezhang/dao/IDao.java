package cn.unclezhang.dao;

import java.io.Serializable;
import java.util.List;

public interface IDao {

	/**
	 * 通过HQL和SQL查询
	 * 
	 * @param hql
	 *            sql 语句
	 * @param from_id
	 *            查询范围的开始
	 * @param len
	 *            查询范围的长度
	 * @return 返回一个泛型List
	 */
	public <T> List<T> findByHql(String hql, Object vals[], int from_id, int len) throws Exception;

	public <T> List<T> findBySql(String sql, Object vals[], int from_id, int len) throws Exception;

	public <T> List<T> findByHql(String hql, int from_id, int len) throws Exception;

	public <T> List<T> findBySql(String sql, int from_id, int len) throws Exception;

	public <T> List<T> findByHql(String hql, Object vals[]) throws Exception;

	public <T> List<T> findBySql(String sql, Object vals[]) throws Exception;

	public <T> List<T> findByHql(String hql) throws Exception;

	public <T> List<T> findBySql(String sql) throws Exception;

	/**
	 * 通过HQL和SQL查询单个
	 * 
	 * @param hql
	 *            sql 语句
	 * @param from_id
	 *            查询范围的开始
	 * @param len
	 *            查询范围的长度
	 * @return 返回一个泛型对象
	 */
	public <T> T findOneByHql(String hql, Object vals[]) throws Exception;

	public <T> T findOneBySql(String sql, Object vals[]) throws Exception;

	public <T> T findOneByHql(String hql) throws Exception;

	public <T> T findOneBySql(String sql) throws Exception;

	/**
	 * 通过HQL和SQL更新数据库
	 * 
	 * @param hql
	 *            sql 语句
	 * @param vals
	 *            问号的代替参数
	 */
	public void updateByHql(String hql, Object vals[]) throws Exception;

	public void updateBySql(String sql, Object vals[]) throws Exception;

	public void updateByHql(String hql) throws Exception;

	public void updateBySql(String sql) throws Exception;

	/**
	 * 更新多个字段
	 * 
	 * @param table
	 * @param fieldName
	 * @param newValue
	 */
	/*
	 * public void updateFields(Class<ITableMapping> claz, String primaryKeyVal,
	 * String fieldNames[], Object newValues[]) throws Exception; public void
	 * updateField(Class<ITableMapping> claz, String primaryKeyVal, String
	 * fieldName, Object newValue) throws Exception; public interface
	 * ITableMapping { String getTableName(); String getPrimaryKey(); }
	 */
	/**
	 * 保存实体
	 * 
	 * @param entity
	 * @return
	 */
	public Serializable saveEntity(Object entity) throws Exception;

	public void deleteEntity(Object entity) throws Exception;

	public void updateEntity(Object entity) throws Exception;

}
