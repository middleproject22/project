package freelike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import conn.DBConnect;
import freeboard.FreeBoardVo;

public class FreeLikeDao {
	private DBConnect dbconn;
	
	public FreeLikeDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public class FreeLikeDao {
	    private DBConnection dbconn;

	    public FreeLikeDao() {
	        dbconn = new DBConnection();
	    }

	    public void add(FreeLikeVo vo) {
	        Connection conn = dbconn.conn();
	        String sql = "INSERT INTO free_like(fl_id, fb_num) VALUES(?, ?)";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, vo.getFl_id());
	            pstmt.setInt(2, vo.getFb_num());
	            int num = pstmt.executeUpdate();
	            System.out.println(num + " 줄이 추가됨");
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

	    public void delete(FreeLikeVo vo) {
	        Connection conn = dbconn.conn();
	        String sql = "DELETE FROM free_like WHERE fl_id=? AND fb_num=?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, vo.getFl_id());
	            pstmt.setInt(2, vo.getFb_num());
	            int num = pstmt.executeUpdate();
	            System.out.println(num + " 줄이 삭제됨");
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
	}
}
