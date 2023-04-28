package study.t0420;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test5OkEx")
public class Test5OkEx extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String[] sus = request.getParameterValues("su");
		int[] suArr = new int[sus.length];

		// String 배열을 int 배열로 바꿔줌
		for(int i=0; i<sus.length; i++) {
			suArr[i] = Integer.parseInt(sus[i]);
		}
		Arrays.sort(suArr); // 오름차순 배열 정렬
		String suPrint="";
		for(int suArrs : suArr) suPrint += suArrs + "/"; // 배열에서 추출하면서 맨 뒤 / 제거!
			suPrint = suPrint.substring(0,suPrint.length()-1);
		
		System.out.print(suPrint);	
		
		request.setAttribute("suPrint",suPrint);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test5Res.jsp");
		dispatcher.forward(request, response);
		}
}
