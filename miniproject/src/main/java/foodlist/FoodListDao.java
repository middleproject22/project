package foodlist;

import java.sql.Connection;
import java.sql.Date;
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
	public ArrayList<FoodManageVo> selectByCategories(String id, int cat_lnum) {
		Connection conn = dbconn.conn();
		String sql = "select * from categories c, food_manage f where id=? and f.cat_num = c.cat_num and c.cat_lnum = ? order by dday";
		ArrayList<FoodManageVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setInt(2, cat_lnum);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				
				list.add( new FoodManageVo(rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(1),rs.getDate(8),rs.getDate(9),rs.getInt(10),
						rs.getInt(11),rs.getString(12),rs.getInt(3)));
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
		public int ddayThree(String id) {
			
			Connection conn = dbconn.conn();
			String sql = "select count(*) from food_manage where dday<=3 and id=?";
			int count=0;
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
			    count = rs.getInt(1);			

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return count;

		}
	
	// 3~7일전
	public int ddaySeven(String id) {
		
		Connection conn = dbconn.conn();
		String sql = "select count(*) from food_manage where 3 < dday and Dday <=7 and id= ?";
		int count=0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
		    count = rs.getInt(1);			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;

	}
	
	//7일 이상 남은 식품
	public int ddayetc(String id) {
		
		Connection conn = dbconn.conn();
		String sql = "select count(*) from food_manage where dday>7 and id=?";
		ArrayList<FoodManageVo> list = new ArrayList<>();
		int count=0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
		    count = rs.getInt(1);			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;

	}
	
	//전체 식품 개수 구하기
	public int ddayAll(String id) {
		Connection conn = dbconn.conn();
		String sql = "select count(*) from food_manage where id= ?";
		int count=0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
		    count = rs.getInt(1);
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
		return count;

	}
	
	//id별 리스트 뽑기
	public ArrayList<FoodManageVo> selectById(String id) {
		Connection conn = dbconn.conn();
		String sql = "select fm_num, id, ingredient, f.cat_num, today, expiredate, dday,amount,memo,cat_lnum from food_manage f, categories c where id = ? and f.cat_num=c.cat_num order by dday";
		ArrayList<FoodManageVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			
			
			while (rs.next()) {
				list.add( new FoodManageVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
						rs.getDate(6), rs.getInt(7), rs.getInt(8), rs.getString(9),rs.getInt(10)));
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
