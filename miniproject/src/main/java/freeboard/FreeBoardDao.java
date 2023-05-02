package freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class FreeBoardDao {
	private DBConnect dbconn;

	public FreeBoardDao() {
		dbconn = DBConnect.getInstance();
	}

	// 글번호로 검색
	public FreeBoardVo select(int num) {
		Connection conn = dbconn.conn();
		String sql = "select * from free_board where fb_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();// select 실행
			if (rs.next()) {
				return new FreeBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7));
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
		return null;
	}

	// 원글 모두 검색
	public ArrayList<FreeBoardVo> selectAll() {
		Connection conn = dbconn.conn();
		String sql = "select * from free_board order by fb_num desc";
		ArrayList<FreeBoardVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new FreeBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7)));
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

	// 원글 작성
	public void insert(FreeBoardVo vo) {
		Connection conn = dbconn.conn();

		String sql = "insert into free_board values(seq_fbnum.nextval, ?, sysdate, ?, ?, ?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getCnt());
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

	// update: 글번호로 찾아서 title, content를 새 값으로 수정
	public void update(FreeBoardVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update free_board set title=?, content=? where fb_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getFb_num());
			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 수정됨");
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

	// delete: 글번호로 찾아서 삭제
	public void delete(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete from free_board where fb_num=?";
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

	public void cnt(int num) {
		Connection conn = dbconn.conn();
		String sql = "update free_board set cnt=cnt+1 where fb_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int num1 = pstmt.executeUpdate();
			System.out.println(num1 + " 줄이 수정됨");
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

	public FreeBoardVo page() {
		Connection conn = dbconn.conn();
		String sql = "select * from(select * from free_board) order by fb_num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();// select 실행
			if (rs.next()) {
				return new FreeBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7));
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
		return null;
	}

	public ArrayList<FreeBoardVo> selectByTitle(String title) {
		ArrayList<FreeBoardVo> list = new ArrayList<FreeBoardVo>();
		Connection conn = dbconn.conn();
		String sql = "select * from free_board where title like ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + title + "%");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new FreeBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7)));
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

	public ArrayList<FreeBoardVo> selectById(String id) {
		ArrayList<FreeBoardVo> list = new ArrayList<FreeBoardVo>();
		Connection conn = dbconn.conn();
		String sql = "select * from free_board where id like ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + id + "%");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new FreeBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7)));
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
	
	public void updateLikes(int likenum,int fb_num) {
		Connection conn = dbconn.conn();
		String sql = "update free_board set likes=? where fb_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likenum);
			pstmt.setInt(2, fb_num);
			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 수정됨");
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
	
	public ArrayList<FreeBoardVo> selectByLikes() {
		Connection conn = dbconn.conn();
		String sql = "select * from free_board order by likes desc";
		ArrayList<FreeBoardVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new FreeBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7)));
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
