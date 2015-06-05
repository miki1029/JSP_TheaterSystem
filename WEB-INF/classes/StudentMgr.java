package studentBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import studentBean.*;

public class StudentMgr 
{
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;
	
	public StudentMgr() {
 	 try{
	    // Create a OracleConnectionPoolDataSource instance
		ocpds = new OracleConnectionPoolDataSource();

		// Set connection parameters
		ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:DBLAB");
		ocpds.setUser("id");
		ocpds.setPassword("password");
	    // Create a pooled connection
	    pool  = ocpds.getPooledConnection();
 	   }catch(Exception e){
 	      System.out.println("Error : Connection Failed");
 	   }
    }
	
	public Vector getStudent(String s_id) {
		   Connection conn = null;
		   PreparedStatement pstmt = null;		  
		   ResultSet rs = null;
		   Vector vecList = new Vector();	   
			
			try {
				conn = pool.getConnection();
				
				String mySQL = "select s_name, s_addr, s_pwd, s_college, s_major from student where s_id=?";
				pstmt = conn.prepareStatement(mySQL);
				pstmt.setString(1,s_id);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
						Student st = new Student();
						st.setName(rs.getString("s_name"));
						st.setAddr(rs.getString("s_addr"));
						st.setPwd(rs.getString("s_pwd"));
						st.setCollege(rs.getString("s_college"));
						st.setMajor(rs.getString("s_major"));
						
						vecList.add(st);
				}
				pstmt.close();
				conn.close();
			} catch (Exception ex) {
				System.out.println("Exception" + ex);
			}
			
			return vecList;
	}


	public void updateStudent(String s_name, String s_addr, String s_pwd, String s_college, String s_major, String s_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		Vector message = new Vector();	   
		
		try {
			conn = pool.getConnection();
			String mySQL = "update student set s_name=?, s_addr=?, s_pwd=?, s_college=?, s_major=? where s_id=?";
	       	pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1,s_name);
			pstmt.setString(2,s_addr);
			pstmt.setString(3,s_pwd);
			pstmt.setString(4,s_college);
			pstmt.setString(5,s_major);
			pstmt.setString(6,s_id);
			pstmt.executeUpdate();
			
		} catch (SQLException ex) {
			System.out.println("Exception" + ex);
		}
	}
}