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
    location.href = "nonmember_login.jsp";
</script>
<%
}
else {
%>
<table width="75%" align="center" border>
<%
    int showingID = Integer.parseInt(request.getParameter("showingID"));
    int rowCnt = 0;
    int columnCnt = 0;

    Connection myConn = null;
    ResultSet myResultSet = null;
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

    // get room seats size
    CallableStatement cstmt = myConn.prepareCall("{call getRoomSize(?, ?, ?)}");
    cstmt.setInt(1, showingID);
    cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
    cstmt.registerOutParameter(3, java.sql.Types.INTEGER);

    cstmt.execute();

    rowCnt = cstmt.getInt(2);
    columnCnt = cstmt.getInt(3);
    cstmt.close();

    // draw seat
    for(int row=1; row<=rowCnt; row++) {
%>
    <tr>
    <%
        for(int column=1; column<=columnCnt; column++) {
            CallableStatement cstmt2 = myConn.prepareCall("{call isReserved(?, ?, ?, ?)}");
            cstmt2.setInt(1, showingID);
            cstmt2.setInt(2, row);
            cstmt2.setInt(3, column);
            cstmt2.registerOutParameter(4, java.sql.Types.INTEGER);

            cstmt2.execute();

            int result = cstmt2.getInt(4);
            String seatLink = null;
            if(result == 0) {
                seatLink = "<a href='reserve_verify.jsp?showingID=" + showingID +
                        "&row=" + row + "&column=" + column + "'>" +
                        "[" + row + "," + column + "]</a>";
            }
            else {
                seatLink = "예약됨";
            }
            cstmt2.close();
    %>
        <td align="center"><%=seatLink%></td>
    <%
        }
    %>
    </tr>
<%
    }
%>
</table>

<%
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
<br />
<table align="center" border cellpadding="10px">
    <tr>
        <td>상영관 가격(+)</td>
        <td><%=roomPrice%></td>
    </tr>
    <tr>
        <td>주말/공휴일 추가 비용(+)</td>
        <td><%=holidayExtra%></td>
    </tr>
    <tr>
        <td>조조/심야 할인(-)</td>
        <td><%=timeDiscount%></td>
    </tr>
    <tr>
        <td>멤버쉽 할인(-)</td>
        <td><%=memberDiscount%></td>
    </tr>
    <tr>
        <td>최종 가격</td>
        <td><%=finalPrice%></td>
    </tr>
</table>

<%
    if (session_cid==null) {
%>
<br />
<div align="center">멤버쉽 혜택을 받으려면 먼저 로그인 해 주세요.</div>
<%
        }
        myConn.close();
    }
%>

</body>
</html>
