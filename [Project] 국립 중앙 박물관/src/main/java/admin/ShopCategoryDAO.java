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

public class ShopCategoryDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static ShopCategoryDAO scdao;
	
	public static ShopCategoryDAO getInstance() {
		if(scdao == null) {
			scdao = new ShopCategoryDAO();
		}
		return scdao;
	} //ShopCategoryDAO getInstance
	
	private ShopCategoryDAO() {
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
	} //ShopCategoryDAO 생성자
	
	public ArrayList<ShopCategoryDTO> getAllShopCategory() {
		
		ArrayList<ShopCategoryDTO> lists = new ArrayList<ShopCategoryDTO>();
		
		String sql = "select * from goodsCtgr";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ShopCategoryDTO sdto = new ShopCategoryDTO();
				
				sdto.setGcnum(rs.getInt("gcnum"));
				sdto.setGccode(rs.getString("gccode"));
				sdto.setGcname(rs.getString("gcname"));
				
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
		System.out.println("ShopCategory lists:"+lists);
		return lists;
	} //getAllShopCategory
	
	public int insertShopCategory(ShopCategoryDTO scdto) {
		
		String sql = "insert into goodsCtgr values(gcatseq.nextval,?,?)";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, scdto.getGccode());
			ps.setString(2, scdto.getGcname());
			
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
		
		System.out.println("insert ShopCategory cnt:"+cnt);
		return cnt;
	} //insertShopCategory
	
}
