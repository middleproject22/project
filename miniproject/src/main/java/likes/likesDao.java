package likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class likesDao {
	private DBConnect dbconn;

	public likesDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(likesVo vo) {
		Connection conn = dbconn.conn();

		String sql = "insert into Rlikes values(?,?,1)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getSeq_num());

			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 추가되었다");
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
	
	public int addlikes(int num) {
		Connection conn = dbconn.conn();
		int likes = 0;
		String sql = "select sum(likes) as total_likes from Rlikes where seq_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				likes = rs.getInt(1);
			} 
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
		return likes;
	}
	
	public void selectAlllikes() {
		Connection conn = dbconn.conn();
		ArrayList<likesVo> list = new ArrayList<likesVo>();
		String sql = "SELECT SUM(likes) AS total_likes FROM Rlikes GROUP BY seq_num ORDER BY total_likes DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				list.add(new likesVo(rs.getString(1), rs.getInt(2)));
			} 
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
	
	public ArrayList<likesVo> Maxlikes() {
	      Connection conn = dbconn.conn();
	      ArrayList<likesVo> list = new ArrayList<likesVo>();
	      String sql = "SELECT seq_num, total_likes from (SELECT seq_num, SUM(likes) AS total_likes FROM Rlikes GROUP BY seq_num ORDER BY total_likes DESC) where rownum <=3";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery();
	         while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
	            list.add(new likesVo(rs.getInt(1), rs.getInt(2)));
	         } 
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
	      }return list;
	   }
	
	public boolean searchIdNum(String id, int seq_num) {
		Connection conn = dbconn.conn();
		String sql = "select * from Rlikes where id=? and seq_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, seq_num);
			ResultSet rs =  pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
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
		return false;
	}	
	
}