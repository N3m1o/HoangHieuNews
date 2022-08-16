package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptrinhjavaweb.entity.NewsEntity;

public interface NewsRepository extends JpaRepository<NewsEntity, Integer>{
	@Query(value = "select * from news order by date_submitted desc", nativeQuery = true)
	List<NewsEntity> findAllBy();
	
	@Query(value = "select top 6 * from news n where n.status=1 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findLastNews();
	
	@Query(value = "select * from news n where n.cate_id = ?1 and n.status=1 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findByCateID(Integer cateId);
	
	@Query(value = "select top 1 * from news n where n.cate_id = ?1 and n.status=1 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findNewsForLeft(Integer cateId);
	
	@Query(value = "select top 4 * from news n where n.cate_id = ?1 and n.status=1 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findNewsForRight(Integer cateId);
	
	@Query(value = "select * from news n where n.news_id = ?1", nativeQuery = true)
	NewsEntity findOneByIdNews(Integer newsId);
	
	@Query(value = "select * from news n where n.title like %?1% or n.content like %?1% and n.status=1", nativeQuery = true)
	List<NewsEntity> findByLikeTitle(String titleNews);
	
	@Query(value = "select * from news n where n.user_id =?1 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findNewsByUserId(int userId);
	
	@Query(value = "SELECT TOP 6 * FROM news n where n.status=1 ORDER BY NEWID()", nativeQuery = true)
	List<NewsEntity> findNewsRandom();
	
	@Query(value = "SELECT TOP 3 * FROM news n WHERE n.cate_id = ?1 and n.status=1 ORDER BY NEWID()", nativeQuery = true)
	List<NewsEntity> relatestPost(Integer cateId);
	
	@Query(value = "select * from news n where n.user_id =?1 and n.status = 1 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findNewsByUserIdStatusTrue(int userId);
	
	@Query(value = "select * from news n where n.user_id =?1 and n.status = 0 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findNewsByUserIdStatusFalse(int userId);
	
	@Query(value = "select * from news n where n.user_id=?1 order by date_submitted desc, news_id desc offset ?2 rows fetch next ?3 rows only ", nativeQuery = true)
	List<NewsEntity> findNewsByUserIdPagination(int userId, int start, int pageNumber);
	
	@Query(value = "select * from news n where n.user_id=?1 and n.status=1 order by date_submitted desc, news_id desc offset ?2 rows fetch next ?3 rows only ", nativeQuery = true)
	List<NewsEntity> findNewsByUserIdPaginationStatusTrue(int userId, int start, int pageNumber);
	
	@Query(value = "select * from news n where n.user_id=?1 and n.status=0 order by date_submitted desc, news_id desc offset ?2 rows fetch next ?3 rows only ", nativeQuery = true)
	List<NewsEntity> findNewsByUserIdPaginationStatusFalse(int userId, int start, int pageNumber);
	
	@Query(value = "select * from news order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findAllNews();
	
	@Query(value = "select * from news n where n.status=1 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findAllNewsStatusTrue();
	
	@Query(value = "select * from news n where n.status=0 order by date_submitted desc, news_id desc", nativeQuery = true)
	List<NewsEntity> findAllNewsStatusFalse();
	
	@Query(value = "select * from news order by date_submitted desc, news_id desc offset ?1 rows fetch next ?2 rows only", nativeQuery = true)
	List<NewsEntity> findAllNewsPagination(int start, int pageNumber);
	
	@Query(value = "select * from news n where n.status=1 order by date_submitted desc, news_id desc offset ?1 rows fetch next ?2 rows only ", nativeQuery = true)
	List<NewsEntity> findAllNewsPaginationStatusTrue(int start, int pageNumber);
	
	@Query(value = "select * from news n where n.status=0 order by date_submitted desc, news_id desc offset ?1 rows fetch next ?2 rows only ", nativeQuery = true)
	List<NewsEntity> findAllNewsPaginationStatusFalse(int start, int pageNumber);
	
	@Query(value = "select * from news n where n.user_id=?1 and n.title like %?2% or n.content like %?2%", nativeQuery = true)
	List<NewsEntity> findAllNewsByUserIdSearchString(int userID, String searchString);
	
	@Query(value = "select * from news n where n.title like %?1% or n.content like %?1%", nativeQuery = true)
	List<NewsEntity> findAllNewsSearchString(String searchString);
	
}

