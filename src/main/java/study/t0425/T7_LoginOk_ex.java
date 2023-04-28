package study.t0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/t0424/T7_LoginOk")
public class T7_LoginOk_ex extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave") == null ? "off" : "on";
		
		System.out.println("idSave:" +idSave);
//		String viewPage = "";
		
		HttpSession session = request.getSession();  // 타입은 request.getSession보다 한단계 위인 HttpSession을 줘야한다!
		
		PrintWriter out = response.getWriter();
		
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
//			request.setAttribute("mid", mid);
			session.setAttribute("sMid", mid);
			
			Cookie cookieMid = new Cookie("cMid", mid); // cookie는 배열로 생성됨!
			
			cookieMid.setPath("/"); // ★ 웹 어플리케이션의 '전체(요청)경로'에서 사용(포함)하고자 할 때는 '/'로 지정한다!
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7); // 쿠키 만료시간 일주일!
			}
			else {
				cookieMid.setMaxAge(0); 				
			}
			response.addCookie(cookieMid);
			
			out.print("<script>");
			out.print("alert('"+mid+"님 로그인 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t6_member.jsp';");
			out.print("</script>");
			
//			viewPage = "/study/0425_storage/t5_member.jsp";        위에 메시지 출력을 하면서 viewPage와 dispatcher로 이동안해도 됨!
//			request.getRequestDispatcher(viewPage).forward(request, response); request는 dispacther로 이동할 때만 사용 가능! 
		}
		else {
			out.print("<script>");
			out.print("alert('아이디와 비밀번호를 확인하세요!');");
			out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t6_Login.jsp';");
			out.print("</script>");
			
//			viewPage = "/study/0425_storage/t5_Login.jsp";
//			request.getRequestDispatcher(viewPage).forward(request, response);
		}
	}
}