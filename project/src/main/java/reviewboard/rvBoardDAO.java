package reviewboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("dao")
public class rvBoardDAO {
	
	String insertBoard(rvBoardVO vo) {
		String result = "";
		try {
			String sql = "INSERT INTO RV_BOARD(RSEQ, TITLE, CONTENTS, WRITER) VALUES ((SELECT NVL(MAX(RSEQ),0)+1 from RV_BOARD), ?, ?, ?)";
			Class.forName("oracle.jdbc.driver.OracleDriver"); // oracle driver 호출 
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","oracle"); // 연결 
			PreparedStatement pt = con.prepareStatement(sql);
			// 2-3. Setter 값 설정
			pt.setString(1, vo.getTitle());
			pt.setString(2, vo.getContents());
			pt.setString(3, vo.getWriter());
			
			// 2-4. DB 전송 
			int insertRow = pt.executeUpdate();
			// 2-5. SQL 실행 결과 검색 
			if(insertRow == 1)
				result = "작성 완료";
			else 
				result = "작성 실패";
			pt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	} // InsertBoard end
	ArrayList<rvBoardVO> getBoardList() {
		ArrayList<rvBoardVO> boardlist = 
				new ArrayList<rvBoardVO>();
		try {
		String sql = "SELECT rseq, title, writer FROM RV_BOARD";
		//2-2. PreparedStatement 정의
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection
		("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
		PreparedStatement pt = con.prepareStatement(sql);
		//2-4. db 전송
		ResultSet rs = pt.executeQuery();
		//2-5. sql 실행 결과 검색
		while(rs.next()) {
			rvBoardVO vo = new rvBoardVO();
			vo.setRseq(rs.getInt("rseq"));
			vo.setTitle(rs.getString("title"));
			vo.setWriter(rs.getString("writer"));
			boardlist.add(vo); //vo:2개변수저장
		}
		pt.close();
		con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return boardlist;	
	}//getBoardList end
	
	rvBoardVO getBoard(int rseq) {
		rvBoardVO vo = new rvBoardVO();
		try {
			String sql = "SELECT * FROM RV_BOARD WHERE RSEQ=?";
			String sql2 = "update rv_board set viewcnt = viewcnt+1 where rseq=?";

			Class.forName("oracle.jdbc.driver.OracleDriver"); // oracle driver 호출 
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.231.106:1521:xe", "system","oracle"); // 연결 
			PreparedStatement pt = con.prepareStatement(sql);
			PreparedStatement pt2 = con.prepareStatement(sql2);
			
			pt.setInt(1, rseq);
			pt2.setInt(1, rseq);
			// 2-4. DB 전송 
			pt2.executeUpdate();
			ResultSet rs = pt.executeQuery();
			// 2-5. SQL 실행 결과 검색
			while(rs.next()) {
				vo.setRseq(rs.getInt("rseq"));
				vo.setTitle(rs.getString("title"));
				vo.setContents(rs.getString("contents"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getDate("regdate"));
				vo.setViewcnt(rs.getInt("viewcnt"));
			}
			pt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	} // getBoard end
}
