package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.CommentDao;

public class ReDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			String pageNum = request.getParameter("pageNum");
			CommentDao cd = CommentDao.getInstance();
			int result = cd.delete(c_idx);
			
			request.setAttribute("b_idx", b_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redelete.jsp";
	}

}
