package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Test5miInterface {
	                    // 추상메소드의 HttpServlet화 해주기, 실행하는 곳이 아니고 선언만 하기 때문에 {}없음
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
	
}
