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

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("utf-8");
			Board board = new Board();
			
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			board.setId(request.getParameter("id"));
			board.setNickname(request.getParameter("nickname"));
			board.setB_title(request.getParameter("b_title"));
			board.setB_content(request.getParameter("b_content"));
			board.setB_idx(Integer.parseInt(request.getParameter("b_idx")));
			
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.update(board);
			
			request.setAttribute("result", result);
			request.setAttribute("b_idx", board.getB_idx());
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "updatePro.jsp";
	}

}
