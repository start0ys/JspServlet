package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import dao.UserDao;

public class JoinProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			int chk = Integer.parseInt(request.getParameter("sameChk"));
			if (chk == 0) {
				request.setAttribute("chk", chk);
				return "sameChk.jsp";
			}
			User user = new User();
			user.setId(request.getParameter("id"));
			user.setPassword(request.getParameter("password"));
			user.setName(request.getParameter("name"));
			user.setNickname(request.getParameter("nickname"));
			user.setEmail(request.getParameter("email"));
			user.setGender(request.getParameter("gender"));
			
			int result = UserDao.getInstance().join(user);	
			
			request.setAttribute("result", result);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "joinPro.jsp";
	}

}
