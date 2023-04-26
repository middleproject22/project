package userimg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class UserImgDao {
	private DBConnect dbconn;
	
	public UserImgDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public ArrayList<UserImgVo> selectAll(){
		ArrayList<UserImgVo> list = new ArrayList<>();
		Connection conn = dbconn.conn();
		String sql = "select * from userimg";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String imgpath = rs.getString(1);
				
				UserImgVo vo = new UserImgVo(imgpath);
				
				list.add(vo);
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
