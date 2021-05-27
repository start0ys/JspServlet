package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;
import dao.Comment;
import dao.CommentDao;
import dao.UserDao;

public class ViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//쿠키,세션작업
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
			//게시글보기위한 작업
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			String pageNum = request.getParameter("pageNum");
			BoardDao bd = BoardDao.getInstance();
			bd.readCount(b_idx);
			Board board = bd.select(b_idx);
			
			String content = board.getB_content();
			content = content.replace("\r\n","<br>");
		
			
			request.setAttribute("b_idx", b_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
			request.setAttribute("content", content);
			
			//대댓글 작업
			int c_idx = 0, ref = 0, re_level = 0, re_step = 0;
			if (pageNum == null ) pageNum = "1";
			CommentDao cd = CommentDao.getInstance();
			if(request.getParameter("c_idx") != null ) {
				c_idx = Integer.parseInt(request.getParameter("c_idx"));
				Comment comment = cd.select(c_idx);
				ref = comment.getRef();
				re_level = comment.getRe_level();
				re_step = comment.getRe_step();
			}
			request.setAttribute("c_idx", c_idx);	
			request.setAttribute("ref", ref);	
			request.setAttribute("re_level", re_level);	
			request.setAttribute("re_step", re_step);
			
			//댓글작업
			int totCnt = cd.getTotalCnt(b_idx);
			List<Comment> list = cd.list(b_idx);
			
			request.setAttribute("list", list);
			
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "view.jsp";
	}

}
