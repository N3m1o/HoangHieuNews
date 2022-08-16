package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.entity.CateEntity;

public interface CategoryService {
	List<CateEntity> findAll();
	
	CateEntity findCateName(int newsId);
	
	CateEntity findCateByName(String cateName);
	
	CateEntity findCateById(int cateId);
}
