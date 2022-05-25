package cafe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class BrandDAO {
	private static BrandDAO instance = null;
	private BrandDAO() {}
	public static BrandDAO getInstance() {
		if(instance == null) {
			synchronized(BrandDAO.class) {
				instance = new BrandDAO();
			}
		} return instance;
	}

	
	public boolean insertBrand(String name) { 
		boolean ret = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into \"BRAND\" values (\"SEQ_BRAND\".nextval, ?, 1)";
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			int result = pstmt.executeUpdate();
			ret = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return ret;
	}
	
	public boolean updateCount(int number) {
		boolean ret = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update \"BRAND\" set \"COUNT\"=count+1 where \"NUMBER\"=?";
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			int result = pstmt.executeUpdate();
			ret = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return ret;
	}
	public boolean checkBrand(String name) {
		ArrayList<BrandVO> ls = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from \"BRAND\" where \"BRAND\"=?";
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BrandVO tmp = new BrandVO(
						rs.getInt("NUMBER"),
						rs.getString("BRAND"),
						rs.getInt("COUNT")
						);
				ls.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {try { rs.close(); } catch (SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return ls.isEmpty()? false:true;
		
	}
	
	public boolean checkBrand(int number) {
		ArrayList<BrandVO> ls = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from \"BRAND\" where \"NUMBER\"=?";
		
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BrandVO tmp = new BrandVO(
						rs.getInt("NUMBER"),
						rs.getString("BRAND"),
						rs.getInt("COUNT")
						);
				ls.add(tmp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {try { rs.close(); } catch (SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return ls.isEmpty()? false:true;
	}
	
	
	public List<BrandVO> selectAll(){

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BrandVO> brandList = null;
		String sql = "select \"NUMBER\", \"BRAND\", \"COUNT\" from \"BRAND\" ORDER BY \"NUMBER\"";
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				brandList = new ArrayList<BrandVO>();
				do {
					BrandVO brand = new BrandVO();
					brand.setNumber(rs.getInt("number"));
					brand.setBrand(rs.getString("brand"));
					brand.setCount(rs.getInt("count"));
					brandList.add(brand);
				} while(rs.next());			
			}
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
			if(rs != null) {try { rs.close(); } catch (SQLException e) {e.printStackTrace();}}
			if(pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		return (brandList.size()==0) ? null : brandList;
	}
	
	public int getListCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		
		try {
			conn = JdbcTemplate.getConnection();
			pstmt = conn.prepareStatement("select count(*) from BRAND");
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
