package com.laptrinhjavaweb.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;
	
	public UserEntity findByUserAndPass(UserEntity userEntity) {
		try {
			return userRepository.findByNameAndPass(userEntity.getUsername(), userEntity.getPassword());
		} catch (Exception e) {
			return null;
		}
	}


	public UserEntity findByUserId(UserEntity userEntity) {
		try {
			return userRepository.findById(userEntity.getFullname(), userEntity.getGender(), userEntity.getUsername(), userEntity.getPassword());
		} catch (Exception e) {
			return null;
		}
	}


	public UserEntity findByName(String username) {
		return userRepository.findByName(username);
	}


	public UserEntity findNameAuthorByNewsId(int newsId) {
		return userRepository.findNameAuthorByNewsId(newsId);
	}


	public UserEntity getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByName(username);
	}


	public UserEntity findByUserId(int userId) {
		try {
			return userRepository.findByUserId(userId);
		} catch (Exception e) {
			return null;
		}
	}


	public void save(UserEntity userEntity) {
		userRepository.save(userEntity);
	}

	public void delete(UserEntity userEntity) {
		userRepository.delete(userEntity);
	}


	public List<UserEntity> findAllUsers() {
		// TODO Auto-generated method stub
		try {
			return userRepository.findAllUsers();
		} catch (Exception e) {
			return null;
		}
	}


	public List<UserEntity> findAllUsersAuthors() {
		// TODO Auto-generated method stub
		try {
			return userRepository.findAllUsersAuthors();
		} catch (Exception e) {
			return null;
		}
	}


	public List<UserEntity> findAllUsersReaders() {
		// TODO Auto-generated method stub
		try {
			return userRepository.findAllUsersReaders();
		} catch (Exception e) {
			return null;
		}
	}


	public List<UserEntity> findAllUsersPagination(int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return userRepository.findAllUsersPagination( start, pageNumber);
		} catch (Exception e) {
			return null;
		}
	}


	public List<UserEntity> findAllUsersPaginationAuthors(int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return userRepository.findAllUsersPaginationAuthors( start, pageNumber);
		} catch (Exception e) {
			return null;
		}
	}


	public List<UserEntity> findAllUsersPaginationReaders(int start, int pageNumber) {
		// TODO Auto-generated method stub
		try {
			return userRepository.findAllUsersPaginationReaders( start, pageNumber);
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<UserEntity> findAllUsersSearchString(String searchString) {
		// TODO Auto-generated method stub
		try {
			return userRepository.findAllUsersSearchString( searchString);
		} catch (Exception e) {
			return null;
		}
	}
}
