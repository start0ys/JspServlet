package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("WriteFormAction Start..");
		try {
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null ) pageNum = "1";
			request.setAttribute("pageNum", pageNum);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "writeForm.jsp";
	}

}
