package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptrinhjavaweb.entity.CateEntity;

public interface CategoryRepository extends JpaRepository<CateEntity, Integer>{
	@Query(value = "select * from category", nativeQuery = true)
	List<CateEntity> findAllBy();
	
	@Query(value = "SELECT DISTINCT * FROM category c JOIN news n ON n.cate_id = c.cate_id WHERE n.news_id = ?1", nativeQuery = true)
	CateEntity findCateName(int newsId);
	
	@Query(value = "SELECT * FROM category c WHERE c.cate_name = ?1", nativeQuery = true)
	CateEntity findCateByName(String cateName);
	
	@Query(value = "SELECT * FROM category c WHERE c.cate_id= ?1", nativeQuery = true)
	CateEntity findCateById(int cateId);
}
