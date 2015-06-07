<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="admin_top.jsp" %>
<table width="85%" align="center" border>
    <tr>
        <th>영화 제목</th>
        <th>시작 시간</th>
        <th>종료 시간</th>
        <th>상영관</th>
        <th>수정</th>
        <th>삭제</th>
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

        mySQL = "SELECT si.showingid, m.moviename, " +
                "TO_CHAR(si.starttime,'YYYY/MM/DD HH24:MI:SS') starttime, " +
                "TO_CHAR(si.endtime,'YYYY/MM/DD HH24:MI:SS') endtime, " +
                "sm.theatertype, sm.roomnumber " +
                "FROM SHOWING_INFO si " +
                "INNER JOIN MOVIES m ON (si.MovieID = m.MovieID) " +
                "INNER JOIN SCREEN_ROOM sm ON (si.RoomNumber = sm.RoomNumber) " +
                "ORDER BY starttime";

        Statement stmt = myConn.createStatement();
        myResultSet = stmt.executeQuery(mySQL);

        if(myResultSet != null) {
            while(myResultSet.next()) {
                int showingID = myResultSet.getInt("showingid");
                String movieName = myResultSet.getString("moviename");
                String startTime = myResultSet.getString("starttime");
                String endTime = myResultSet.getString("endtime");
                String theaterType = myResultSet.getString("theatertype");
                int roomNumber = myResultSet.getInt("roomnumber");

    %>
    <tr>
        <td align="center"><%=movieName%></td>
        <td align="center"><%=startTime%></td>
        <td align="center"><%=endTime%></td>
        <td align="center"><%=theaterType%> <%=roomNumber%>관</td>
        <td align="center">
            <a href="admin_showing_modify.jsp?showingID=<%=showingID%>">
                수정
            </a>
        </td>
        <td align="center">
            <a href="admin_showing_delete.jsp?showingID=<%=showingID%>">
                삭제
            </a>
        </td>
    </tr>
    <%
            }
        }
        stmt.close();
        myConn.close();
    %>
    <tr>
        <td colspan="6" align="center">
            <a href="admin_showing_insert.jsp">
                추가
            </a>
        </td>
    </tr>
</table>

</body>
</html>
