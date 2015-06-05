package enrollBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import enrollBean.*;

public class EnrollMgr {
	
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public EnrollMgr() {
		try{
			// Create a OracleConnectionPoolDataSorce instance
			ocpds = new OracleConnectionPoolDataSource();
			// Set connection parameters
			ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:DBLAB");
			ocpds.setUser("ST2009111979");
			ocpds.setPassword("ST2009111979");
			// Create a pooled connection
			pool = ocpds.getPooledConnection();
	   } catch (Exception e) {
		   System.out.println("Error : Connection Failed");
	   }
	}

	public Vector getEnrollList(String s_id) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		CallableStatement cstmt1 = null; 
		CallableStatement cstmt2 = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
        try {
            conn = pool.getConnection();

            cstmt1 = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
            cstmt1.registerOutParameter(1, java.sql.Types.INTEGER);
            cstmt1.execute();
            int nYear = cstmt1.getInt(1);

            cstmt2 = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
            cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
            cstmt2.execute();
            int nSemester = cstmt2.getInt(1);

            String mySQL = "select e.c_id cid,e.c_id_no cid_no,c.c_name cname,c.c_unit cunit from enroll e, course c " +
                    "where e.s_id=? and e.e_year=? and e.e_semester=? and e.c_id=c.c_id and e.c_id_no=c.c_id_no";
            pstmt = conn.prepareStatement(mySQL);
            pstmt.setString(1,s_id); pstmt.setInt(2, nYear);
            pstmt.setInt(3, nSemester);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Enroll en = new Enroll();
                en.setCId(rs.getString("cid"));
                en.setCIdNo(rs.getInt("cid_no"));
                en.setCName(rs.getString("cname"));
                en.setCUnit(rs.getInt("cunit"));
                vecList.add(en);
            }
            cstmt1.close();
            cstmt2.close();
            pstmt.close();
            conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return vecList;
	}

	public Vector getEnrollList(String s_id, int nYear, int nSemester) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();
			
			String mySQL = "select e.c_id cid,e.c_id_no cid_no,c.c_name cname,c.c_unit cunit from enroll e, course c " +
					"where e.s_id=? and e.e_year=? and e.e_semester=? and e.c_id=c.c_id and e.c_id_no=c.c_id_no";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, s_id);
			pstmt.setInt(2, nYear);
			pstmt.setInt(3, nSemester);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Enroll en = new Enroll();
				en.setCId(rs.getString("cid"));
				en.setCIdNo(rs.getInt("cid_no"));
				en.setCName(rs.getString("cname"));
				en.setCUnit(rs.getInt("cunit"));
				vecList.add(en);
			}
			pstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return vecList;
	}

	public int getCurrentYear() {
		int nYear=0; 
		Connection conn = null;
		CallableStatement cstmt = null;
		
		try {
			conn = pool.getConnection();
			
			cstmt = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.execute();
			nYear = cstmt.getInt(1);
			
			cstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return nYear;
	}

	public int getCurrentSemester() {
		int nSemester=0;
		Connection conn = null; 
		CallableStatement cstmt = null;
	
		try {
			conn = pool.getConnection();
			
			cstmt = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.execute();
			nSemester = cstmt.getInt(1);
			
			cstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}	
		return nSemester;
	}

	public void deleteEnroll(String s_id, String c_id, int c_id_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = pool.getConnection();
			String mySQL = "delete from enroll where s_id=? and c_id=? and c_id_no=?";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1,s_id);
			pstmt.setString(2, c_id);
			pstmt.setInt(3, c_id_no);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
	}

    public Vector getCourseList(String s_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            conn = pool.getConnection();

            String mySQL;
            // mySQL = "select * from course";

            mySQL = "select * from course where c_id not in " +
                    "(select c_id from enroll where s_id = ? or " +
                    "e_year != '2015' or e_semester != '2') " +
                    "and c_id in " +
                    "(select c_id from teach where t_year = '2015' and t_semester = '2')";

            pstmt = conn.prepareStatement(mySQL);
            // session_id String
            pstmt.setString(1, s_id);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Enroll en = new Enroll();
                en.setCId(rs.getString("c_id"));
                en.setCIdNo(rs.getInt("c_id_no"));
                en.setCName(rs.getString("c_name"));
                en.setCUnit(rs.getInt("c_unit"));
                vecList.add(en);
            }
            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        }
        return vecList;
    }

    public String insertEnroll(String s_id, String c_id, int c_id_no) {
        Connection conn = null;
        CallableStatement cstmt = null;
        String result = null;

        try {
            conn = pool.getConnection();

            cstmt = conn.prepareCall("{call InsertEnroll(?, ?, ?, ?)}");
            cstmt.setString(1, s_id);
            cstmt.setString(2, c_id);
            cstmt.setInt(3, c_id_no);
            cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
            cstmt.execute();
            result = cstmt.getString(4);

            conn.commit();
            cstmt.close();
            conn.close();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        }
        return result;
    }
}


