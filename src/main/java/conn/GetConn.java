package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaweb";
	private String user = "root";
	private String password = "1234";
	
	private static GetConn instance = new GetConn();   // 메소드에 올려놓고 사용하기 위해 static을 입력해준다.
	
	// GetConn 객체를 singletone으로 사용하고자 한다. 따라서 외부에서 생성할 수 없도록 한다.
  // public GetConn() {
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver 검색 실패!");
		} catch (SQLException e) {
			System.out.println("Database 연동 실패!");
		}
	}	
	
	// GetConn 객체를 외부에서 연결해서 사용하기 위한 메소드를 만들어준다.
	public Connection getConn() {
		return conn;                          // 데이터베이스 연결하기 위한 메소드이므로 return: conn을 해주면 된다!!!
		
	}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				pstmtClose();
				rs.close();
			} catch (SQLException e) {}
		}
	}
	 
	public static GetConn getInstance() {   // instance 필드를 불러오기 위해 만드는 메소드!
		return instance;
	}
}
