package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.Comment;
import dao.CommentDao;

public class ReWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String nickname = request.getParameter("nickname");
			String pageNum = request.getParameter("pageNum");
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			
			Comment comment = new Comment();
			comment.setB_idx(b_idx);
			comment.setId(id);
			comment.setNickname(nickname);
			comment.setC_content(request.getParameter("c_content"));
			comment.setC_idx(Integer.parseInt(request.getParameter("c_idx")));
			comment.setRef(Integer.parseInt(request.getParameter("ref")));
			comment.setRe_step(Integer.parseInt(request.getParameter("re_step")));
			comment.setRe_level(Integer.parseInt(request.getParameter("re_level")));
			
			CommentDao cd = CommentDao.getInstance();
			int result = cd.insert(comment);
			
			
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(b_idx);
			
			String content = board.getB_content();
			content = content.replace("\r\n","<br>");
		
			request.setAttribute("c_idx", comment.getC_idx());
			request.setAttribute("b_idx", b_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
			request.setAttribute("content", content);
			request.setAttribute("nickname", nickname);
			request.setAttribute("id", id);
			request.setAttribute("ref", comment.getRef());	
			request.setAttribute("re_level", comment.getRe_level());	
			request.setAttribute("re_step", comment.getRe_step());
			request.setAttribute("result", result);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "viewPro.jsp";
	}

}
