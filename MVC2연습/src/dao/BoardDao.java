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

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() { }
	
	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
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
	
	public int write(Board board ) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql1 = "select nvl(max(b_idx),0) + 1 from board";
		String sql = "insert into board values(?,?,?,?,sysdate,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1);
			rs.close();
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2,board.getId() );
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getNickname());
			pstmt.setString(5, board.getB_content());
			pstmt.setInt(6, board.getB_count());
			pstmt.setString(7, board.getB_img());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if ( rs   != null)  rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	public void readCount(int b_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		String sql = "update board set b_count = b_count + 1 where b_idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,b_idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
	}
	
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from board ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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
	
	public List<Board> list (int startRow, int endRow) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from "
								+ "(select rownum rn, a.* from "
																+ "(select * from board order by b_idx desc) a )"
								+ " where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()){
				do{
					Board board = new Board();
					board.setB_idx(rs.getInt("b_idx"));
					board.setId(rs.getString("id"));
					board.setB_title(rs.getString("b_title"));
					board.setNickname(rs.getString("nickname"));
					board.setB_regdate(rs.getDate("b_regdate"));
					board.setB_content(rs.getString("b_content"));
					board.setB_count(rs.getInt("b_count"));
					board.setB_img(rs.getString("b_img"));
					list.add(board);
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
	
	public Board select(int b_idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = new Board();
		String sql = "select * from board where b_idx = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				board.setB_idx(rs.getInt("b_idx"));
				board.setId(rs.getString("id"));
				board.setB_title(rs.getString("b_title"));
				board.setNickname(rs.getString("nickname"));
				board.setB_regdate(rs.getDate("b_regdate"));
				board.setB_content(rs.getString("b_content"));
				board.setB_count(rs.getInt("b_count"));
				board.setB_img(rs.getString("b_img"));
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return board;
	}
}
