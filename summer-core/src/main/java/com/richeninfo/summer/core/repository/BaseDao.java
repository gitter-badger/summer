package com.richeninfo.summer.core.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


/**
 * 针对spring data jpa所提供的接口{@link JpaRepository}再次扩展，支持{@link PropertyFilter}查询和其他方式查询
 * 后续添加Summer平台自己的方法
 * 
 * @author Albert
 *
 * @param <T> ORM对象
 * @param <ID> 主键Id类型
 */
public interface BaseDao<T, ID extends Serializable> extends JpaRepository<T, ID>, JpaSpecificationExecutor<T>,SummerCustomRepository
{

}
