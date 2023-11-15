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

public class ExhCategoryDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static ExhCategoryDAO ecdao;
	
	public static ExhCategoryDAO getInstance() {
		if(ecdao == null) {
			ecdao = new ExhCategoryDAO();
		}
		return ecdao;
	} //ExhCategoryDAO getInstance
	
	private ExhCategoryDAO() {
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
	} //ExhCategoryDAO 생성자
	
	public ArrayList<ExhCategoryDTO> getAllExhCategory() {
		
		ArrayList<ExhCategoryDTO> lists = new ArrayList<ExhCategoryDTO>();
		
		String sql = "select * from exhibitionCtgr";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ExhCategoryDTO ecdto = new ExhCategoryDTO();
				
				ecdto.setCnum(rs.getInt("cnum"));
				ecdto.setCcode(rs.getString("ccode"));
				ecdto.setCname(rs.getString("cname"));
				
				lists.add(ecdto);
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
		System.out.println("ExhCategory lists:"+lists);
		return lists;
	} //getAllExhCategory
	
}
