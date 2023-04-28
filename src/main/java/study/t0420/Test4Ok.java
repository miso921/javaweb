package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test4Ok")
public class Test4Ok extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");  // setContentType은 두줄을 한줄에 쓸 수 있고 타입변환하여 한글이 깨지지 않음!
		
		String name = request.getParameter("name");   // parameter는 name 값으로만 가져온다!
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");

		String[] hobbys = request.getParameterValues("hobby");
		String strHobby = "";
		for(String hobby : hobbys) strHobby += hobby + "/";
		strHobby = strHobby.substring(0,strHobby.length()-1);
		
		String hostIp = request.getParameter("hostIp");
			
		System.out.println("성명 : " +name);	
		System.out.println("나이 : " +age);	
		System.out.println("성별 : " +gender);	
		System.out.println("취미 : " +strHobby);	
		System.out.println("접속자 : " +hostIp);	
		
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("gender",gender);
		request.setAttribute("str",strHobby);
		request.setAttribute("hostIp",hostIp);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test4Res.jsp");
		dispatcher.forward(request, response); // dispatcher는 직렬화해서 사용하고 이유는 넘어온 값을 그대로 가지고 직렬화로 가고 싶어서 사용! view에 출력은 해주지만 URL은 신경쓰지 않음!
	}
}
