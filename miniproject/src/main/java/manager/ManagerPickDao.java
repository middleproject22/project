package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class ManagerPickDao {
	private DBConnect dbconn;
	
	public ManagerPickDao() {
		dbconn = DBConnect.getInstance();
		
	}
	
	public void insert(ManagerPickVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into managerpick values(seq_mnum.nextval,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getSeqnum());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getImgpath());
			
			int num = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<ManagerPickVo> selectAll() {
		ArrayList<ManagerPickVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from managerpick";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new ManagerPickVo(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}return list;
		
	}
	
	public ManagerPickVo selectByNum(int seqnum) {
		ManagerPickVo vo = new ManagerPickVo();
		Connection conn = dbconn.conn();
		String sql = "select * from managerpick where seq_num =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seqnum);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new ManagerPickVo(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}return vo;
	}
	
	public void delete(int seqnum) {
		Connection conn = dbconn.conn();
		String sql = "delete from managerpick where seq_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seqnum);
			
			int num = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public ArrayList<ManagerPickVo> selectIndexImg() {
		ArrayList<ManagerPickVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from (select * from managerpick order by num desc)where rownum <=3";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new ManagerPickVo(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}return list;
		
	}
}
