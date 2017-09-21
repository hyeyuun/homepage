package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import utility.DBClose;
import utility.DBOpen;

public class MemberDAO {
	public boolean create(MemberVO vo){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into home_member (id,passwd,mname,tel,email,zipcode, ");
		sql.append(" address1,address2,job,mdate,fname,grade) ");
		sql.append(" values ");
		sql.append(" (?,?,?,?,?, ");
		sql.append(" ?,?,?,?,sysdate,?,'H') ");             
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getMname());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getZipcode());
			pstmt.setString(7, vo.getAddress1());
			pstmt.setString(8, vo.getAddress2());
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getFname());
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
	public boolean duplicateEmail(String email){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(email) as cnt ");
		sql.append(" from home_member ");
		sql.append(" where email = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			if(cnt > 0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return flag;
	}
	
	public boolean duplicateId(String id){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) as cnt ");
		sql.append(" from home_member ");
		sql.append(" where id = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			if(cnt > 0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return flag;
	}
	public String getFname(String id){
		String fname = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select fname ");
		sql.append(" from home_member ");
		sql.append(" where id = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				fname = rs.getString("fname");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return fname;
	}
	public String getGrade(String id){
		String grade = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade ");
		sql.append(" from home_member ");
		sql.append(" where id = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				grade = rs.getString("grade");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return grade;
	}
	public boolean loginCheck(Map map){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = (String)map.get("id");
		String passwd = (String)map.get("passwd");
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*)  ");
		sql.append(" from home_member ");
		sql.append(" where id = ? and passwd = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt > 0) flag = true; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return flag;
	}
	
	public boolean delete(String id){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from home_member ");
		sql.append(" where id = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con,pstmt);
		}
		return flag;
	}
	public boolean update(MemberVO vo){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update home_member ");
		sql.append(" set tel = ?, ");
		sql.append("  	 email = ?, ");
		sql.append("  	 zipcode = ?, ");
		sql.append("  	 address1 = ?, ");
		sql.append("  	 address2 = ?, ");
		sql.append("  	 job = ?, ");
		sql.append("  	 passwd = ?, ");
		sql.append("  	 fname = ? ");
		sql.append(" where id = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getTel());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getZipcode());
			pstmt.setString(4, vo.getAddress1());
			pstmt.setString(5, vo.getAddress2());
			pstmt.setString(6, vo.getJob());
			pstmt.setString(7, vo.getPasswd());
			pstmt.setString(8, vo.getFname());
			pstmt.setString(9, vo.getId());
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con,pstmt);
		}
		return flag;
	}
	public boolean updatePw(Map map){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update home_member ");
		sql.append(" set passwd = ? ");
		sql.append(" where id = ? ");
		String id = (String)map.get("id");
		String passwd = (String)map.get("passwd");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con,pstmt);
		}
		return flag;
	}
	public boolean updateFile(Map map){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update home_member ");
		sql.append(" set fname = ? ");
		sql.append(" where id = ? ");
		String id = (String)map.get("id");
		String fname = (String)map.get("fname");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con,pstmt);
		}
		return flag;                    
	}
	public MemberVO read(String id){
		MemberVO vo = new MemberVO();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT *  ");
		sql.append(" FROM home_member   ");
		sql.append(" WHERE id= ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setId(rs.getString("id"));
				vo.setMname(rs.getString("mname"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setJob(rs.getString("job"));
				vo.setMdate(rs.getString("mdate"));
				vo.setFname(rs.getString("fname"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress1(rs.getString("address1"));
				vo.setAddress2(rs.getString("address2"));
				vo.setGrade(rs.getString("grade"));
				vo.setPasswd(rs.getString("passwd"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return vo;
	}
	public int total(Map map){
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int total = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from home_member ");
		if(word.trim().length() > 0){
			sql.append(" where "+col+" like '%'||?||'%' ");
		}
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length() > 0){
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return total;
	}
	public List<MemberVO> list(Map map){
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (int)map.get("sno");
		int eno = (int)map.get("eno");
		List<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT id, mname, tel, email, job, mdate, fname,r ");
		sql.append(" from( ");
		sql.append(" 	SELECT id, mname, tel, email, job, mdate, fname,rownum as r ");
		sql.append(" 	from(  ");
		sql.append(" 		SELECT id, mname, tel, email, job, mdate, fname ");
		sql.append(" 		FROM home_member ");
		if(word.trim().length() > 0){
			sql.append(" 		WHERE "+ col+" like '%'||?||'%' ");
		}
		sql.append(" 		ORDER BY mdate DESC ");
		sql.append(" 	)	 ");
		sql.append(" ) where r > = ? and r < = ? ");
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length() > 0){
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setMname(rs.getString("mname"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setJob(rs.getString("job"));
				vo.setMdate(rs.getString("mdate"));
				vo.setFname(rs.getString("fname"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}
}
