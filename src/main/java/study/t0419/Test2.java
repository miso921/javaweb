package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Test2 extends HttpServlet {
	
	// webServelet을 사용하지 않고 web.xml이 컨트롤러 역할을 해줌! (WEB-INF > web.xml)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // view에서 form 태그나 url에 자료를 담아서 넘기거나 받을 때 사용
		PrintWriter out = response.getWriter();  // 웹에 출력하기 위해 생성하는 메소드
		out.println("서블릿에서의 출력입니다."); // 주소와 경로가 필요없음(controller의 역할)
		out.println("Welcome to Servlet!!!<br />");
	}
}
