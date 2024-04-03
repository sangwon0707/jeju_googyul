package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.sist.db.ConnectionProvider;
import com.sist.vo.QnaVO;

public class QnaDAO {
	//싱글턴 객체 다오
	public static QnaDAO dao = null;
	
	private QnaDAO() {
	}
	
	public static QnaDAO getInstance() {
		if(dao==null) {
			dao = new QnaDAO();
		}
		return dao;
	}
	
	//이하 메소드
	
	//<문의하기>
	public int insertQna(QnaVO q) {
		int re =-1;
		String sql = "insert into qna values(?,?,?,sysdate,null,?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q.getQno());
			pstmt.setString(2, q.getQ_title());		
			pstmt.setString(3, q.getQ_content());		
			pstmt.setInt(4, q.getUno());			
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외 발생"+e.getMessage());
		}
		return re;
	}
	
	//<관리자 답변>: 답변만 a_content에 추가
	public int updateQna(String a_content, int qno){
		int re =-1;
		String sql = "update qna set a_content=? where qno=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a_content);
			pstmt.setInt(2, qno);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외 발생"+e.getMessage());
		}
		return re;
	} 
	
	//<내 문의사항> 마이페이지 들어가면 처음 뜨는 거.문의번호, 문의제목, 문의내용, 문의날짜
	public ArrayList<HashMap<String, Object>> listMyQna(int uno){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql = "select qno, q_title, q_content, q_date from qna where uno=" +uno
				+ " order by q_date desc";
		try {
			Connection conn =ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("qno", rs.getInt(1));
				map.put("q_title", rs.getString(2));
				map.put("q_content", rs.getString(3));
				map.put("q_date", rs.getDate(4));
				list.add(map);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("예외:"+e.getMessage());
		}
		return list;
	}
	
	//<문의사항 상세> 문의사항 번호 받아서 띄우기
	public ArrayList<QnaVO> detailQna(int qno){
		ArrayList<QnaVO> list = new ArrayList<QnaVO>();
		String sql = "select * from qna where qno="+qno;
		try {
			Connection conn =ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(new QnaVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getDate(4), rs.getString(5), rs.getInt(6)));
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("예외:"+e.getMessage());
		}
		return list;
	}
	
	public QnaVO detailQna(int qno, int uno) {
	    QnaVO qv = new QnaVO();
	    String sql = "SELECT * FROM qna WHERE qno = ?"; 
	    if (uno != 0) {
	        sql += " AND uno = ?";
	    }
	    try {
	        Connection conn = ConnectionProvider.getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql);     
	        pstmt.setInt(1, qno);
	        if (uno != 0) {
	            pstmt.setInt(2, uno);
	        }
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            Date q_Date = rs.getDate("q_DATE");
	            qv = new QnaVO(
	                    qno,
	                    rs.getString("q_title"),
	                    rs.getString("q_content"),
	                    q_Date,
	                    rs.getString("a_content"),
	                    uno
	            );
	        }
	        ConnectionProvider.close(conn, pstmt, rs);
	    } catch (Exception e) {
	        System.out.println("예외:" + e.getMessage());
	    }
	    return qv;
	}

	
	//<답변 완료된 문의사항 조회>관리자용. u_email로 검색 . 
	public ArrayList<QnaVO> listAnsweredQna(String keyword){
		ArrayList<QnaVO> list = new ArrayList<QnaVO>();
		String sql = "select q.qno, u_email, q_title, q_content, a_content, q_date "
				+ "from qna q, users u where q.uno=u.uno "
				+ "and a_content is not null ";
				if(keyword!=null) { //u_email로 검색.
					sql+=" and u_email like '%"+keyword+"%'";
				}
				sql += " order by q_date desc";
		try {
			Connection conn =ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(new QnaVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getDate(4), rs.getString(5), rs.getInt(6)));
				System.out.println(rs.getString(2));
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("예외:"+e.getMessage());
		}
		return list;
	}
	
	//<답변 이전 문의사항 조회>관리자용. u_email로 검색 
	public ArrayList<QnaVO> lisNotAnsweredQna(String keyword){
		ArrayList<QnaVO> list = new ArrayList<QnaVO>();
		String sql = "select q.qno, u_name, q_title, q_content, q_date "
				+ "from qna q, users u where q.uno=u.uno "
				+ "and a_content is null ";
				if(keyword!=null) { //u_email로 검색.
					sql+=" and u_email like '%"+keyword+"%' ";
				}
				sql += " order by q_date desc";
		try {
			Connection conn =ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(new QnaVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getDate(4), rs.getString(5), rs.getInt(6)));
				System.out.println(rs.getString(2));
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("예외:"+e.getMessage());
		}
		return list;
	}
	
	//insert시 사용할 다음 qno
	public int getNextQno() {
	      int qno = 0;
	      String sql  = "select nvl(max(qno),0) + 1 from qna";
	      try {
	         Connection conn = ConnectionProvider.getConnection();
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(sql);
	         if(rs.next()) {
	            qno = rs.getInt(1);
	         }
	         ConnectionProvider.close(conn, stmt, rs);
	      } catch (Exception e) {
	         System.out.println("예외발생 : " + e.getMessage());
	      }
	      return qno;
	   }
}
