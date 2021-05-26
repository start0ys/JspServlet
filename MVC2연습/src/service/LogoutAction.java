package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

public class LogoutAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			session.invalidate();
		    Cookie[] cookies = request.getCookies();
		    if(cookies!=null){
		        for(Cookie cookie : cookies){
		            if(cookie.getName().equals("id")){
		            	cookie.setMaxAge(0);
		            	cookie.setPath("/");
		                response.addCookie(cookie);
		                
		            }
		        }
		    }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "logout.jsp";
	}

}
