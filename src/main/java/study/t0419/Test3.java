package study.t0419;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Test3") // 요즘은 어노테이션 방식을 사용하는데 그럼 web.xml 파일이 필요없음! (@WebServlet이 controller 역할을 함)
public class Test3 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}   // get으로 값이 넘어올 때  -- 최종 출력은 get (기본 방식이 get이므로 생략하면 get 방식 적용!)

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);  
//	}  // post로 값이 넘어올 때 -- 최종 출력은 get (post는 form태그에서만 적용가능!)

}
