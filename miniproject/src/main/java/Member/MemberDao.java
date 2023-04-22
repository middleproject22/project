package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class MemberDao {
	private DBConnect dbconn;

	public MemberDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(MemberVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into member values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhonenum());
			pstmt.setString(5, vo.getPhonenum());
			pstmt.setString(6, vo.getImgpath());
			pstmt.setInt(7, vo.getManagenum());

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
	
	
	public MemberVo SelectByPnum(String pnum) {
		MemberVo vo = null;
		Connection conn = dbconn.conn();
		String sql = "select * from member where phonenum =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String id1 = rs.getString(1);
				String pwd = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String phonenum = rs.getString(5);
				String imgpath = rs.getString(6);
				int managenum = rs.getInt(7);

				vo = new MemberVo(id1, pwd, name, email, phonenum, imgpath, managenum);
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
		return vo;

	}
	
	public MemberVo SelectById(String id) {
		MemberVo vo = null;
		Connection conn = dbconn.conn();
		String sql = "select * from member where id =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String id1 = rs.getString(1);
				String pwd = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String phonenum = rs.getString(5);
				String imgpath = rs.getString(6);
				int managenum = rs.getInt(7);

				vo = new MemberVo(id1, pwd, name, email, phonenum, imgpath, managenum);
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
		return vo;

	}

	public void updatePwd(String pwd, String id) {
		Connection conn = dbconn.conn();
		String sql = "update member set pwd = ? where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);

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

	public void updateImgPath(String imgpath, String id) {
		Connection conn = dbconn.conn();
		String sql = "update member set imgpath = ? where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, imgpath);
			pstmt.setString(2, id);

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

	public ArrayList<MemberVo> selectAll() {
		ArrayList<MemberVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from member";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String pwd = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String phonenum = rs.getString(5);
				String imgpath = rs.getString(6);
				int managenum = rs.getInt(7);

				MemberVo vo = new MemberVo(id, pwd, name, email, phonenum, imgpath, managenum);

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
		}return list;
	}

	public void delete(String id) {
		Connection conn = dbconn.conn();
		String sql = "delete member where id =?";
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
}
