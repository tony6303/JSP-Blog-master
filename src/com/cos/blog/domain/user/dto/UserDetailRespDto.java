package com.cos.blog.domain.user.dto;

import lombok.Data;

@Data
public class UserDetailRespDto {
	private int id;
	private String username;
	private String email;
	private String address;
}
