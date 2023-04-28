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
@WebServlet({"/t8Post","/t8p"})
public class Test8Post extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); // 서버에 요청할 때 utf-8로 인코딩해서 가져와주세요! (요청할 때 원하는 타입으로 값을 바꾸고 싶을 때) --post 방식에서 사용할 때 was가 server한테 요청할 때 사용
		response.setContentType("text/html; charset=utf-8"); // Was가 서버에 응답을 할 때 utf-8로 변환해서 보내주세요! --post 방식에서 사용할 때 server에서 클라이언트(브라우저)로 넘길 때 사용
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.println("성명 :" +name);
		System.out.println("나이 :" +age);
		
		PrintWriter out = response.getWriter();
		out.print("성명 :" +name +"<br />");
		out.print("나이 :" +age +"<br />");
		// out.print("<a href='/javaweb/study/0419/test8.jsp'>돌아가기</a>");  // context path인 javaweb을 쓰는 것은 위험
		out.print("<a href='"+request.getContextPath()+"/study/0419/test8.jsp'>돌아가기</a>"); // context path 변경했을 때 모든 이름을 바꿔야하기 때문에 변경이 되면 바뀐것으로 찾아와라고 지정해주는 것이 제일 좋은 방법!
	}
}
