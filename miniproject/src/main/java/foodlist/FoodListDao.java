package foodlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import foodmanage.FoodManageVo;

public class FoodListDao {

	private DBConnect dbconn;

	public FoodListDao() {
		dbconn = DBConnect.getInstance();
	}
	public ArrayList<FoodManageVo> selectAll(){
		Connection conn = dbconn.conn();
		String sql = "select * from food_manage order by status desc, expiredate desc";
		ArrayList<FoodManageVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new FoodManageVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
						rs.getDate(6), rs.getInt(7), rs.getInt(8), rs.getString(9)));
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
	
	// 카테고리별 검색
	public ArrayList<FoodManageVo> selectByCategories(int cat_num) {
		Connection conn = dbconn.conn();
		String sql = "select * from food_manage where cat_num = ?";
		ArrayList<FoodManageVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cat_num);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add( new FoodManageVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
						rs.getDate(6), rs.getInt(7), rs.getInt(8), rs.getString(9)));
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

	// 날짜 갱신
	public void updateToday() {
		
		Connection conn = dbconn.conn();
		String sql = "update food_manage set today = sysdate";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int num = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// 남은 날 확인
	public void checkDate(String id) {
		System.out.println("dao");
		Connection conn = dbconn.conn();
		String sql = "update food_manage set dday=expiredate-sysdate where id =? ";
		//String sql = "update food_manage set dday =round((expiredate-sysdate),0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			int num = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 

		}
	}

	// 3일전
		public ArrayList<FoodManageVo> ddayThree() {
			
			Connection conn = dbconn.conn();
			String sql = "select * from food_manage where dday<=3";
			ArrayList<FoodManageVo> list = new ArrayList<>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					list.add( new FoodManageVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
							rs.getDate(6), rs.getInt(7), rs.getInt(8), rs.getString(9)));
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
	
	// 7일전
	public ArrayList<FoodManageVo> ddaySeven() {
		
		Connection conn = dbconn.conn();
		String sql = "select * from food_manage where 3 < dday and Dday <=7";
		ArrayList<FoodManageVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add( new FoodManageVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
						rs.getDate(6), rs.getInt(7), rs.getInt(8), rs.getString(9)));
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
	
	//id별 리스트 뽑기
	public ArrayList<FoodManageVo> selectById(String id) {
		Connection conn = dbconn.conn();
		String sql = "select * from food_manage where id = ? order by dday";
		ArrayList<FoodManageVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add( new FoodManageVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
						rs.getDate(6), rs.getInt(7), rs.getInt(8), rs.getString(9)));
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
	
	public void updateAmount(int amount, int num ) {
		System.out.println("dao");
		Connection conn = dbconn.conn();
		String sql = "update food_manage set amount=? where fm_num =? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, num);

			int num2 = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 

		}
	}
}
