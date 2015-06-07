<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<%
    if (session_cid==null) {
%>
<script>
    location.href = "nonmember_login.jsp?redirectURL=reserve_list.jsp";
</script>
<%
    }
    else {
%>
<table width="85%" align="center" border>
    <tr>
        <th>티켓 번호</th>
        <th>영화 제목</th>
        <th>상영관</th>
        <th>좌석</th>
        <th>시작 시간</th>
        <th>종료 시간</th>
        <th>가격</th>
        <th>취소</th>
    </tr>

    <%
        Connection myConn = null;
        ResultSet myResultSet = null;
        String mySQL = "";
        String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
        String user = "ST2009111979";
        String passwd = "ST2009111979";
        String dbdriver = "oracle.jdbc.driver.OracleDriver";

        try {
            Class.forName(dbdriver);
            myConn = DriverManager.getConnection(dburl, user, passwd);
        } catch(SQLException ex) {
            System.err.println("SQLException: " + ex.getMessage());
        }

        mySQL = "SELECT ticketid, moviename, roomnumber, theatertype, seatrow, seatcolumn, " +
                "TO_CHAR(si.starttime,'YYYY/MM/DD HH24:MI:SS') starttime, " +
                "TO_CHAR(si.endtime,'YYYY/MM/DD HH24:MI:SS') endtime, " +
                "si.showingid, t.customerid " +
                "FROM TICKET t " +
                "INNER JOIN SHOWING_INFO si ON (t.ShowingID = si.ShowingID) " +
                "INNER JOIN SCREEN_ROOM sm ON (si.RoomNumber = sm.RoomNumber) " +
                "INNER JOIN MOVIES m ON (si.MovieID = m.MovieID) " +
                "WHERE customerid = " + session_cid + " " +
                "ORDER BY starttime";

        Statement stmt = myConn.createStatement();
        myResultSet = stmt.executeQuery(mySQL);

        if(myResultSet != null) {
            while(myResultSet.next()) {
                int ticketID = myResultSet.getInt("ticketid");
                String movieName = myResultSet.getString("moviename");
                int roomNumber = myResultSet.getInt("roomnumber");
                String theaterType = myResultSet.getString("theatertype");
                int seatRow = myResultSet.getInt("seatrow");
                int seatColumn = myResultSet.getInt("seatcolumn");
                String startTime = myResultSet.getString("starttime");
                String endTime = myResultSet.getString("endtime");
                int showingID = myResultSet.getInt("showingid");

                // get price
                CallableStatement cstmt3 = myConn.prepareCall("{call getSecondPrice(?, ?, ?, ?, ?, ?, ?)}");
                cstmt3.setInt(1, showingID);
                cstmt3.setInt(2, Integer.parseInt(session_cid));
                cstmt3.registerOutParameter(3, java.sql.Types.INTEGER);
                cstmt3.registerOutParameter(4, java.sql.Types.INTEGER);
                cstmt3.registerOutParameter(5, java.sql.Types.INTEGER);
                cstmt3.registerOutParameter(6, java.sql.Types.INTEGER);
                cstmt3.registerOutParameter(7, java.sql.Types.INTEGER);

                cstmt3.execute();

                int finalPrice = cstmt3.getInt(3);
                int roomPrice = cstmt3.getInt(4);
                int memberDiscount = cstmt3.getInt(5);
                int timeDiscount = cstmt3.getInt(6);
                int holidayExtra = cstmt3.getInt(7);

                cstmt3.close();
%>
    <tr>
        <td align="center"><%=ticketID%></td>
        <td align="center"><%=movieName%></td>
        <td align="center"><%=theaterType%> <%=roomNumber%>관</td>
        <td align="center">[<%=seatRow%>,<%=seatColumn%>]</td>
        <td align="center"><%=startTime%></td>
        <td align="center"><%=endTime%></td>
        <td align="center"><%=finalPrice%></td>
        <td align="center">
            <a href="reserve_cancel.jsp?ticketID=<%=ticketID%>">
                취소
            </a>
        </td>
    </tr>
<%
            }
        }
        stmt.close();
        myConn.close();
    }
%>
</table>
</body>
</html>
