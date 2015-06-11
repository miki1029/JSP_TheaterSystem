package woodrimsTheater;

import javax.sql.PooledConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginManager {

    private PooledConnection pool = null;

    public LoginManager() {
        DBConnection dbConnection = DBConnection.getInstance();
        pool = dbConnection.getPool();
    }

    public SessionUserInfo adminLogin(String userID, String userPassword) {
        Connection conn = null;
        SessionUserInfo user = null;

        try {
            conn = pool.getConnection();

            String mySQL = "SELECT * " +
                    "FROM EMPLOYEES e INNER JOIN ADMIN a " +
                    "ON (e.EmployeeID = a.EmployeeID) " +
                    "WHERE a.ID = '" + userID + "' AND a.Password = '" + userPassword + "'";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(mySQL);

            if (rs.next()) {
                user = new SessionUserInfo(rs.getString("EmployeeID"), rs.getString("Name"));
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }

        return user;
    }

    public SessionUserInfo memberLogin(String userID, String userPassword) {
        Connection conn = null;
        SessionUserInfo user = null;

        try {
            conn = pool.getConnection();

            String mySQL = "SELECT * " +
                    "FROM CUSTOMERS c INNER JOIN MEMBERS m " +
                    "ON (c.CustomerID = m.CustomerID) " +
                    "WHERE m.ID = '" + userID + "' AND m.Password = '" + userPassword + "'";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(mySQL);

            if (rs.next()) {
                user = new SessionUserInfo(
                        rs.getString("CustomerID"),
                        rs.getString("Name"),
                        rs.getString("GradeID"));
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return user;
    }

    public SessionUserInfo customerLogin(String userID) {
        Connection conn = null;
        SessionUserInfo user = null;

        try {
            conn = pool.getConnection();

            String mySQL = "SELECT * " +
                    "FROM CUSTOMERS " +
                    "WHERE PhoneNumber = '" + userID + "' AND GradeID = 0";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(mySQL);

            // 로그인 한 적이 있는 고객
            if (rs.next()) {
                user = new SessionUserInfo(rs.getString("CustomerID"),
                        userID, // 비회원은 전화번호로 대체
                        rs.getString("GradeID"));
            }
            // 첫 방문 고객
            else {
                String mySQL2 = "INSERT INTO CUSTOMERS(CustomerID, PhoneNumber, GradeID) " +
                        "VALUES (SEQ_Customers.NEXTVAL, '" + userID + "', 0)";
                Statement stmt2 = conn.createStatement();
                if(stmt2.executeUpdate(mySQL2) == 0) {
                    throw new Exception("update fail");
                }
                stmt2.close();

                // 다시 조회
                Statement stmt3 = conn.createStatement();
                ResultSet rs2 = stmt3.executeQuery(mySQL);
                if (rs2.next()) {
                    user = new SessionUserInfo(rs.getString("CustomerID"),
                            userID, // 비회원은 전화번호로 대체
                            rs.getString("GradeID"));
                }
                stmt3.close();
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return user;
    }

}
