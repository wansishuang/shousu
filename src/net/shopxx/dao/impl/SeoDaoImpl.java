/*
 * Copyright 2005-2013 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package net.shopxx.dao.impl;

import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

import net.shopxx.dao.SeoDao;
import net.shopxx.entity.Seo;
import net.shopxx.entity.Seo.Type;

import org.springframework.stereotype.Repository;

/**
 * Dao - SEO设置
 * 
 * @author SHOP++ Team
 * @version 3.0
 */
@Repository("seoDaoImpl")
public class SeoDaoImpl extends BaseDaoImpl<Seo, Long> implements SeoDao {

	public Seo find(Type type) {
		if (type == null) {
			return null;
		}
		try {
			String jpql = "select seo from Seo seo where seo.type = :type";
			//AUTO：刷新在查询语句执行前（除了find()和getreference()查询）或事务提交时才发生，适用于在大量更新数据的过程中没有任何查询语句（除了find()和getreference()查询）时执行。
			//COMMIT：刷新只有在事务提交时才发生，适用于在大量更新数据的过程中存在查询语句（除了find()和getreference()查询）时执行。
			//这两种模式的区别体现在数据库底层SQL的执行上，即JDBC驱动跟数据库交互的次数。COMMIT模式使更新只在一次网络交互中完成，而AUTO模式可能需要多次交互，它触发了多少次Flush就产生了多少次网络交互。
			return entityManager.createQuery(jpql, Seo.class).setFlushMode(FlushModeType.COMMIT).setParameter("type", type).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}