package och12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class MemberDao {
	private static MemberDao instance;
	private MemberDao() {  }
	
	public static MemberDao getInstance() {
		if(instance==null) {
			instance = new MemberDao();
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
	
	public int check(String id, String passwd) throws SQLException {
		Connection conn = null ;
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet  rs  = null;
		String    sql  = "Select passwd from MEMBER2 where id =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs   = pstmt.executeQuery();
			if (rs.next()) {
				String dbPassword = rs.getString(1);
				if(dbPassword.equals(passwd)) result = 1;
				else                            result = 0;
				} else      result = -1;
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return result;
	}
	
	public int insert(Member member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into MEMBER2 values (?,?,?,?,?,sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getId());
			pstmt.setString(2,member.getPasswd());
			pstmt.setString(3,member.getName());
			pstmt.setString(4,member.getAddress());
			pstmt.setString(5,member.getTel());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	public List<Member> list() throws SQLException{
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet  rs  = null;
		String    sql  = "Select * from MEMBER2";
		List<Member> list = new ArrayList<Member>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs   = pstmt.executeQuery();
			if(rs.next()){
				do{
					Member member = new Member();
					member.setId(rs.getString(1));
					member.setPasswd(rs.getString(2));
					member.setName(rs.getString(3));
					member.setAddress(rs.getString(4));
					member.setTel(rs.getString(5));
					member.setReg_date(rs.getDate(6));
					list.add(member);
				} while(rs.next());
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return list;
	}
	
	public Member select(String id) throws SQLException {
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet  rs  = null;
		String    sql  = "Select * from MEMBER2 where id = ?";
		Member member = new Member();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs   = pstmt.executeQuery();
			if(rs.next()){
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setAddress(rs.getString(4));
				member.setTel(rs.getString(5));
				member.setReg_date(rs.getDate(6));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return member;
	
	}
	
	public int update(Member member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member2 set passwd=?,name=?,address=?,tel=? where id = ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getPasswd());
			pstmt.setString(2,member.getName());
			pstmt.setString(3,member.getAddress());
			pstmt.setString(4,member.getTel());
			pstmt.setString(5,member.getId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	public int delete(String id , String passwd) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		result = check(id, passwd);
		if(result != 1) return result;
		String sql = "delete from member2 where id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	public int confirm(String id) throws SQLException {
		Connection conn = null ;
		int result = 1;
		PreparedStatement pstmt = null;
		ResultSet  rs  = null;
		String    sql  = "Select id from MEMBER2 where id =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs   = pstmt.executeQuery();
			if (rs.next()) result = 1;
			else           result = 0;
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if ( rs   != null)  rs.close();
			if (pstmt  != null)  pstmt.close();
			if (conn  != null)  conn.close();
		}
		return result;
	}
	
}
