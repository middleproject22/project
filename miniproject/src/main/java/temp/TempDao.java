package temp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import foodmanage.FoodManageVo;

public class TempDao {
	
	
	private DBConnect dbconn;
	
	public TempDao() {
		dbconn = DBConnect.getInstance();
	}
	
	
	public void insert(TempVo vo) {
		
		Connection conn = dbconn.conn();
		String sql = "insert into temp values (?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getIngredient());
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄이 추가되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void delete(String ingredient) {
		
		Connection conn = dbconn.conn();
		String sql = "delete from temp where ingredient = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ingredient);
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄이 삭제되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	public void deleteAll() {
		
		Connection conn = dbconn.conn();
		String sql = "delete from temp ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int num = pstmt.executeUpdate();
			System.out.println(num + "줄이 삭제삭제삭제되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public ArrayList<TempVo> select(){
		Connection conn = dbconn.conn();
		String sql = "select * from Temp";
		ArrayList<TempVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new TempVo(rs.getString(1), rs.getString(2)));
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
