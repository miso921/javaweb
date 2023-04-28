package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t0420/Test3Ok")
public class Test3Ok extends HttpServlet {
	
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
		
		/*
		 * PrintWriter out = response.getWriter();
		 * 
		 * out.print("<script>"); 
		 * out.print("alert('자료가 저장되었습니다!');");
		 * out.println("location.href = '"+request.getContextPath()+"/study/0420/test3.jsp';"); 
		 * out.print("</script>"); 
		 * // 자바스크립트에서 사용하는 명령이기 때문에 꼭 <script>를 넣어주어야함!! 그리고 view를 분리해야한다! test3Res.jsp에 분리함
		 */
		
		// DB에 자료 저장 후 View로 이동하기
		name = URLEncoder.encode(name,"utf-8");
		response.sendRedirect(request.getContextPath()+"/study/0420/test3Res.jsp?name="+name);   // location.href(자바스크립트 명령어)와 같은 서버에서 사용하는 명령어
		// 방향을 바꾸는 명령어이기 때문에 getContextPath를 꼭 적어줘야한다 (가다가 메세지를 출력하는 등의 중간에 다른 작업을 할 수도 있음)
		/*RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test3Res.jsp");*/
 		// 직렬화(넘어온 값을 싣고 응답을 보낸다) 명령이기 때문에 같은 경로로 가기 때문에 request.getContextPath()를 사용하지 않는다 (또 사용하면 javaweb안의 javaweb 안으로 또 들어간다고 간주한다)
//		dispatcher.forward(request, response);	// 요청해서 가져온 값을 다시 응답해서 보내겠다는 의미
	}
}
