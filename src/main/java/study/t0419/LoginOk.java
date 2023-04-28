package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		PrintWriter out = response.getWriter();
		if(mid.equals("admin") && pwd.equals("1234")) {
			out.println("<script>");
			out.println("alert('관리자님! 로그인 성공했습니다.');");
			out.println("</script>");
			out.print("아이디 :" +mid +"<br />");
			out.print("비밀번호 :" +pwd +"<br />");
			out.print("<a href='"+request.getContextPath()+"/study/0419/loginOkEx.jsp'>관리자페이지</a>"); 
		}
		else {
			out.println("<script>");
			out.println("alert('로그인 실패! 다시 확인해주세요..');");
			out.println("</script>");
			out.print("<a href='"+request.getContextPath()+"/study/0419/loginEx.jsp></a>"); 
		}
	}	
}