package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptrinhjavaweb.entity.CommentEntity;

public interface CommentRepository extends JpaRepository<CommentEntity, Integer>{
	
	@Query(value = "SELECT * FROM dbo.comment c WHERE c.news_id = ?1 ORDER BY c.comment_date DESC", nativeQuery = true)
	List<CommentEntity> findCommentByNewsId(Integer newsId);
}
