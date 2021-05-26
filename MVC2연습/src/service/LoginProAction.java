package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String    id    = request.getParameter("id");
			String password = request.getParameter("password");
			UserDao ud = UserDao.getInstance();
			int result = ud.login(id, password);
			if(result == 1){
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				Cookie cookie = new Cookie("id",id);
				cookie.setMaxAge(600);
				cookie.setPath("/");
				response.addCookie(cookie); 
				request.setAttribute("result", 1);
	 		} else if (result == 0) {
	 			request.setAttribute("result", 0);
			} else { 
				request.setAttribute("result", -1);
			} 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "loginPro.jsp";
	}

}
