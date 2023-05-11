package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;

	// 아이디 체크 후 자료가 있으면 VO에 개인정보를 모두 담는다.
	public MemberVO getMemberMidCheck(String mid) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userinfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
			}
		} catch (Exception e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 닉네임 중복 체크
	public MemberVO getMemberNickCheck(String nickName) {
		vo = new MemberVO();
		try {
			sql = "select * from member where nickName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"nickName");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userinfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
			}
		} catch (Exception e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 신규 회원가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			pstmt.setString(16, vo.getSalt());
			pstmt.executeUpdate();
			res = 1;
		} catch (Exception e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// 오늘 처음 방문시에 방문 카운트를 0으로 초기화
	public void setTodayCntUpdate(String mid) {
		try {
			sql = "update member set todayCnt = 0 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 방문시 '포인트', '오늘 방문 횟수', '총 방문횟수', '최종 접속일' 처리 
	public void setMemberTotalUpdate(String mid, int nowTodayPoint) {
		try {
			sql = "update member set visitCnt=visitCnt+1, todayCnt=todayCnt+1, Point=?, lastDate=now() where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nowTodayPoint);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 아이디 찾기
	public MemberVO getMemberFindMid(String name, String tel) {
		vo = new MemberVO();
		try {
			sql = "select mid from member where name=?, tel=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setMid(rs.getString("mid"));
			}
		} catch (Exception e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 회원 전체 목록 처리
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
			try {
				sql = "select * from member order by idx desc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new MemberVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setNickName(rs.getString("nickName"));
					vo.setName(rs.getString("name"));
					vo.setGender(rs.getString("gender"));
					vo.setBirthday(rs.getString("birthday"));
					vo.setTel(rs.getString("tel"));
					vo.setAddress(rs.getString("address"));
					vo.setEmail(rs.getString("email"));
					vo.setHomePage(rs.getString("homePage"));
					vo.setJob(rs.getString("job"));
					vo.setHobby(rs.getString("hobby"));
					vo.setPhoto(rs.getString("photo"));
					vo.setContent(rs.getString("content"));
					vo.setUserInfor(rs.getString("userinfor"));
					vo.setUserDel(rs.getString("userDel"));
					vo.setPoint(rs.getInt("point"));
					vo.setLevel(rs.getInt("level"));
					vo.setVisitCnt(rs.getInt("visitCnt"));
					vo.setStartDate(rs.getString("startDate"));
					vo.setLastDate(rs.getString("lastDate"));
					vo.setTodayCnt(rs.getInt("todayCnt"));
					vo.setSalt(rs.getString("salt"));
					
					vos.add(vo);
				}
			} catch (Exception e) {
				System.out.println("SQL 에러 : " +e.getMessage());
			} finally {
				getConn.rsClose();
			}
		return vos;
	}
}
