package ingredient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import foodmanage.FoodManageVo;

public class IngredientDao {
	
	private DBConnect dbconn;

	public IngredientDao() {
		dbconn = DBConnect.getInstance();
	}

	public ArrayList<IngredientVo> selectAll(){
		
		Connection conn = dbconn.conn();
		String sql = "select distinct * from ingredient join categories on cat_name=ig_cc order by ig_cc ";

		ArrayList<IngredientVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new IngredientVo(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getInt(8)));
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
	
	public IngredientVo selectByName(String name){
		
		Connection conn = dbconn.conn();
		String sql = "select * from ingredient join categories on cat_name=ig_cc where ig_name = ? order by ig_cc ";
		
		IngredientVo vo = new IngredientVo();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new IngredientVo(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getInt(8));
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
		return vo;
	}
	public ArrayList<IngredientVo> selectByMid(String name){
		
		Connection conn = dbconn.conn();
		String sql = "select * from ingredient join categories on cat_name=ig_cc where ig_cc = ? order by ig_cc ";
		ArrayList<IngredientVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new IngredientVo(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getInt(8)));
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
