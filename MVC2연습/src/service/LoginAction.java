package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String nickname = null;
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(Cookie cookie : cookies){
					if(cookie.getName().equals("id")){
						HttpSession session = request.getSession();
						session.setAttribute("id", cookie.getValue());
						String id = (String)session.getAttribute("id");
						UserDao ud = UserDao.getInstance();
						nickname = ud.getNickname(id);
					}
				}
			}
			if (nickname != null){
				return "loginState.jsp";
			} 
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "login.jsp";
	}

}
