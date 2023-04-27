package recipe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;



public class RecipeBoardDao {
	private DBConnect dbconn;

	public RecipeBoardDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(RecipeBoardVo vo) {
		Connection conn = dbconn.conn();

		String sql = "insert into recipeboard values(seq_numplus.nextval,?,?,0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getMat());

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
	
	public void addCnt(int num) {
		Connection conn = dbconn.conn();
		String sql = "update recipeboard set cnt=cnt+1 where seq_num=?";
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
	
	public void addLikes(int num) {
		Connection conn = dbconn.conn();
		String sql = "update recipeboard set likes=likes+1 where seq_num=?";
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
	
	public ArrayList<RecipeBoardVo> selectAllcnt() {
		Connection conn = dbconn.conn();
		ArrayList<RecipeBoardVo> list = new ArrayList<RecipeBoardVo>();
		String sql = "select * from recipeboard order by cnt desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				list.add(new RecipeBoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
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
	
	public ArrayList<RecipeBoardVo> selectAlllikes() {
		Connection conn = dbconn.conn();
		ArrayList<RecipeBoardVo> list = new ArrayList<RecipeBoardVo>();
		String sql = "select * from recipeboard order by likes desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				list.add( new RecipeBoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
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
	
	public ArrayList<RecipeBoardVo> selectAllName() {
		Connection conn = dbconn.conn();
		ArrayList<RecipeBoardVo> list = new ArrayList<RecipeBoardVo>();
		String sql = "select seq_num, name, cnt, likes from recipeboard ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				list.add( new RecipeBoardVo(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
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
	
	public ArrayList<RecipeBoardVo> selectName(String name) {
		Connection conn = dbconn.conn();
		ArrayList<RecipeBoardVo> list = new ArrayList<RecipeBoardVo>();
		String sql = "select seq_num, name, cnt, likes from recipeboard where name like ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				list.add( new RecipeBoardVo(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
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
	
	public ArrayList<RecipeBoardVo> selectMat(String mat1, String mat2, String mat3) {
		Connection conn = dbconn.conn();
		ArrayList<RecipeBoardVo> list = new ArrayList<RecipeBoardVo>();
		String sql = "select seq_num, name, cnt, likes from recipeboard where mat like ? and mat like ? and mat like ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+mat1+"%");
			pstmt.setString(2, "%"+mat2+"%");
			pstmt.setString(3, "%"+mat3+"%");
			ResultSet rs = pstmt.executeQuery();// select 실행
			while (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				list.add( new RecipeBoardVo(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
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
	
	public void Update(RecipeBoardVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update recipeboard set name=?, mat=? where seq_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getMat());
			pstmt.setInt(3, vo.getSeq_num());
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
	
	public int selectcnt(int seq_num) {
		Connection conn = dbconn.conn();
		String sql = "select cnt from recipeboard where seq_num=?";
		int cnt  = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq_num);
			ResultSet rs = pstmt.executeQuery();// select 실행
			if (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
				cnt = rs.getInt(1);
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
		return cnt;
	}
	
}
