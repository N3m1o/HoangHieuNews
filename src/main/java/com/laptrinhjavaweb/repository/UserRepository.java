package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.laptrinhjavaweb.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Integer>{
	@Query(value = "select * from users u where u.username = ?1 and u.[password] = ?2", nativeQuery = true)
	UserEntity findByNameAndPass(String username, String password);
	
	@Query(value = "select * from users u where u.username = ?1", nativeQuery = true)
	UserEntity findByName(String username);
	
	@Query(value = "insert into users u values (null, u.fullname = ?1, u.gender = ?2, 0, 0, u.username = ?3, u.password = ?4)", nativeQuery = true)
	UserEntity findById(String fullname, Integer gender, String username, String password);
	
	@Query(value = "SELECT * FROM users u JOIN news n ON n.user_id = u.user_id WHERE n.news_id = ?1", nativeQuery = true)
	UserEntity findNameAuthorByNewsId(int newsId);
	
	@Query(value = "select * from users u where u.user_id = ?1", nativeQuery = true)
	UserEntity findByUserId(Integer userId);
	
	@Query(value = "select * from users u where u.is_admin=0 order by u.user_id desc", nativeQuery = true)
	List<UserEntity> findAllUsers();
	
	@Query(value = "select * from users u where u.is_admin=0 and u.is_author=1 order by u.user_id desc", nativeQuery = true)
	List<UserEntity> findAllUsersAuthors();
	
	@Query(value = "select * from users u where u.is_admin=0 and u.is_author=0 order by u.user_id desc", nativeQuery = true)
	List<UserEntity> findAllUsersReaders();
	
	@Query(value = "select * from users u where u.is_admin=0 order by u.user_id desc offset ?1 rows fetch next ?2 rows only", nativeQuery = true)
	List<UserEntity> findAllUsersPagination(int start, int pageNumber);
	
	@Query(value = "select * from users u where u.is_admin=0 and u.is_author=1 order by u.user_id desc offset ?1 rows fetch next ?2 rows only", nativeQuery = true)
	List<UserEntity> findAllUsersPaginationAuthors(int start, int pageNumber);
	
	@Query(value = "select * from users u where u.is_admin=0 and u.is_author=0 order by u.user_id desc offset ?1 rows fetch next ?2 rows only",  nativeQuery = true)
	List<UserEntity> findAllUsersPaginationReaders(int start, int pageNumber);
	
	@Query(value = "select * from users u where u.fullname like %?1% or u.username like %?1% ", nativeQuery = true)
	List<UserEntity> findAllUsersSearchString(String searchString );
}
