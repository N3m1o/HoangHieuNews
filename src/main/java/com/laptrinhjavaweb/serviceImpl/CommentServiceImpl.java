package com.laptrinhjavaweb.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.repository.CommentRepository;
import com.laptrinhjavaweb.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentRepository commentRepository;
	
	public void save(CommentEntity commentEntity) {
		commentRepository.save(commentEntity);
	}

	public void delete(CommentEntity commentEntity) {
		commentRepository.delete(commentEntity);
	}

	public List<CommentEntity> findCommentByNewsId(Integer newsId) {
		try {
			return commentRepository.findCommentByNewsId(newsId);
		} catch (Exception e) {
			return null;
		}
	}

}
