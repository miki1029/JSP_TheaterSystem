package woodrimsTheater;

import javax.sql.PooledConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class ReserveManager {

    private PooledConnection pool = null;

    public ReserveManager() {
        DBConnection dbConnection = DBConnection.getInstance();
        pool = dbConnection.getPool();
    }

    public Vector getShowingInfo() {
        Connection conn = null;
        Vector vecList = new Vector();

        try {
            conn = pool.getConnection();

            String mySQL = "SELECT si.ShowingID, m.MovieName, " +
                    "TO_CHAR(si.starttime,'YYYY/MM/DD HH24:MI:SS') StartTime, " +
                    "TO_CHAR(si.endtime,'YYYY/MM/DD HH24:MI:SS') EndTime, " +
                    "sm.TheaterType, sm.RoomNumber " +
                    "FROM SHOWING_INFO si " +
                    "INNER JOIN MOVIES m ON (si.MovieID = m.MovieID) " +
                    "INNER JOIN SCREEN_ROOM sm ON (si.RoomNumber = sm.RoomNumber) " +
                    //"WHERE " +
                    "ORDER BY StartTime";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(mySQL);

            while(rs.next()) {
                ShowingInfo showingInfo = new ShowingInfo(
                        rs.getInt("ShowingID"), rs.getString("MovieName"),
                        rs.getString("StartTime"), rs.getString("EndTime"),
                        rs.getString("TheaterType"), rs.getInt("RoomNumber")
                );
                vecList.add(showingInfo);
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return vecList;
    }

    public Vector getRoomSeatsRowColumn(int showingID) {
        Connection conn = null;
        Vector vecList = new Vector();
        int rowCnt = 0;
        int columnCnt = 0;

        try {
            conn = pool.getConnection();

            CallableStatement cstmt = conn.prepareCall("{call getRoomSize(?, ?, ?)}");
            cstmt.setInt(1, showingID);
            cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);

            cstmt.execute();

            rowCnt = cstmt.getInt(2);
            columnCnt = cstmt.getInt(3);

            vecList.add(rowCnt);
            vecList.add(columnCnt);

            cstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return vecList;
    }

    public boolean getReservedState(int showingID, int row, int column) {
        Connection conn = null;
        boolean isReserve = false;

        try {
            conn = pool.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call isReserved(?, ?, ?, ?)}");
            cstmt.setInt(1, showingID);
            cstmt.setInt(2, row);
            cstmt.setInt(3, column);
            cstmt.registerOutParameter(4, java.sql.Types.INTEGER);

            cstmt.execute();

            int result = cstmt.getInt(4);

            if(result == 0) isReserve = false;
            else isReserve = true;

            cstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return isReserve;
    }

    public Vector getPriceInfo(int showingID, int customerID) {
        Connection conn = null;
        Vector vecList = new Vector();

        try {
            conn = pool.getConnection();
            CallableStatement cstmt = conn.prepareCall("{call getSecondPrice(?, ?, ?, ?, ?, ?, ?)}");
            cstmt.setInt(1, showingID);
            cstmt.setInt(2, customerID);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.registerOutParameter(4, java.sql.Types.INTEGER);
            cstmt.registerOutParameter(5, java.sql.Types.INTEGER);
            cstmt.registerOutParameter(6, java.sql.Types.INTEGER);
            cstmt.registerOutParameter(7, java.sql.Types.INTEGER);

            cstmt.execute();

            int finalPrice = cstmt.getInt(3);
            int roomPrice = cstmt.getInt(4);
            int memberDiscount = cstmt.getInt(5);
            int timeDiscount = cstmt.getInt(6);
            int holidayExtra = cstmt.getInt(7);

            vecList.add(finalPrice);
            vecList.add(roomPrice);
            vecList.add(memberDiscount);
            vecList.add(timeDiscount);
            vecList.add(holidayExtra);

            cstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return vecList;
    }

    public Vector getReserveInfo(int customerID) {
        Connection conn = null;
        Vector vecList = new Vector();

        try {
            conn = pool.getConnection();

            String mySQL =
                    "SELECT TicketID, SeatRow, SeatColumn, MovieName, RoomNumber, TheaterType, " +
                    "TO_CHAR(si.starttime,'YYYY/MM/DD HH24:MI:SS') StartTime, " +
                    "TO_CHAR(si.endtime,'YYYY/MM/DD HH24:MI:SS') EndTime, " +
                    "si.ShowingID, t.CustomerID " +
                    "FROM TICKET t " +
                    "INNER JOIN SHOWING_INFO si ON (t.ShowingID = si.ShowingID) " +
                    "INNER JOIN SCREEN_ROOM sm ON (si.RoomNumber = sm.RoomNumber) " +
                    "INNER JOIN MOVIES m ON (si.MovieID = m.MovieID) " +
                    "WHERE CustomerID = " + customerID + " " +
                    "ORDER BY StartTime";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(mySQL);

            while(rs.next()) {
                ReserveInfo reserveInfo = new ReserveInfo(
                        rs.getInt("TicketID"), rs.getInt("SeatRow"), rs.getInt("SeatColumn"),
                        rs.getInt("ShowingID"), rs.getString("MovieName"),
                        rs.getString("StartTime"), rs.getString("EndTime"),
                        rs.getString("TheaterType"), rs.getInt("RoomNumber")
                );
                vecList.add(reserveInfo);
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return vecList;
    }

    public int getShowingIDByTicketID(int ticketID) {
        Connection conn = null;
        int showingID = 0;

        try {
            conn = pool.getConnection();
            String mySQL =
                    "SELECT showingid " +
                    "FROM TICKET " +
                    "WHERE ticketid = '" + ticketID +"'";

            Statement stmt = conn.createStatement();
            ResultSet myResultSet = stmt.executeQuery(mySQL);

            if(myResultSet.next()){
                showingID = myResultSet.getInt("showingid");
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
        return showingID;
    }

    public void insertTicket(int customerID, int column, int row, int showingID, int price) {
        Connection conn = null;

        try {
            conn = pool.getConnection();

            CallableStatement cstmt = conn.prepareCall("{call InsertTicket(?, ?, ?, ?, ?)}");
            cstmt.setInt(1, customerID);
            cstmt.setInt(2, column);
            cstmt.setInt(3, row);
            cstmt.setInt(4, showingID);
            cstmt.setInt(5, price);

            cstmt.execute();

            cstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
    }

    public void deleteTicket(int customerID, int ticketID, int price) {
        Connection conn = null;

        try {
            conn = pool.getConnection();

            CallableStatement cstmt = conn.prepareCall("{call DeleteTicket(?, ?, ?)}");
            cstmt.setInt(1, customerID);
            cstmt.setInt(2, ticketID);
            cstmt.setInt(3, price);

            cstmt.execute();

            cstmt.close();
            conn.close();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
            ex.printStackTrace();
        }
    }
}


