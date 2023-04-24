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
		
		
		
	
	
	
	
	
	
}
