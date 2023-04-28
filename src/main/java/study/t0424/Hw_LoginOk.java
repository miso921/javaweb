package study.t0424;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/t0424/Hw_LoginOk")
public class Hw_LoginOk extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave")==null ? "off" : request.getParameter("idSave"); // 아이디 저장 체크를 안하면 off가 오고 안하면 on이 됨!
		
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		
		if((mid.equals("admin") || mid.equals("hkd1234")) && pwd.equals("1234")) {
			Cookie cookieMid = new Cookie("cMid",mid);
			
			cookieMid.setPath("/"); // 해당 쿠키를 모든 경로에서 볼 수 있다!
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*30); // 쿠키 만료시간 : 한달
			}
			else {
				cookieMid.setMaxAge(0); 
			}
			response.addCookie(cookieMid); // 쿠키 저장
			
			session.setAttribute("sMid", mid);
			
			out.print("<script>");
			out.print("alert('"+mid+"님 로그인 되었습니다!');");
			out.print("location.href='"+request.getContextPath()+"/study/0424/hw_Member.jsp'");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('아이디와 비밀번호를 확인하세요..');");
			out.print("location.href='"+request.getContextPath()+"/study/0424/hw_Login.jsp'");
			out.print("</script>");
		}
	}
}
