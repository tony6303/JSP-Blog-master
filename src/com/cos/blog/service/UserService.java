package com.cos.blog.service;

import com.cos.blog.domain.user.User;
import com.cos.blog.domain.user.UserDao;
import com.cos.blog.domain.user.dto.JoinReqDto;
import com.cos.blog.domain.user.dto.LoginReqDto;
import com.cos.blog.domain.user.dto.UserUpdateReqDto;
import com.cos.blog.domain.user.dto.UserDetailRespDto;

public class UserService {
	private UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	
	
	public int 회원가입(JoinReqDto dto) {
		
		int result = userDao.save(dto);
		return result;
	}

	public User 로그인(LoginReqDto dto) {
		return userDao.findByUsernameAndPassword(dto);
	}
	
	public UserDetailRespDto 회원정보보기(int id) {
		return userDao.findById(id);
	}

	public int 회원수정(UserUpdateReqDto dto) {
		int result = userDao.userUpdate(dto);
		return result;
	}

	public int 유저네임중복체크(String username) {
		int result = userDao.findByUsername(username);
		return result;
	}
}
