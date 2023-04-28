package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/joinOK")
public class JoinOk extends HttpServlet {
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		String nick = request.getParameter("nick");
		String pwd = request.getParameter("pwd");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String mail = request.getParameter("mail");
		String gender = request.getParameter("gender");
		int birthday = Integer.parseInt(request.getParameter("birthday"));
		
		System.out.println("아이디 : " +mid);
		System.out.println("닉네임 : " +nick);
		System.out.println("비밀번호 : " +pwd);
		System.out.println("전화번호 : " +phone);
		System.out.println("이메일 : " +mail);
		System.out.println("성별 : " +gender);
		System.out.println("생년월일 : " +birthday);
		
		PrintWriter out = response.getWriter();
		out.println("아이디 : " +mid+"<br />");
		out.println("닉네임 : " +nick+"<br />");
		out.println("비밀번호 : " +pwd+"<br />");
		out.println("전화번호 : " +phone+"<br />");
		out.println("이메일 : " +mail+"<br />");
		out.println("성별 : " +gender+"<br />");
		out.println("생년월일 : " +birthday+"<br />");
		
		
		
	}
}
