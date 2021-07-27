package com.cos.blog.domain.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cos.blog.config.DB;
import com.cos.blog.domain.board.dto.DetailRespDto;
import com.cos.blog.domain.user.dto.JoinReqDto;
import com.cos.blog.domain.user.dto.LoginReqDto;
import com.cos.blog.domain.user.dto.UserUpdateReqDto;
import com.cos.blog.domain.user.dto.UserDetailRespDto;

public class UserDao {
	public int save(JoinReqDto dto) { // 회원가입
		String sql = "insert into user(username, password, email, address, userRole, createDate)";
		sql += "values(?, ?, ?, ?, 'USER', now())";
		
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUsername());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getAddress());
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DB.close(conn, pstmt);
		}
		return -1;
	}

	public int findByUsername(String username) { //아이디 중복 체크
		String sql = "SELECT * FROM user WHERE username = ?";
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username); //dto가 아닌 그냥 username
			rs =  pstmt.executeQuery(); //조회 결과가 1건이라도 있으면 1 , 없으면 -1

			if(rs.next()) { //1건이라도 있다 = true 일때 실행
				return 1; // 있어
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 무조건 실행
			DB.close(conn, pstmt, rs);
		}
		return -1; // 없어
	}

	public UserDetailRespDto findById(int id) { // 회원정보보기
		StringBuffer sb = new StringBuffer();
		sb.append("select id, username, password, email, address ");
		sb.append("from user ");
		sb.append("where id = ?");

		String sql = sb.toString();
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs =  pstmt.executeQuery();

			// Persistence API
			if(rs.next()) { // 커서를 이동하는 함수
				UserDetailRespDto dto = new UserDetailRespDto();
				dto.setId(rs.getInt("id"));
				dto.setUsername(rs.getString("username"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				
//				dto.setTitle(rs.getString("b.title"));
//				dto.setContent(rs.getString("b.content"));
//				dto.setReadCount(rs.getInt("b.readCount"));
//				dto.setUsername(rs.getString("u.username"));
//				dto.setUserId(rs.getInt("userId"));
				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 무조건 실행
			DB.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int userUpdate(UserUpdateReqDto dto) { // 회원수정
		String sql = "UPDATE user SET username = ? , email = ?, address = ? WHERE id = ?";
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUsername());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setInt(4, dto.getId());
			int result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 무조건 실행
			DB.close(conn, pstmt);
		}
		return -1;
	}
	

	public User findByUsernameAndPassword(LoginReqDto dto) { // 로그인
		String sql = "SELECT id, username, email, address FROM user WHERE username = ? and password =?";
		Connection conn = DB.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUsername()); //dto가 아닌 그냥 username
			pstmt.setString(2, dto.getPassword());
			rs =  pstmt.executeQuery(); 

			// Persistence API
			if(rs.next()) { //1건이라도 있다 = true 일때 실행
				User user = User.builder()
						.id(rs.getInt("id"))
						.username(rs.getString("username"))
						.email(rs.getString("email"))
						.address(rs.getString("address"))
						.build();
				
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 무조건 실행
			DB.close(conn, pstmt, rs);
		}
		return null; // 없어
	}
	
}
