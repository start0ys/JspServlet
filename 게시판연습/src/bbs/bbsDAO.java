package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class bbsDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private int result = 0;
	
	public bbsDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int getNext() throws SQLException {
		Connection conn = null;
		String sql = "select b_idx from bbs order by b_idx desc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("b_idx") + 1;
			}
			return 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return -1;
	}
	
	public int write(String b_title, String nickname, String b_content ) throws SQLException {
		String sql = "insert into bbs values(?,?,?,sysdate,?,?,?)";
		int next = getNext();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, next);
			pstmt.setString(2, b_title);
			pstmt.setString(3, nickname);
			pstmt.setString(4, b_content);
			pstmt.setInt(5, 0);
			pstmt.setString(6, "");
			result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return -1;
	}
	
	public ArrayList<bbsDTO> bbsList (int pages) throws SQLException {
		Connection conn = null;
		String sql = "select b_title,nickname,b_regdate,b_count,b_idx from bbs where b_idx < ? and rownum <= 10 order by b_idx desc ";
		ArrayList<bbsDTO> list = new ArrayList<bbsDTO>();
		int next = getNext();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, next - (pages - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()){
				do{
					bbsDTO bbsdto = new bbsDTO();
					bbsdto.setB_title(rs.getString(1));
					bbsdto.setNickname(rs.getString(2));
					bbsdto.setB_regdate(rs.getDate(3));
					bbsdto.setB_count(rs.getInt(4));
					bbsdto.setB_idx(rs.getInt(5));
					list.add(bbsdto);
					
				} while(rs.next());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return list;
	}
	
	public boolean nextPage(int pages) throws SQLException {
		Connection conn = null;
		String sql = "select * from bbs where b_idx < ? and rownum <= 10 order by b_idx desc";
		int next = getNext();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, next - (pages - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()){
				System.out.println("dz");
				return true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return false;
	
	}
	
	public bbsDTO bbs (int b_idx) throws SQLException {
		Connection conn = null;
		bbsDTO bbs = new bbsDTO();
		String sql = "select * from bbs where b_idx = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bbs.setB_title(rs.getNString("b_title"));
				bbs.setNickname(rs.getNString("nickname"));
				bbs.setB_regdate(rs.getDate("b_regdate"));
				bbs.setB_content(rs.getNString("b_content"));
				bbs.setB_count(rs.getInt("b_count"));
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return bbs;
	}
	
	public void countUp (int b_idx) throws SQLException {
		String sql = "update bbs set b_count = b_count + 1 where b_idx = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
	}
	
	
}
