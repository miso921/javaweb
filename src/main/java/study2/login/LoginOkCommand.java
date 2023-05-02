package study2.login;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO(); // 정보가 맞는지 확인하기 위해 DB연동을 위해 생성
		
		LoginVO vo = dao.getLoginCheck(mid,pwd);
		
		// vo가 넘어오면 정회원 null이 넘어오면 비회원
		if(vo.getName() != null) { // null이 아닐때니까 정상이므로 정회원
			// 회원 인증 성공 처리...
			// 회원 인증 후 처리(1. 자주 사용하는 자료를 session에 저장(아이디,성명,닉네임...), 2.쿠키에 아이디 저장 또는 제거하기)
			
			// 방문 포인트 처리하기 ('최종 접속일'/ '방문 카운트' 처리도 함께한다.) -- DB에서 처리해야하므로 DAO에 메소드 생성해서 처리된다!
			// DB의 최종 접속일(10자리)과 시스템 날짜(10자리)를 비교하여 
			// 같으면 todayCount = vo.getTodayCount()+1, 같지 않으면 todayCount = 1
			// 이 때 접속일이 다르면 point = vo.getPoint()+10, 같지 않으면 다시 방문카운트를 비교해서 5 이내면 point=vo.getPoint()+10, 5 이상이면 point=vo.getPoint() 처리한다.
			// 작업 처리 후 다음과 같이 메소드를 호출해 DB처리한다.
			// dao.setPointPlus(mid, todayCount, point);
			
			// 날짜 비교
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strToday = sdf.format(today);
			
			int todayCount = vo.getTodayCount();  
			int point = 0;
			String lastDate = vo.getLastDate();
			if(strToday.equals(lastDate.substring(0,10))) {
				todayCount++;
				if(vo.getTodayCount() < 5) point = vo.getPoint() + 10;
				else point = vo.getPoint();
			}
			else {
				todayCount = 1;
				point = vo.getPoint() + 10;
			}
			
			// 변경된 사항을 update한다.
			dao.setPointPlus(mid, point, todayCount);
			
			// 변경된 사항을 다시 불러온다.
			vo = dao.getLoginCheck(mid, pwd);	
			
			// 1. session 처리 
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName()); // vo는 get으로 읽어옴!
			session.setAttribute("sPoint", vo.getPoint()); // 현재는 DB에 로그인 시 +10씩 늘게끔 저장만 했고 불러오진 않았기 때문에 DAO에서 처리 전인 여기다가 +10을 한다.
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount()); // 현재는 DB에 로그인 시 +10씩 늘게끔 저장만 했고 불러오진 않았기 때문에 DAO에서 처리 전인 여기다가 +1을 한다.
			// DAO에서 처리하기 전에 최종 접속일(getLastDate의 10자리)과 현재 날짜를 비교해서 같다면 +1을 하고 다르다면(날짜가 다르면 하루가 지났다는 것이기 때문에) 0으로 업데이트!
			
			// 2.쿠키에 아이디를 저장/해제 처리한다.
			// 로그인시 아이디저장시킨다고 체크하면 쿠키에 아이디 저장하고, 그렇지 않으면 쿠키에서 아이디를 제거한다.
			String idSave = request.getParameter("idSave")==null ? "off" : "on";
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);
			}
			else {
				cookieMid.setMaxAge(0);
			}
			response.addCookie(cookieMid);
			
			// 정상 로그인Ok 이후에 모든 처리가 끝나면 memberMain.jsp로 보내준다.
			request.setAttribute("msg", mid + "님 로그인 되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberMain.re");
			System.out.println("정상");
		}
		else {
			// 회원 인증 실패 처리...
			request.setAttribute("msg", "로그인 실패~");
			request.setAttribute("url", request.getContextPath()+"/Login.re");
		}
	}
}
