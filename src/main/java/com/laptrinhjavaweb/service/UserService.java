package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.entity.UserEntity;

public interface UserService {
	UserEntity findByUserAndPass(UserEntity userEntity);
	
	UserEntity findByName(String username);
	
	UserEntity findByUserId(UserEntity userEntity);
	
	UserEntity findNameAuthorByNewsId(int newsId);
	
	UserEntity getUserByUsername(String username);
	
	UserEntity findByUserId(int userId);
	
	void save(UserEntity userEntity);
	
	void delete(UserEntity userEntity);
	
	List<UserEntity> findAllUsers();
	
	List<UserEntity> findAllUsersAuthors();
	
	List<UserEntity> findAllUsersReaders();
	
	List<UserEntity> findAllUsersPagination(int start, int pageNumber);
	
	List<UserEntity> findAllUsersPaginationAuthors(int start, int pageNumber);
	
	List<UserEntity> findAllUsersPaginationReaders(int start, int pageNumber);
	
	List<UserEntity> findAllUsersSearchString(String searchString );
}
