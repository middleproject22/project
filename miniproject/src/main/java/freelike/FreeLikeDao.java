package freelike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;

public class FreeLikeDao {
	private DBConnect dbconn;
	
	public FreeLikeDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(FreeLikeVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into free_like values(?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getFl_id());
			ps.setInt(2, vo.getFb_num());
			int num = ps.executeUpdate();
			System.out.println(num + " 줄 추가");
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
	
	//게시판 이름이 같고 좋아요 누른 사람이 둘다 같으면 삭제
	public void delete(FreeLikeVo vo) {
		Connection conn = dbconn.conn();
		String sql = "delete from free_like where fl_id=? and fb_num=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getFl_id());
			ps.setInt(2, vo.getFb_num());
			int num = ps.executeUpdate();
			System.out.println(num + " 줄 삭제");
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
	
	// 추천 개수
	public int selectLike(int board_num) {
		int num = 0;
		Connection conn = dbconn.conn();
		String sql = "select count(*) from free_like where fb_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	// 그 사람이 쓴건지 안쓴건지 체
	public FreeLikeVo selectByNum(int board_num, String id) {
		Connection conn = dbconn.conn();
		FreeLikeVo vo = null;
		String sql = "select * from free_like where fb_num=? and fl_id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("FreeLike Dao Test : "+rs.getString(1));
				System.out.println("FreeLike Dao Test2 : "+rs.getString(2));
				vo = new FreeLikeVo(rs.getString(1),rs.getInt(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
}