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

public class WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			Board board = new Board();
			
			board.setId(request.getParameter("id"));
			board.setNickname(request.getParameter("nickname"));
			board.setB_title(request.getParameter("b_title"));
			board.setB_content(request.getParameter("b_content"));
			
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.write(board);
			
			request.setAttribute("result", result);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "writePro.jsp";
	}

}
