package museum;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MembersDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static MembersDAO mdao;
	
	public static MembersDAO getInstance() {
		if(mdao == null) {
			mdao = new MembersDAO();
		}
		return mdao;
	} //MembersDAO getInstance
	
	private MembersDAO() {
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
	} //MembersDAO 생성자
	
	public MembersDTO getMembersDTO(ResultSet rs2) throws SQLException {
		MembersDTO mdto = new MembersDTO();
		
		//이름 아이디 비밀번호 연락처(1,2,3) 우편번호 주소1 주소2 이메일
		
		mdto.setNo(rs.getInt("no"));
		mdto.setName(rs.getString("name"));
		mdto.setId(rs.getString("id"));
		mdto.setPassword(rs.getString("password"));
		mdto.setHp1(rs.getString("hp1"));
		mdto.setHp2(rs.getString("hp2"));
		mdto.setHp3(rs.getString("hp3"));
		mdto.setSmsAgree(rs.getString("smsagree"));		
		mdto.setZipcode(rs.getString("zipcode"));
		mdto.setAddress1(rs.getString("address1"));
		mdto.setAddress2(rs.getString("address2"));
		mdto.setEmail(rs.getString("email"));
		mdto.setEmailAgree(rs.getString("emailagree"));
		
		return mdto;
	} //getMembersDTO
	
	public boolean searchId(String userid) {

		String sql = "select * from museum_members where id=?";
		boolean flag = false;
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, userid);

			rs = ps.executeQuery();
			if(rs.next()) {
				flag =  true;
			} 

		} catch(SQLException e) {
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
		System.out.println("idCheck_DAO_flag:"+flag);
		return flag;
	} //searchId
	
	public ArrayList<MembersDTO> getAllMembers() {
		
		ArrayList<MembersDTO> lists = new ArrayList<MembersDTO>();
		
		String sql = "select rownum, no, name, id, password, hp1, hp2, hp3, smsagree, zipcode, "
					+ "address1, address2, email, emailagree from museum_members order by rownum";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MembersDTO mdto = new MembersDTO();

				mdto.setRownum(rs.getInt("rownum"));
				mdto.setNo(rs.getInt("no"));
				mdto.setName(rs.getString("name"));
				mdto.setId(rs.getString("id"));
				mdto.setPassword(rs.getString("password"));
				mdto.setHp1(rs.getString("hp1"));
				mdto.setHp2(rs.getString("hp2"));
				mdto.setHp3(rs.getString("hp3"));
				mdto.setSmsAgree(rs.getString("smsagree"));		
				mdto.setZipcode(rs.getString("zipcode"));
				mdto.setAddress1(rs.getString("address1"));
				mdto.setAddress2(rs.getString("address2"));
				mdto.setEmail(rs.getString("email"));
				mdto.setEmailAgree(rs.getString("emailagree"));
				
				lists.add(mdto);
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
		System.out.println("getAllMembers");
		return lists;
	} //getAllMembers
	
	public MembersDTO getMembersInfo(String id, String password) {
		
		String sql = "select * from museum_members where id=? and password=?";
		
		MembersDTO mdto = null;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				mdto = getMembersDTO(rs);
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
		
		return mdto;
	} //getMembersInfo
	
	public int insertMembers(MembersDTO mdto) {
		
		String sql = "insert into museum_members values(mseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getId());
			ps.setString(3, mdto.getPassword());
			ps.setString(4, mdto.getHp1());
			ps.setString(5, mdto.getHp2());
			ps.setString(6, mdto.getHp3());
			ps.setString(7, mdto.getSmsAgree());
			ps.setString(8, mdto.getZipcode());
			ps.setString(9, mdto.getAddress1());
			ps.setString(10, mdto.getAddress2());
			ps.setString(11, mdto.getEmail());
			ps.setString(12, mdto.getEmailAgree());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("insert museum_members cnt:"+cnt);
		return cnt;
	} //insertMembers
	
	public MembersDTO getMembersById(String sid) {
		
		String sql = "select * from museum_members where id=?";
		
		MembersDTO mdto = null;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, sid);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				mdto = getMembersDTO(rs);
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
		System.out.println("getMembersById");
		return mdto;
	} //getMembersById
	
	public int updateMembers(MembersDTO mdto) {
		
		String sql = "update museum_members set password=?, hp1=?, hp2=?, hp3=?, smsagree=?, "
					+ "zipcode=?, address1=?, address2=?, email=?, emailagree=? where id=?";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mdto.getPassword());
			ps.setString(2, mdto.getHp1());
			ps.setString(3, mdto.getHp2());
			ps.setString(4, mdto.getHp3());
			ps.setString(5, mdto.getSmsAgree());
			ps.setString(6, mdto.getZipcode());
			ps.setString(7, mdto.getAddress1());
			ps.setString(8, mdto.getAddress2());
			ps.setString(9, mdto.getEmail());
			ps.setString(10, mdto.getEmailAgree());
			ps.setString(11, mdto.getId());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("update museum_members cnt:"+cnt);
		return cnt;
	} //updateMembers
	
}
