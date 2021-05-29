package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDao {
	private static CommentDao instance;
	private CommentDao() { }
	
	public static CommentDao getInstance() {
		if(instance == null) {
			instance = new CommentDao();
		}
		return instance;
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
	
	public int insert(Comment comment) throws SQLException {
		int c_idx = comment.getC_idx();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql1 = "select nvl(max(c_idx),0) + 1 from comment1";
		String sql  = "insert into comment1 values(?,?,?,sysdate,?,?,?,?,?)";
		String sql2 = "update comment1 set re_step = re_step + 1 where ref = ? and re_step > ?"; 
		try {
			conn = getConnection();
			if(c_idx != 0) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, comment.getRef());
				pstmt.setInt(2, comment.getRe_step());
				pstmt.executeUpdate();
				pstmt.close();
				comment.setRe_step(comment.getRe_step() + 1);
				comment.setRe_level(comment.getRe_level() + 1);
			}
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1);
			rs.close();
			pstmt.close();
			if(c_idx==0) comment.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getB_idx());
			pstmt.setString(2, comment.getId());
			pstmt.setString(3, comment.getNickname());
			pstmt.setString(4, comment.getC_content());
			pstmt.setInt(5, number);
			pstmt.setInt(6, comment.getRef());
			pstmt.setInt(7, comment.getRe_step());
			pstmt.setInt(8, comment.getRe_level());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if ( rs   != null)  rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	public Comment select(int c_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Comment comment = new Comment();
		String sql = "select * from comment1 where c_idx = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				comment.setB_idx(rs.getInt("b_idx"));
				comment.setId(rs.getString("id"));
				comment.setNickname(rs.getString("nickname"));
				comment.setC_regdate(rs.getDate("c_regdate"));
				comment.setC_content(rs.getString("c_content"));
				comment.setC_idx(rs.getInt("c_idx"));
				comment.setRef(rs.getInt("ref"));
				comment.setRe_step(rs.getInt("re_step"));
				comment.setRe_level(rs.getInt("re_level"));
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return comment;
	}
	
	
	/////////////////////////////////////////////////////////////
	
	public int getTotalCnt(int b_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from comment1 where b_idx = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				tot = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return tot;
	}
	
	public List<Comment> list (int b_idx) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		String sql = "select * from comment1 where b_idx = ? order by ref asc,re_step";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				do{
					Comment comment = new Comment();
					comment.setB_idx(rs.getInt("b_idx"));
					comment.setId(rs.getString("id"));
					comment.setNickname(rs.getString("nickname"));
					comment.setC_regdate(rs.getDate("c_regdate"));
					comment.setC_content(rs.getString("c_content"));
					comment.setC_idx(rs.getInt("c_idx"));
					comment.setRef(rs.getInt("ref"));
					comment.setRe_step(rs.getInt("re_step"));
					comment.setRe_level(rs.getInt("re_level"));
					list.add(comment);
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
	
	public int delete(int c_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from comment1 where c_idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			result = pstmt.executeUpdate();					
		
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	
	
	
}
