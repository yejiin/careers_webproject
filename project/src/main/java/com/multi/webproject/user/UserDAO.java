package com.multi.webproject.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component("udao")
public class UserDAO {
	
	private final String USER_INSERT = 
			"insert into users values(?,?,?,?)";
	
	private final String LOGIN_CHECK = 
			"select userpw from users where userid=?";
	
	public String insertUser(UserVO vo) {
		String result = "";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.219.179:1521:xe", "system", "oracle");
			PreparedStatement pt = con.prepareStatement(USER_INSERT);
			
			pt.setString(1, vo.getUserid());
			pt.setString(2, vo.getUsername());
			pt.setString(3, vo.getUserpw());
			pt.setString(4, vo.getUserbirth());
			
			int insertRow = pt.executeUpdate(); 
			if (insertRow == 1) {
				result = "회원가입 성공했습니다.";
			} else {
				result = "회원가입 오류 발생했습니다.";
			}
			pt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int loginCheck(UserVO vo, String id, String pw, HttpSession session) {
		String dbPW = "";
		int x= -1;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.219.179:1521:xe", "system", "oracle");
			PreparedStatement pstmt = con.prepareStatement(LOGIN_CHECK);
	
			pstmt.setString(1, id);

	
			ResultSet rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				dbPW = rs.getString("userpw");
				if(dbPW.equals(pw)) {
					x=1;
				}
				else
					x=0;   
			}else {
				x=-1; 
			}
			con.close();
			pstmt.close();
			rs.close();
			return x;
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return x;

	}
}
