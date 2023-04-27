package freecomment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import freeboard.FreeBoardVo;

public class FreeCommentDao {
	private DBConnect dbconn;

	public FreeCommentDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(FreeCommentVo vo) {
		Connection conn = dbconn.conn();

		String sql = "insert into free_comment values(seq_fcnum.nextval,?,?, ?, sysdate)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getFc_id());
			pstmt.setInt(2, vo.getFb_num());
			pstmt.setString(3, vo.getFc_content());
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

	public ArrayList<FreeCommentVo> select(int num) {
		ArrayList<FreeCommentVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from free_comment where fb_num=? order by fc_num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {
				FreeCommentVo vo = new FreeCommentVo(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDate(5));
				list.add(vo);
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
		return list;
	}

	public void delete(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete from free_comment where fc_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int num2 = pstmt.executeUpdate();
			System.out.println(num2 + " 줄이 삭제됨");
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
	
	public ArrayList<FreeCommentVo> selectAll() {
		Connection conn = dbconn.conn();
		String sql = "select * from free_board order by fb_num desc";
		ArrayList<FreeCommentVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new FreeCommentVo(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDate(5)));
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
		return list;
	}

}
