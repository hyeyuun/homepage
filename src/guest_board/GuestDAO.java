package guest_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class GuestDAO {
	public List<GuestVO> list(Map map){
		List<GuestVO> list = new ArrayList<>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  ");
		sql.append("  ");
		sql.append("  ");
		sql.append("  ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return list;
	}
	
	public int total(Map map){
		int total = 0;
		return total;
	}
}
