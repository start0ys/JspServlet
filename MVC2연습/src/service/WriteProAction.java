package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Board;
import dao.BoardDao;
import dao.UserDao;

public class WriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			
			int fileResult = 0;
			String filename = "";
			int maxSize = 5 * 1024 * 1024;
			String fileSave = "/fileSave";
			String realPath = request.getServletContext().getRealPath(fileSave);
			MultipartRequest multi = new MultipartRequest(request,realPath,	maxSize,"utf-8", 
					                                      new DefaultFileRenamePolicy());
			Enumeration<?> en = multi.getFileNames();
			while(en.hasMoreElements()) {
				//input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름m
				String filename1 = (String)en.nextElement(); 
				//서버에 저장된 파일 이름 
				filename = multi.getFilesystemName(filename1); 
				//전송전 원래의 파일 이름 
				String original = multi.getOriginalFileName(filename1);
				//전송된 파일의 내용 타입 
				String type = multi.getContentType(filename1); 
				//전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체생성 
				File file = multi.getFile(filename1);  
				
				fileResult = 1;
			}			
			String context = request.getContextPath();
			String file = context+"/"+"fileSave\\"+filename;
			request.setAttribute("file",file);
			System.out.println(file);
			
			
			
			
			//String b_img = null;
			//b_img = request.getParameter("file");
			//String b_img = request.getParameter("file");
			//if (b_img == null || b_img.equals("")) { b_img = null;}
			
			//System.out.println(b_img);
			
			Board board = new Board();
			if(fileResult == 1) {
				System.out.println("널아님");
				board.setB_img(filename);
			}
			board.setId(multi.getParameter("id"));
			board.setNickname(multi.getParameter("nickname"));
			board.setB_title(multi.getParameter("b_title"));
			board.setB_content(multi.getParameter("b_content"));
	
			
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.write(board);
			
			request.setAttribute("result", result);
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "writePro.jsp";
	}

}
