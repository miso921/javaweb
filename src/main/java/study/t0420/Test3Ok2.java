package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Test3Ok")
public class Test3Ok2 extends HttpServlet {
	
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
			
		System.out.println("성명 : " +name);	
		System.out.println("나이 : " +age);	
		System.out.println("성별 : " +gender);	
		System.out.println("취미 : " +strHobby);	
		
		// DB에 자료 저장 후 View로 이동하기
		
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('자료가 저장되었습니다!');");
		out.println("location.href = "+request.getContextPath()+"'/study/0420/test3.jsp';");  // 자바스크립트에서 사용하는 명령이기 때문에 꼭 <script>를 넣어주어야함!!
		out.print("</script>");
	}
}
