package com.laptrinhjavaweb.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.CateEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	public List<CateEntity> findAll() {
		try {
			return categoryRepository.findAllBy();
		} catch (Exception e) {
			return null;
		}
	}

	public CateEntity findCateName(int newsId) {
		try {
			return categoryRepository.findCateName(newsId);
		} catch (Exception e) {
			return null;
		}
	}

	public CateEntity findCateByName(String cateName) {
		// TODO Auto-generated method stub
		try {
			return categoryRepository.findCateByName(cateName);
		} catch (Exception e) {
			return null;
		}
	}

	public CateEntity findCateById(int cateId) {
		// TODO Auto-generated method stub
		try {
			return categoryRepository.findCateById(cateId);
		} catch (Exception e) {
			return null;
		}
	}
	
}
