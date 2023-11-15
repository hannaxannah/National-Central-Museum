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

public class ExhibitionDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static ExhibitionDAO edao;
	
	public static ExhibitionDAO getInstance() {
		if(edao == null) {
			edao = new ExhibitionDAO();
		}
		return edao;
	} //ExhibitionDAO getInstance
	
	private ExhibitionDAO() {
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
	} //ExhibitionDAO 생성자
	
	public ArrayList<ExhibitionDTO> getAllExhibition() {
		
		ArrayList<ExhibitionDTO> lists = new ArrayList<ExhibitionDTO>();
		
		String sql = "select * from exhibition order by enum";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ExhibitionDTO edto = new ExhibitionDTO();
				
				edto.setExhnum(rs.getInt("enum"));
				edto.setEname(rs.getString("ename"));
				edto.setEcategory(rs.getString("ecategory"));
				edto.setEcode(rs.getString("ecode"));
				edto.setEposter(rs.getString("eposter"));
				edto.setEplace(rs.getString("eplace"));
				edto.setEperiod(rs.getString("eperiod"));
				edto.setEdepart(rs.getString("edepart"));
				edto.setEinfor(rs.getString("einfor"));
				
				lists.add(edto);
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
		System.out.println("Exhibition lists:"+lists);
		return lists;
	} //getAllExhibition
	
	public int insertExhibition(MultipartRequest mr) {
		
		String sql = "insert into exhibition values(eseq.nextval,?,?,?,?,?,?,?,?)";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, mr.getParameter("ename"));
			ps.setString(2, mr.getParameter("ecategory"));
			ps.setString(3, mr.getParameter("ecode"));
			ps.setString(4, mr.getOriginalFileName("eposter"));
			ps.setString(5, mr.getParameter("eplace"));
			ps.setString(6, mr.getParameter("eperiod"));
			ps.setString(7, mr.getParameter("edepart"));
			ps.setString(8, mr.getParameter("einfor"));
			
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
		
		System.out.println("insert Exhibition cnt:"+cnt);
		return cnt;
	} //insertExhibition
	
	public ExhibitionDTO getExhibitionByNum(String exhnum) {
		
		String sql = "select * from exhibition where enum="+exhnum;
		ExhibitionDTO edto = null;
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				edto = new ExhibitionDTO();

				edto.setEname(rs.getString("ename"));
				edto.setEcategory(rs.getString("ecategory"));
				edto.setEcode(rs.getString("ecode"));
				edto.setEposter(rs.getString("eposter"));
				edto.setEplace(rs.getString("eplace"));
				edto.setEperiod(rs.getString("eperiod"));
				edto.setEdepart(rs.getString("edepart"));
				edto.setEinfor(rs.getString("einfor"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getExhibitionByNum success");
		return edto;
	} //getExhibitionByNum
	
	public int updateExhibition(MultipartRequest mr, String img) {
		
		String sql = "update exhibition set ename=?, ecategory=?, eposter=?, eplace=?, eperiod=?, "
					+"edepart=?, einfor=? where ecode=?";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mr.getParameter("ename"));
			ps.setString(2, mr.getParameter("ecategory"));
			ps.setString(3, img);
			ps.setString(4, mr.getParameter("eplace"));
			ps.setString(5, mr.getParameter("eperiod"));
			ps.setString(6, mr.getParameter("edepart"));
			ps.setString(7, mr.getParameter("einfor"));
			ps.setString(8, mr.getParameter("ecode"));
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("update Exhibition cnt:"+cnt);
		return cnt;
	} //updateExhibition
	
	public ArrayList<ExhibitionDTO> getAllExhibitionByCtgr(String ecategory) {
		
		ArrayList<ExhibitionDTO> lists = new ArrayList<ExhibitionDTO>();
		
		String sql = "select * from exhibition where ecategory=? order by enum";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ecategory);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ExhibitionDTO edto = new ExhibitionDTO();
				
				edto.setExhnum(rs.getInt("enum"));
				edto.setEname(rs.getString("ename"));
				edto.setEcategory(rs.getString("ecategory"));
				edto.setEcode(rs.getString("ecode"));
				edto.setEposter(rs.getString("eposter"));
				edto.setEplace(rs.getString("eplace"));
				edto.setEperiod(rs.getString("eperiod"));
				edto.setEdepart(rs.getString("edepart"));
				edto.setEinfor(rs.getString("einfor"));
				
				lists.add(edto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getAllExhibitionByCtgr success");
		return lists;
	} //getAllExhibitionByCtgr
	
	public int deleteCheckExhibition(String[] exhnum) {
		
		String sql = "delete from exhibition where enum=?";
		
		for(int i=0;i<exhnum.length-1;i++) {
			sql += " or enum=?";
		}

		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);

			for(int i=0;i<exhnum.length;i++) {
				ps.setString(i+1, exhnum[i]);
			}

			cnt = ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("cnt:"+cnt);
		return cnt;
	} //deleteCheckExhibition
	
	public String getCtgrByName(String ename) {
		
		String sql = "select ecategory from exhibition where ename=?";
		
		String rcategory = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ename);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				rcategory = rs.getString("ecategory");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getCtgrByName");
		return rcategory;
	} //getCtgrByName
}
