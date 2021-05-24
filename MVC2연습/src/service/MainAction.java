package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String M_nickname = request.getParameter("M_nickname");
			request.setAttribute("M_nickname", M_nickname);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "main.jsp";
	}

}
