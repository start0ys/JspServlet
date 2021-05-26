package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

public class SameChkAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			UserDao ud = UserDao.getInstance();
			if (ud.samechk(id)){
				request.setAttribute("result", 1);
			}else {
				request.setAttribute("result", 0);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "sameChk.jsp";
	}

}
