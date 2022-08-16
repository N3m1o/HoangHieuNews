package com.laptrinhjavaweb.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.NewsEntity;
import com.laptrinhjavaweb.repository.NewsRepository;
import com.laptrinhjavaweb.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsRepository newsRepository;

	public List<NewsEntity> findAll() {
		try {
			return newsRepository.findAllBy();
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findLast() {
		try {
			return newsRepository.findLastNews();
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findById(Integer categoryId) {
		try {
			return newsRepository.findByCateID(categoryId);
		} catch (Exception e) {
			return null;
		}
	}

	public NewsEntity findByIdNews(Integer newsId) {
		try {
			return newsRepository.findOneByIdNews(newsId);
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> search(String titleNews) {
		try {
			return newsRepository.findByLikeTitle(titleNews);
		} catch (Exception e) {
			return null;
		}
	}

	public void save(NewsEntity newsEntity) {
		newsRepository.save(newsEntity);
	}

	public void delete(NewsEntity newsEntity) {
		newsRepository.delete(newsEntity);
	}

	public NewsEntity editNews(int newsId, NewsEntity newsEntity) {
		NewsEntity update = newsRepository.findOneByIdNews(newsId);
		update.setTitle(newsEntity.getTitle());
		update.setDisplay_img(newsEntity.getDisplay_img());
		update.setShortDescription(newsEntity.getShortDescription());
		update.setContent(newsEntity.getContent());
		update.setCateId(newsEntity.getCateId());
		return newsRepository.save(update);
	}

	public List<NewsEntity> findNewsByUserId(int userId) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findNewsByUserId(userId);
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findNewsRandom() {
		try {
			return newsRepository.findNewsRandom();
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> relatestPost(int cateId) {
		try {
			return newsRepository.relatestPost(cateId);
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findNewsForRight(Integer cateId) {
		try {
			return newsRepository.findNewsForRight(cateId);
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findNewsForLeft(Integer cateId) {
		try {
			return newsRepository.findNewsForLeft(cateId);
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findNewsByUserIdStatusTrue(int userId) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findNewsByUserIdStatusTrue(userId);
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<NewsEntity> findNewsByUserIdStatusFalse(int userId) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findNewsByUserIdStatusFalse(userId);
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<NewsEntity> findNewsByUserIdPagination(int userId, int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findNewsByUserIdPagination(userId,start,pageNumber);
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<NewsEntity> findNewsByUserIdPaginationStatusTrue(int userId, int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findNewsByUserIdPaginationStatusTrue(userId,start,pageNumber);
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<NewsEntity> findNewsByUserIdPaginationStatusFalse(int userId, int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findNewsByUserIdPaginationStatusFalse(userId,start,pageNumber);
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findAllNews() {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findAllNews();
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findAllNewsStatusTrue() {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findAllNewsStatusTrue();
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findAllNewsStatusFalse() {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findAllNewsStatusFalse();
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findAllNewsPagination(int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findAllNewsPagination(start,pageNumber);
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findAllNewsPaginationStatusTrue(int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findAllNewsPaginationStatusTrue(start,pageNumber);
		} catch (Exception e) {
			return null;
		}
	}

	public List<NewsEntity> findAllNewsPaginationStatusFalse(int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return newsRepository.findAllNewsPaginationStatusFalse(start,pageNumber);
		} catch (Exception e) {
			return null;
		}
	}
	
	
	public List<NewsEntity> findAllNewsByUserIdSearchString(int userID, String searchString) {
		try {
			return newsRepository.findAllNewsByUserIdSearchString(userID,searchString);
		} catch (Exception e) {
			return null;
		}
	}
	

	public List<NewsEntity> findAllNewsSearchString( String searchString) {
		try {
			return newsRepository.findAllNewsSearchString(searchString);
		} catch (Exception e) {
			return null;
		}
	}
}
