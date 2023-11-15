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

public class ReservationDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static ReservationDAO rdao;
	
	public static ReservationDAO getInstance() {
		if(rdao == null) {
			rdao = new ReservationDAO();
		}
		return rdao;
	} //ReservationDAO getInstance
	
	private ReservationDAO() {
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
	} //ReservationDAO 생성자
	
	public ArrayList<ReservationDTO> getAllReservation() {
		
		ArrayList<ReservationDTO> lists = new ArrayList<ReservationDTO>();
		
		String sql = "select rownum, rno, rid, rcategory, program, rdate, rtime, adult, junior, toddler, "
				+ "rname, hp1, hp2, hp3, email, condition from museum_reservation order by rownum";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReservationDTO rdto = new ReservationDTO();
				
				rdto.setRownum(rs.getInt("rownum"));
				rdto.setRno(rs.getInt("rno"));
				rdto.setRid(rs.getString("rid"));
				rdto.setRcategory(rs.getString("rcategory"));
				rdto.setProgram(rs.getString("program"));
				rdto.setRdate(rs.getString("rdate"));
				rdto.setRtime(rs.getString("rtime"));
				rdto.setAdult(rs.getInt("adult"));
				rdto.setJunior(rs.getInt("junior"));
				rdto.setToddler(rs.getInt("toddler"));
				rdto.setRname(rs.getString("rname"));		
				rdto.setHp1(rs.getString("hp1"));
				rdto.setHp2(rs.getString("hp2"));
				rdto.setHp3(rs.getString("hp3"));
				rdto.setEmail(rs.getString("email"));
				rdto.setCondition(rs.getString("condition"));
				lists.add(rdto);
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
		System.out.println("getAllReservation");
		return lists;
	} //getAllReservation
	
	public ArrayList<ReservationDTO> getReservationById(String id) {
		
		ArrayList<ReservationDTO> lists = new ArrayList<ReservationDTO>();

		String sql = "select rownum, rno, rid, rcategory, program, rdate, rtime, adult, junior, toddler, "
				+ "rname, hp1, hp2, hp3, email, condition from museum_reservation where rid=? order by rownum";

		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReservationDTO rdto = new ReservationDTO();
				
				rdto.setRownum(rs.getInt("rownum"));
				rdto.setRno(rs.getInt("rno"));
				rdto.setRid(rs.getString("rid"));
				rdto.setRcategory(rs.getString("rcategory"));
				rdto.setProgram(rs.getString("program"));
				rdto.setRdate(rs.getString("rdate"));
				rdto.setRtime(rs.getString("rtime"));
				rdto.setAdult(rs.getInt("adult"));
				rdto.setJunior(rs.getInt("junior"));
				rdto.setToddler(rs.getInt("toddler"));
				rdto.setRname(rs.getString("rname"));		
				rdto.setHp1(rs.getString("hp1"));
				rdto.setHp2(rs.getString("hp2"));
				rdto.setHp3(rs.getString("hp3"));
				rdto.setEmail(rs.getString("email"));
				rdto.setCondition(rs.getString("condition"));
				
				lists.add(rdto);
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
		System.out.println("getReservationById");
		return lists;
	} //getReservationById
	
	public ReservationDTO getReservationDTO(ResultSet rs2) throws SQLException {
		ReservationDTO rdto = new ReservationDTO();
		
		rdto.setRno(rs.getInt("rno"));
		rdto.setRid(rs.getString("rid"));
		rdto.setRcategory(rs.getString("rcategory"));
		rdto.setProgram(rs.getString("program"));
		rdto.setRdate(rs.getString("rdate"));
		rdto.setRtime(rs.getString("rtime"));
		rdto.setAdult(rs.getInt("adult"));
		rdto.setJunior(rs.getInt("junior"));
		rdto.setToddler(rs.getInt("toddler"));
		rdto.setRname(rs.getString("rname"));		
		rdto.setHp1(rs.getString("hp1"));
		rdto.setHp2(rs.getString("hp2"));
		rdto.setHp3(rs.getString("hp3"));
		rdto.setEmail(rs.getString("email"));
		rdto.setCondition(rs.getString("condition"));
		
		return rdto;
	} //getReservationDTO
	
	public int insertReservation(ReservationDTO rdto) {
		
		String sql = "insert into museum_reservation values(rseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, rdto.getRid());
			ps.setString(2, rdto.getRcategory());
			ps.setString(3, rdto.getProgram());
			ps.setString(4, rdto.getRdate());
			ps.setString(5, rdto.getRtime());
			ps.setInt(6, rdto.getAdult());
			ps.setInt(7, rdto.getJunior());
			ps.setInt(8, rdto.getToddler());
			ps.setString(9, rdto.getRname());
			ps.setString(10, rdto.getHp1());
			ps.setString(11, rdto.getHp2());
			ps.setString(12, rdto.getHp3());
			ps.setString(13, rdto.getEmail());
			ps.setString(14, rdto.getCondition());
			
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
		System.out.println("insert museum_reservation cnt:"+cnt);
		return cnt;
	} //insertReservation
	
	public ReservationDTO getReservationByNo(String rno) {
		
		String sql = "select * from museum_reservation where rno=?";
		ReservationDTO rdto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(rno));
			
			rs = ps.executeQuery();
			if(rs.next()) {
				rdto = getReservationDTO(rs);
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
		System.out.println("getReservationByNo");
		return rdto;
	} //getReservationByNo
	
	public int updateReservation(ReservationDTO rdto) {
		
		String sql = "update museum_reservation set rdate=?, rtime=?, adult=?, junior=?, toddler=?, rname=?, "
					+ "hp1=?, hp2=?, hp3=?, email=?, condition=? where rno=?";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, rdto.getRdate());
			ps.setString(2, rdto.getRtime());
			ps.setInt(3, rdto.getAdult());
			ps.setInt(4, rdto.getJunior());
			ps.setInt(5, rdto.getToddler());
			ps.setString(6, rdto.getRname());
			ps.setString(7, rdto.getHp1());
			ps.setString(8, rdto.getHp2());
			ps.setString(9, rdto.getHp3());
			ps.setString(10, rdto.getEmail());
			ps.setString(11, rdto.getCondition());
			ps.setInt(12, rdto.getRno());
			
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
		System.out.println("update museum_reservation cnt:"+cnt);
		return cnt;
	} //updateReservation
}
