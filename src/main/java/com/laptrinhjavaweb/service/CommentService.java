package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.entity.CommentEntity;

public interface CommentService {
	
	void save(CommentEntity commentEntity);
	
	void delete(CommentEntity commentEntity);
	
	List<CommentEntity> findCommentByNewsId(Integer newsId);
}
