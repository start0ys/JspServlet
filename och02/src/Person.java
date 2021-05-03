

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Person
 */
@WebServlet("/Person")
public class Person extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Person() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name      = request.getParameter("name");
		String id        = request.getParameter("id");
		String password  = request.getParameter("password");
		String gender    = request.getParameter("gender");
		String [] notice = request.getParameterValues("notice");
		String job       = request.getParameter("job");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h1>개인정보</h1>");
		out.printf("이름 : %s <br>",name);
		out.printf("아이디 : %s <br>",id);
		out.printf("암호 : %s <br>",password);
		out.printf("성별 : %s <br>",gender);
		out.print("수신메일 : ");
		for(int i=0; i < notice.length; i++) {
			out.print(notice[i]);
			out.print(" ");
		}
		out.printf("<br>직업 : %s <br>",job);
		out.println("</body></html>");
	}

}
