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
import dao.UserDao;

public class BbsAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDao bd = BoardDao.getInstance();
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
			
			int totCnt = bd.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) { pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<Board> list = bd.list(startRow,endRow);
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if ( endPage> pageCnt ) endPage = pageCnt;
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "bbs.jsp";
	}

}
