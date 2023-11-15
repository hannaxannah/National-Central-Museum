package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ShopDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static ShopDAO sdao;
	
	public static ShopDAO getInstance() {
		if(sdao == null) {
			sdao = new ShopDAO();
		}
		return sdao;
	} //ShopDAO getInstance
	
	private ShopDAO() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	} //ShopDAO 생성자
	
	public ArrayList<ShopDTO> getAllGoods() {
		
		ArrayList<ShopDTO> lists = new ArrayList<ShopDTO>();
		
		String sql = "select gnum, gname, gcategory, gcode, gposter, gprice, "
					+ "gqty, ginfor from goods order by gnum";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ShopDTO sdto = new ShopDTO();
				
				sdto.setGnum(rs.getInt("gnum"));
				sdto.setGname(rs.getString("gname"));
				sdto.setGcategory(rs.getString("gcategory"));
				sdto.setGcode(rs.getString("gcode"));
				sdto.setGposter(rs.getString("gposter"));
				sdto.setGprice(rs.getString("gprice"));
				sdto.setGqty(rs.getInt("gqty"));
				sdto.setGinfor(rs.getString("ginfor"));
				
				lists.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		System.out.println("shop lists");
		return lists;
	} //getAllGoods
	
	public int insertGoods(MultipartRequest mr) {
		
		String sql = "insert into goods values(gseq.nextval,?,?,?,?,?,?,?)";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, mr.getParameter("gname"));
			ps.setString(2, mr.getParameter("gcategory"));
			ps.setString(3, mr.getParameter("gcode"));
			ps.setString(4, mr.getOriginalFileName("gposter"));
			ps.setString(5, mr.getParameter("gprice"));
			ps.setInt(6, Integer.parseInt(mr.getParameter("gqty")));
			ps.setString(7, mr.getParameter("ginfor"));
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("insert Shop cnt:"+cnt);
		return cnt;
	} //insertGoods
	
	
	public ShopDTO getGoodsByNum(String gnum) {
		
		String sql = "select * from goods where gnum=?";
		
		ShopDTO sdto = null;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, Integer.parseInt(gnum));
			
			rs = ps.executeQuery();
			if(rs.next()) {
				sdto = new ShopDTO();
				
				sdto.setGnum(rs.getInt("gnum"));
				sdto.setGname(rs.getString("gname"));
				sdto.setGcategory(rs.getString("gcategory"));
				sdto.setGcode(rs.getString("gcode"));
				sdto.setGposter(rs.getString("gposter"));
				sdto.setGprice(rs.getString("gprice"));
				sdto.setGqty(rs.getInt("gqty"));
				sdto.setGinfor(rs.getString("ginfor"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		System.out.println("getGoodsByNum");
		return sdto;
	} //getGoodsByNum
	
	public int updateGoods(MultipartRequest mr, String img) {
		
		String sql = "update goods set gname=?, gcategory=?, gcode=?, gposter=?, gprice=?, "
					+"gqty=?, ginfor=? where gnum=?";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mr.getParameter("gname"));
			ps.setString(2, mr.getParameter("gcategory"));
			ps.setString(3, mr.getParameter("gcode"));
			ps.setString(4, img);
			ps.setString(5, mr.getParameter("gprice"));
			ps.setString(6, mr.getParameter("gqty"));
			ps.setString(7, mr.getParameter("ginfor"));
			ps.setString(8, mr.getParameter("gnum"));
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		System.out.println("update Goods cnt:"+cnt);
		return cnt;
	} //updateGoods
	
	public ArrayList<ShopDTO> getGoodsByCtgr(String gcategory) {
		
		ArrayList<ShopDTO> lists = new ArrayList<ShopDTO>();
		
		String sql = "select * from goods where gcategory=? order by gnum";
		
		ShopDTO sdto = null;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, gcategory);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				sdto = new ShopDTO();
				
				sdto.setGnum(rs.getInt("gnum"));
				sdto.setGname(rs.getString("gname"));
				sdto.setGcategory(rs.getString("gcategory"));
				sdto.setGcode(rs.getString("gcode"));
				sdto.setGposter(rs.getString("gposter"));
				sdto.setGprice(rs.getString("gprice"));
				sdto.setGqty(rs.getInt("gqty"));
				sdto.setGinfor(rs.getString("ginfor"));
				
				lists.add(sdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		System.out.println("getGoodsByCtgr");
		return lists;
	} //getGoodsByCtgr
	
	public int deleteCheckData(String[] num) {
		String sql = "delete from goods where gnum=?";
		for(int i=0;i<num.length-1;i++) {

			sql += " or gnum=?";
		}

		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);

			for(int i=0;i<num.length;i++) {
				ps.setString(i+1, num[i]);
			}

			cnt = ps.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null)
					conn.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("cnt:"+cnt);
		return cnt;
	} //deleteCheckData
	
	public int deleteGoods(String num) {

		String sql = "delete from student where gnum=?";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, Integer.parseInt(num));

			cnt = ps.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null)
					conn.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		System.out.println("deleteGoods cnt:"+cnt);

		return cnt;
	} //deleteGoods
}
