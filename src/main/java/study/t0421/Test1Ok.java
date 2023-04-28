package study.t0421;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t0421/Test1Ok")
public class Test1Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		/*
//		String mid = request.getParameter("mid");
		String mid = "";
		if(request.getParameter("mid") == null) mid = "";
		
		String name = request.getParameter("name");
		
//		if(mid.equals("admin")) {
		if(request.getParameter("mid").equals("admin")) {
			System.out.println("관리자님이시군요!");
		}
		else {
			System.out.println("방문객이시군요~");
		}
		 */
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");  // 삼항연산자 (name이 null이니? 맞으면 공백으로 가져가고 아니면 값을 가져가!)
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");  //get 방식은 URL로 정보가 가기 때문에 null값이 올 때 처리해줘야한다!
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		
		System.out.println("아이디 :" +mid);
		System.out.println("이름 :" +name);
		System.out.println("직업 :" +job);
		
		request.setAttribute("mid", mid);
		request.setAttribute("name", name);
		request.setAttribute("job", job);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0421/test1Res2.jsp");
		dispatcher.forward(request, response);
	}
}
