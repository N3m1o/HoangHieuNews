package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.entity.NewsEntity;

public interface NewsService {
	List<NewsEntity> findAll();
	
	List<NewsEntity> findLast();
	
	List<NewsEntity> findById(Integer cateId);
	
	List<NewsEntity> findNewsForRight(Integer cateId);
	
	List<NewsEntity> findNewsForLeft(Integer cateId);
	
	NewsEntity findByIdNews(Integer newsId);
	
	List<NewsEntity> search(String titleNews);
	
	void save(NewsEntity newsEntity);
	
	void delete(NewsEntity newsEntity);
	
	NewsEntity editNews(int newsId, NewsEntity newsEntity);
	
	List<NewsEntity> findNewsByUserId(int userId);
	
	List<NewsEntity> findNewsRandom();
	
	List<NewsEntity> relatestPost(int cateId);
	
	List<NewsEntity> findNewsByUserIdStatusTrue(int userId);
	
	List<NewsEntity> findNewsByUserIdStatusFalse(int userId);
	
	List<NewsEntity> findNewsByUserIdPagination(int userId, int start, int pageNumber);

	List<NewsEntity> findNewsByUserIdPaginationStatusTrue(int userId, int start, int pageNumber);

	List<NewsEntity> findNewsByUserIdPaginationStatusFalse(int userId, int start, int pageNumber);

	List<NewsEntity> findAllNews();
	
	List<NewsEntity> findAllNewsStatusTrue();
	
	List<NewsEntity> findAllNewsStatusFalse();
	
	List<NewsEntity> findAllNewsPagination(int start, int pageNumber);
	
	List<NewsEntity> findAllNewsPaginationStatusTrue(int start, int pageNumber);

	List<NewsEntity> findAllNewsPaginationStatusFalse(int start, int pageNumber);
	
	List<NewsEntity> findAllNewsByUserIdSearchString(int userID, String searchString);
	
	List<NewsEntity> findAllNewsSearchString(String searchString);
}
