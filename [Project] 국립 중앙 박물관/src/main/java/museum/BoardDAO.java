package museum;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn = null ;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static BoardDAO bdao;

	public static BoardDAO getInstance() {
		if(bdao==null) {
			bdao = new BoardDAO();
			System.out.println("객체 생성");
		}
		return bdao;
	}

	private BoardDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> getArticles(int start, int end) {
		
		ArrayList<BoardDTO> lists = new ArrayList<BoardDTO>();
		
		String sql = "select rank, num, writer, email, subject, id, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, id, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, id, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from museum_board  ";
		sql += "order by ref desc, re_level asc )) ";
		sql += "where rank between ? and ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				
				bdto.setNum(rs.getInt("num"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setEmail(rs.getString("email"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setId(rs.getString("id"));
				bdto.setPasswd(rs.getString("passwd"));
				bdto.setReg_date(rs.getTimestamp("reg_date"));
				bdto.setReadcount(rs.getInt("ref"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setRe_step(rs.getInt("re_step"));
				bdto.setRe_level(rs.getInt("re_level"));
				bdto.setContent(rs.getString("content"));
				bdto.setIp(rs.getString("ip"));
				
				lists.add(bdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("lists.size(): "+lists.size());
		return lists;
	} //getAllBoard
	
	public int getArticleCount() {
		
		String sql = "select count(*) from museum_board";
		
		int count = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("count:"+count);
		return count;
	} //getArticleCount
	
	public int insertArticle(BoardDTO bdto) { //원글쓰기
		
		String sql = "insert into museum_board(num,writer,subject,email,content,id,passwd,reg_date,ref,re_step,re_level,ip) values(mboard_seq.nextval,?,?,?,?,?,?,?,mboard_seq.currval,?,?,?)";
		//currval = current value
		
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			System.out.println(1);
			
			ps.setString(1, bdto.getWriter());
			ps.setString(2, bdto.getSubject());
			ps.setString(3, bdto.getEmail());
			ps.setString(4, bdto.getContent());
			ps.setString(5, bdto.getId());
			ps.setString(6, bdto.getPasswd());
			ps.setTimestamp(7, bdto.getReg_date());
			ps.setInt(8, 0); //re_step
			ps.setInt(9, 0); //re_level
			ps.setString(10, bdto.getIp());
			
			cnt = ps.executeUpdate();
			System.out.println(2);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println(3);
		System.out.println("write cnt:"+cnt);
		return cnt;
	} //insertArticle
	
	public BoardDTO getArticleByNum(String num) {
		
		String sql2 = "update museum_board set readcount = readcount+1 where num="+num;
		String sql = "select * from museum_board where num="+num;
		BoardDTO bdto = null;
		try {
			//클릭할 때마다 조회수 1 추가
			ps = conn.prepareStatement(sql2);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println("select * from museum_board where num="+num);
			if(rs.next()) {
				bdto = new BoardDTO();
				
				bdto.setNum(rs.getInt("num"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setEmail(rs.getString("email"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setId(rs.getString("id"));
				bdto.setPasswd(rs.getString("passwd"));
				bdto.setReg_date(rs.getTimestamp("reg_date"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setRef(rs.getInt("ref"));
				bdto.setRe_step(rs.getInt("re_step"));
				bdto.setRe_level(rs.getInt("re_level"));
				bdto.setContent(rs.getString("content"));
				bdto.setIp(rs.getString("ip"));
				
				System.out.println("setting complete");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return bdto;
	} //getArticleByNum
	
	public BoardDTO getContentByNum(String num) {
		
		String sql = "select * from museum_board where num="+num;
		BoardDTO bdto = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println("select * from museum_board where num="+num);
			if(rs.next()) {
				bdto = new BoardDTO();

				bdto.setNum(rs.getInt("num"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setEmail(rs.getString("email"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setId(rs.getString("id"));
				bdto.setPasswd(rs.getString("passwd"));
				bdto.setReg_date(rs.getTimestamp("reg_date"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setRef(rs.getInt("ref"));
				bdto.setRe_step(rs.getInt("re_step"));
				bdto.setRe_level(rs.getInt("re_level"));
				bdto.setContent(rs.getString("content"));
				bdto.setIp(rs.getString("ip"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return bdto;
	} //getContentByNum

	public int updateArticle(BoardDTO bdto) {
		System.out.println("bb.getPasswd():"+bdto.getPasswd()); //수정form에서 입력한 비번
		
		String sql2 = "select passwd from museum_board where num=?";
		String sql = "update museum_board set writer=?,subject=?,id=?,email=?,content=? where num=?";
		
		int cnt = -1;
		try {
			ps=conn.prepareStatement(sql2);
			ps.setInt(1, bdto.getNum());
			rs = ps.executeQuery();
			System.out.println(1);
			
			if(rs.next()) {
				String dbpw = rs.getString("passwd");
				System.out.println("dbpw:"+dbpw);
				if(dbpw.equals(bdto.getPasswd())) { //비번 일치
					ps = conn.prepareStatement(sql);

					ps.setString(1, bdto.getWriter());
					ps.setString(2, bdto.getSubject());
					ps.setString(3, bdto.getId());
					ps.setString(4, bdto.getEmail());
					ps.setString(5, bdto.getContent());
					ps.setInt(6, bdto.getNum());

					cnt = ps.executeUpdate();
					System.out.println(2);
				}
			} //if(rs.next())
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally { //자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("update cnt:"+cnt);
		return cnt;
	} //updateArticle
	
	public int deleteArticle(String num, String passwd) {
		System.out.println("passwd:"+passwd); //수정form에서 입력한 비번
		
		String sql2 = "select passwd from museum_board where num="+num;
		String sql = "delete museum_board where num="+num;
		
		int cnt = -1;
		try {
			ps=conn.prepareStatement(sql2);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbpw = rs.getString("passwd");
				if(dbpw.equals(passwd)) { //비번 일치
					ps = conn.prepareStatement(sql);

					cnt = ps.executeUpdate();
				}
			} //if(rs.next())
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally { //자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("delete cnt:"+cnt);
		return cnt;
	} //deleteArticle
	
	public int replyArticle(BoardDTO bdto) {
		/*
		10가지 정보가 넘어옴 
		- 7가지: 답글 
		- 3가지: 부모정보(ref,re_step,re_level)
		*/
		
		String sql = "update museum_board set re_step=re_step+1 where ref=? and re_step=?";
		String sql2 = "insert into museum_board(num,writer,subject,email,content,id,passwd,reg_date,ref,re_step,re_level,ip)"
					+ " values(mboard_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";

		
		int re_step, re_level;
		int cnt = -1;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, bdto.getRef());
			ps.setInt(2, bdto.getRe_step());

			ps.executeUpdate();
			
			re_step = bdto.getRe_step() + 1;
			re_level = bdto.getRe_level() + 1;
			
			ps = conn.prepareStatement(sql2);
			ps.setString(1, bdto.getWriter());
			ps.setString(2, bdto.getSubject());
			ps.setString(3, bdto.getEmail());
			ps.setString(4, bdto.getContent());
			ps.setString(5, bdto.getId());
			ps.setString(6, bdto.getPasswd());
			ps.setTimestamp(7, bdto.getReg_date());
			ps.setInt(8, bdto.getRef()); //ref
			ps.setInt(9, re_step); //re_step
			ps.setInt(10, re_level); //re_level
			ps.setString(11, bdto.getIp());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	} //replyArticle
}