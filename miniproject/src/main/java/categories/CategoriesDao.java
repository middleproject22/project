package categories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class CategoriesDao {

	private DBConnect dbconn;

	public CategoriesDao() {
		dbconn = DBConnect.getInstance();
	}
	
	
	public ArrayList<CategoriesVo> selectCategories() {
		
		Connection conn = dbconn.conn();
		String sql = "select * from categories ";

		ArrayList<CategoriesVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new CategoriesVo(rs.getInt(1),rs.getString(2),rs.getString(3)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}	
		
	public int selectCat_num(String ingredient) {
		
		Connection conn = dbconn.conn();
		String sql = "select cat_num from categories join ingredient on cat_name=ig_cc where ig_name = ?";
		int num=0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ingredient);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt("cat_num");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return num;
		
	}	
	
	
		
		
	
	
	
	
	
	
}
