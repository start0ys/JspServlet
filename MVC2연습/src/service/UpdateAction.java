package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;
import dao.UserDao;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String nickname = null;
			String id = null;
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(Cookie cookie : cookies){
					if(cookie.getName().equals("id")){
						HttpSession session = request.getSession();
						session.setAttribute("id", cookie.getValue());
						id = (String)session.getAttribute("id");
						UserDao ud = UserDao.getInstance();
						nickname = ud.getNickname(id);
					}
				}
			}
			if (nickname == null){
				request.setAttribute("log", 1);
				return "loginState.jsp";
			} 
			request.setAttribute("nickname", nickname);
			request.setAttribute("id", id);
			
			
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(b_idx);
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "update.jsp";
	}

}
