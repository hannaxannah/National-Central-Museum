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

import admin.ShopDTO;

public class OrderDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static OrderDAO odao;
	
	public static OrderDAO getInstance() {
		if(odao == null) {
			odao = new OrderDAO();
		}
		return odao;
	} //MembersDAO getInstance
	
	private OrderDAO() {
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
	} //OrderDAO 생성자
	
	public OrderDTO getOrderDTO(ResultSet rs2) throws SQLException {
		OrderDTO odto = new OrderDTO();
		
		//주문번호 회원아이디 상품번호 수량 전체가격 배송메모 결제수단
		
		odto.setOrderId(rs.getInt("orderId"));
		odto.setMemid(rs.getString("memid"));
		odto.setGnum(rs.getInt("gnum"));
		odto.setQty(rs.getInt("qty"));
		odto.setAmount(rs.getInt("amount"));
		odto.setOmemo(rs.getString("omemo"));
		odto.setPay(rs.getString("pay"));
		odto.setCondition(rs.getString("condition"));
		
		return odto;
	} //getMembersDTO
	
	public ArrayList<OrderDTO> getAllOrder() {
		
		ArrayList<OrderDTO> lists = new ArrayList<OrderDTO>();
		OrderDTO odto = null;
		
		String sql = "select * from museum_order";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				odto = getOrderDTO(rs);
				
				lists.add(odto);
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
		System.out.println("getAllOrder");
		return lists;
	} //getAllMembers
	
	public int insertOrder(String sid, String omemo, String pay, String condition, ArrayList<ShopDTO> clists) throws SQLException{
		
		
		int cnt = -1;
		for(ShopDTO sdto : clists) {
			String sql = "insert into museum_order values(oseq.nextval,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, sid);
			ps.setInt(2, sdto.getGnum());
			ps.setInt(3, sdto.getGqty());
			ps.setInt(4, sdto.getGqty()*Integer.parseInt(sdto.getGprice()));
			ps.setString(5, omemo);
			ps.setString(6, pay);
			ps.setString(7, condition);
			
			cnt += ps.executeUpdate();
		}
		System.out.println("insert museum_order cnt:"+cnt);
		return cnt;
	} //insertOrder

	public ArrayList<OrderDTO> getOrderByMemid(String sid) {
		
		ArrayList<OrderDTO> lists = new ArrayList<OrderDTO>();
		OrderDTO odto = null;
		
		String sql = "select * from museum_order where memid=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				odto = getOrderDTO(rs);
				
				lists.add(odto);
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
		System.out.println("getOrderByMemid");
		return lists;
	} //getOrderByMemid
	
	public ArrayList<OrderDTO> getOrderLists() {
		
		ArrayList<OrderDTO> lists = new ArrayList<OrderDTO>();
		
		String sql = "select m.name, m.id, g.gname, o.qty, o.amount, o.pay, o.condition "
					+ "from (museum_members m inner join museum_order o on m.id = o.memid) "
					+ "inner join goods g on g.gnum = o.gnum";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderDTO odto = new OrderDTO();
				
				odto.setMemname(rs.getString("name"));
				odto.setMemid(rs.getString("id"));
				odto.setGname(rs.getString("gname"));
				odto.setQty(rs.getInt("qty"));
				odto.setAmount(rs.getInt("amount"));
				odto.setPay(rs.getString("pay"));
				odto.setCondition(rs.getString("condition"));
				
				lists.add(odto);
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
		System.out.println("getOrderLists");
		return lists;
	} //getOrderLists
	
	public ArrayList<OrderDTO> getOrderListsByMemid(String sid) {
		
		ArrayList<OrderDTO> lists = new ArrayList<OrderDTO>();
		
		String sql = "select m.name, m.id, g.gname, o.qty, o.amount, o.pay, o.condition "
					+ "from (museum_members m inner join museum_order o on m.id = o.memid) "
					+ "inner join goods g on g.gnum = o.gnum where id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderDTO odto = new OrderDTO();
				
				odto.setMemname(rs.getString("name"));
				odto.setMemid(rs.getString("id"));
				odto.setGname(rs.getString("gname"));
				odto.setQty(rs.getInt("qty"));
				odto.setAmount(rs.getInt("amount"));
				odto.setPay(rs.getString("pay"));
				odto.setCondition(rs.getString("condition"));
				
				lists.add(odto);
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
		System.out.println("getOrderListsByMemid");
		return lists;
	} //getOrderListsByMemid
	
	public int updateOrder(String orderId) {
		
		String sql = "update museum_order set condition=? where orderId=? ";
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, "결제취소");
			ps.setInt(2, Integer.parseInt(orderId));
			
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
		System.out.println("updateOrder cnt:"+cnt);
		return cnt;
	} //updateOrder
}
