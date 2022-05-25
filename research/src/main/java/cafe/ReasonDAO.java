package cafe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ReasonDAO {
	private static ReasonDAO instance = null;
	private ReasonDAO() {}
	public static ReasonDAO getInstance() {
		if(instance == null) {
			synchronized(ReasonDAO.class) {
				instance = new ReasonDAO();
			}
		}return instance;
	}
	
	public boolean updateReason(int number, int coffee_number) {
		boolean ret = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update \"REASON\" set \"COUNT\"=count+1 where \"NUMBER\"=? and \"COFFEE_NUMBER\"=?";
		
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setInt(2, coffee_number);
			int result = pstmt.executeUpdate();
			//System.out.println("����");
			ret = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return ret;
	}
	
	public boolean checkReason(int number) {
		ArrayList<ReasonVO> ls = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from \"REASON\" where \"NUMBER\"=?";
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReasonVO tmp = new ReasonVO (
						rs.getInt("NUMBER"),
						rs.getString("REASON"),
						rs.getInt("COUNT"),
						rs.getInt("COFFEE_NUMBER")
						);
				ls.add(tmp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return ls.isEmpty()? false:true;
	}
	
	public List<ReasonVO> selectAll(int coffee_number) {
		ArrayList<ReasonVO> ls = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select \"NUMBER\", \"REASON\", \"COUNT\", \"COFFEE_NUMBER\" from \"REASON\" where \"COFFEE_NUMBER\"=?";
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coffee_number);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				ReasonVO tmp = new ReasonVO(
						rs.getInt("NUMBER"),
						rs.getString("REASON"),
						rs.getInt("COUNT"),
						rs.getInt("COFFEE_NUMBER")
						);
				
				ls.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return (ls.size()==0) ? null : ls;
	}
	
	public Map<String,String> showPer(int coffee_number) {
		HashMap<String,String> hm = new HashMap<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select \"REASON\", ROUND(RATIO_TO_REPORT(count) over(),2) * 100 || '%' as COUNT_RATIO from \"REASON\" where \"COFFEE_NUMBER\"=?";
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, coffee_number);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				hm.put(rs.getString("REASON"), rs.getString("COUNT_RATIO"));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return (hm.size()==0) ? null : hm;	
	}
	
	public int getListCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement("select count(*) from REASON");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {try { rs.close(); } catch (SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return x;
	}
}
