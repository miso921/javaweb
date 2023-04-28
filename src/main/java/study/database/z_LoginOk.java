package study.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/z_LoginOk")
public class z_LoginOk extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		z_LoginDAO dao = new z_LoginDAO(); // 정보가 맞는지 확인하기 위해 DB연동을 위해 생성
		
		LoginVO vo = dao.getLoginCheck(mid,pwd);
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sdfDate  = sdf.format(today);
		
		
		// vo가 넘어오면 정회원 null이 넘어오면 비회원
		if(vo.getName() != null) { // null이 아닐때니까 정상이므로 정회원
			int point = vo.getPoint();
			int tCnt = vo.getTodayCount();
			String lastDate = vo.getLastDate();
			// 회원 인증 성공 처리...
			// 회원 인증 후 처리(1. 자주 사용하는 자료를 session에 저장(아이디,성명,닉네임...))
			// 방문 포인트 처리하기 ('최종 접속일'/ '방문 카운트' 처리도 함께한다.) -- DB에서 처리해야하므로 DAO에 메소드 생성해서 처리된다!
			// DB의 최종 접속일(10자리)과 시스템 날짜(10자리)를 비교하여 
			// 같으면 todayCount = vo.getTodayCount()+1, 같지 않으면 todayCount = 0
			// dao.setPointPlus(mid, todayCount);
			
			if(lastDate.substring(0,10).equals(sdfDate)) {
				tCnt = tCnt + 1; // 현재는 DB에 로그인 시 +10씩 늘게끔 저장만 했고 불러오진 않았기 때문에 DAO에서 처리 전인 여기다가 +1을 한다.
				if(tCnt <= 5) {
					point= point + 10; // 현재는 DB에 로그인 시 +10씩 늘게끔 저장만 했고 불러오진 않았기 때문에 DAO에서 처리 전인 여기다가 +10을 한다.
				}
			}
			else {
				tCnt = 1;
				point= point + 10;
			}
			// 변경된 사항을 update
			dao.setPointPlus(mid, tCnt, point);
			
			// 변경된 사항을 다시 불러준다.
			vo = dao.getLoginCheck(mid,pwd);
			
			// 1. session 처리 
//			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName()); // vo는 get으로 읽어옴!
			session.setAttribute("sLastDate", lastDate);
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sTcnt", vo.getTodayCount());
			// DAO에서 처리하기 전에 최종 접속일(getLastDate의 10자리)과 현재 날짜를 비교해서 같다면 +1을 하고 다르다면(날짜가 다르면 하루가 지났다는 것이기 때문에) 0으로 업데이트!
			
			out.print("<script>");
			out.print("alert('"+mid+" 님 로그인 되었습니다^_^');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/z_memberMain.jsp';");
			out.print("</script>");
		}
		else {
			// 회원 인증 실패 처리...
			out.print("<script>");
			out.print("alert('로그인 실패!!');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/z_login.jsp';");  // location.href는 직렬화가 아니고 jsp로 보내야하기 때문에 redirect와 같은 것으로 request.getContextPath() 사용해야함!
			out.print("</script>");
		}
	}
}
