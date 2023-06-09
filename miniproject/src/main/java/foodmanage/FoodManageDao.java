package foodmanage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class FoodManageDao {

	private DBConnect dbconn;

	public FoodManageDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(FoodManageVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into food_manage values (seq_fmnum.nextval,?,?,?,sysdate,to_date(?, 'yyyy-MM-dd'),null,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getIngredient());
			pstmt.setInt(3, vo.getCat_num());
			pstmt.setString(4, vo.getExpiredate_str());
			pstmt.setInt(5, vo.getAmount());
			pstmt.setString(6, vo.getMemo());
			int num = pstmt.executeUpdate();
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

	public void update(FoodManageVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update food_manage set amount =? where fm_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAmount());
			pstmt.setInt(2, vo.getCat_num());

			int num = pstmt.executeUpdate();
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

	public void delete(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete food_manage where fm_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int num2 = pstmt.executeUpdate();
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

	public FoodManageVo select(int num) {
		Connection conn = dbconn.conn();
		String sql = "select * from food_manage where fm_num = ?";
		FoodManageVo vo = new FoodManageVo();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new FoodManageVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5),
						rs.getDate(6), rs.getInt(7), rs.getInt(8), rs.getString(9));
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

	public ArrayList<FoodManageVo> selectAll() {
		Connection conn = dbconn.conn();
		String sql = "select * from food_manage";
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

	public ArrayList<FoodManageVo> selectByCategoies(int num) {
		Connection conn = dbconn.conn();
		String sql = "select * from f.food_manage c.categories where f.cat_num=c.cat_num and cat_num = ? order by dday";
		ArrayList<FoodManageVo> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
		
	

	public ArrayList<FoodManageVo> selectByName(String name) {

		Connection conn = dbconn.conn();
		String sql = "select * from food_manage where name like '%' || ? || '%' ";
		ArrayList<FoodManageVo> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
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

	public ArrayList<FoodManageVo> selectById(String id) {

		Connection conn = dbconn.conn();
		String sql = "select * from food_manage where id = ? ";
		ArrayList<FoodManageVo> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	public ArrayList<FoodManageVo> selectIngredient(int num) {
		Connection conn = dbconn.conn();
		String sql = "select f.ingredient from f.food_manage c.categories where f.cat_num=c.cat_num and cat_num = ? order by dday ";
		ArrayList<FoodManageVo> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
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
	
}
