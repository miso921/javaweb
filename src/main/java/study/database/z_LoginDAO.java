package study.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 프레임워크, mvc, 오버로드, 오버라이드, dao(데이터베이스 로직 관련 클래스)
// statment prepare
public class z_LoginDAO {
	
//10~12 3개 객체는 java.sql 에 있는 것을 import!
	private Connection conn = null;  // DB에 연결해주는 객체
	private PreparedStatement pstmt = null; // DB에서 select 명령 외 사용할 때 사용
	private ResultSet rs = null; // DB에서 select 명령할 때만 사용
	
	LoginVO vo = null; // 많은 메소드에서 공통적으로 사용하기 때문에 전역변수로 사용 
	String sql = "";
	
	public z_LoginDAO() {
		String url = "jdbc:mysql://localhost:3306/javaweb"; // 다른 컴퓨터에서 사용하면 컴퓨터 도메인을 localhost에 입력(모르면 ID입력)
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, user, password); 
		} catch (ClassNotFoundException e) {
				System.out.println("드라이버 검색 실패~!"); // jdbc 있는지 확인하기
		} catch (SQLException e) {
				System.out.println("데이터베이스 연동 실패~!"); // url, user, password 맞는지 확인하기
		}
	}
	
	// 사용한 객체의 반납(해제)
	public void pstmtClose() {
		if(pstmt != null) { // pstmt가 null이 아닐 때니까 사용중일 때
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) { 
			try {
				rs.close();    
				pstmtClose();  
			} catch (SQLException e) {}
		}
	}

	// 로그인 체크	
	public LoginVO getLoginCheck(String mid, String pwd) {
		vo = new LoginVO();
		
		try {
			sql = "select * from login where mid=? and pwd=?"; //preparestatment는 무엇이 올지 모를 때 ?를 사용!
			pstmt = conn.prepareStatement(sql); // 위 sql 명령문에 있는 ?에 값을 찾아서 넣어줘야하기 때문에 변수가 있는 sql을 넣어줌
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery(); // select 명령일 때는 executeQuery 사용!!하고 이것은 레코드를 가져오는 rs가 관리하라는 뜻으로 rs에 값을 저장	
			// 62라인 -- DB자료까지 읽어온 상태
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx")); // 필드명 가져오는 것
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCount(rs.getInt("todayCount"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 :"+e.getMessage());
		} finally {
			rsClose();
		}
		return vo; // 정보를 찾으면 vo가 넘어가고 없으면 null 값이 넘어감
	}
	
	// 방문 포인트 증가시키기, 최종 접속일 업데이트
	public void setPointPlus(String mid, int tCnt, int point) {
		try {
			sql = "update login set point = ?, lastDate = now(), todayCount = ?  where mid =?"; // ?는 방금 넘어온 mid
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point); // preparestatment (?)를 채워준다
			pstmt.setInt(2, tCnt); // preparestatment (?)를 채워준다
			pstmt.setString(3, mid); // preparestatment (?)를 채워준다
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 :"+e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
}