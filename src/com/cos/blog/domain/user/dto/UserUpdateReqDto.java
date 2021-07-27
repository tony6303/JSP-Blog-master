package com.cos.blog.domain.user.dto;

import com.cos.blog.domain.user.User;

import lombok.Data;

@Data
public class UserUpdateReqDto extends User{
	private int id;
	private String username;
	private String email;
	private String address;
}
