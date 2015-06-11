package woodrimsTheater;

import javax.sql.PooledConnection;
import java.sql.*;

public class CustomerManager {

    private PooledConnection pool = null;

    public CustomerManager() {
        DBConnection dbConnection = DBConnection.getInstance();
        pool = dbConnection.getPool();
    }

    public CustomerInfo getCustomerInfo(int customerID) {
        Connection conn = null;
        CustomerInfo customerInfo = null;

        try {
            conn = pool.getConnection();

            String mySQL = "SELECT * " +
                    "FROM CUSTOMERS c " +
                    "INNER JOIN MEMBERS m " +
                    "ON (c.CustomerID = m.CustomerID) " +
                    "INNER JOIN MEMBER_GRADE mg " +
                    "ON (c.GradeID = mg.GradeID) " +
                    "WHERE m.CustomerID = '" + customerID + "'";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(mySQL);

            if (rs.next()) {
                customerInfo = new CustomerInfo(
                        rs.getString("ID"), rs.getString("Password"),
                        rs.getString("Name"), rs.getString("Sex"),
                        rs.getDate("Birthdate"), rs.getString("Email"),
                        rs.getString("PhoneNumber"), rs.getDate("RegisterDate"),
                        rs.getString("GradeName"), rs.getInt("Point")
                );
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return customerInfo;
    }

    public boolean updateCustomer(int customerID, String password, String sex, String email) {
        Connection conn = null;
        boolean success = false;

        try {
            conn = pool.getConnection();

            String mySQL = "UPDATE MEMBERS SET " +
                    "Password=?,Sex=?,Email=? " +
                    "WHERE CustomerID=?";

            PreparedStatement pstmt = conn.prepareStatement(mySQL);
            pstmt.setString(1, password);
            pstmt.setString(2, sex);
            pstmt.setString(3, email);
            pstmt.setInt(4, customerID);

            if(pstmt.executeUpdate() != 0) {
                success = true;
            }

            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return success;
    }

    public SessionUserInfo insertCustomer(int customerID,
                               String id, String password, String name,
                               String sex, String birthdate,
                               String email) {
        Connection conn = null;
        SessionUserInfo user = null;

        try {
            conn = pool.getConnection();

            String mySQL = "INSERT INTO MEMBERS" +
                    "(CustomerID,ID,Password,Name,Sex," +
                    "BirthDate,Email,RegisterDate,Point) " +
                    "VALUES (?,?,?,?,?,?,?,CURRENT_DATE,100)";

            PreparedStatement pstmt = conn.prepareStatement(mySQL);
            pstmt.setInt(1, customerID);
            pstmt.setString(2, id);
            pstmt.setString(3, password);
            pstmt.setString(4, name);
            pstmt.setString(5, sex);
            pstmt.setString(6, birthdate);
            pstmt.setString(7, email);

            if(pstmt.executeUpdate() != 0) {

                String mySQL2 = "UPDATE CUSTOMERS SET " +
                        "GradeID=1 " +
                        "WHERE CustomerID=?";

                PreparedStatement pstmt2 = conn.prepareStatement(mySQL2);
                pstmt2.setInt(1, customerID);

                if(pstmt2.executeUpdate() != 0) {
                    user = new SessionUserInfo(""+customerID, name, "1");
                }
                pstmt2.close();
            }

            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return user;
    }

    public boolean deleteCustomer(int customerID) {
        Connection conn = null;
        boolean success = false;

        try {
            conn = pool.getConnection();

            String mySQL = "DELETE FROM MEMBERS " +
                    "WHERE CustomerID = ?";

            PreparedStatement pstmt = conn.prepareStatement(mySQL);
            pstmt.setInt(1, customerID);

            if(pstmt.executeUpdate() != 0) {
                success = true;
            }

            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return success;
    }

}
