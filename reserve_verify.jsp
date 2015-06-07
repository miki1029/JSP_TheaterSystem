<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<%
    int showingID = Integer.parseInt(request.getParameter("showingID"));
    int row = Integer.parseInt(request.getParameter("row"));
    int column = Integer.parseInt(request.getParameter("column"));

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

    // insert ticket
    // point up
    // grade up

    CallableStatement cstmt = myConn.prepareCall("{call InsertTicket(?, ?, ?, ?, ?)}");
    cstmt.setInt(1, Integer.parseInt(session_cid));
    cstmt.setInt(2, column);
    cstmt.setInt(3, row);
    cstmt.setInt(4, showingID);
    cstmt.setInt(5, finalPrice);

    //try {
        cstmt.execute();
%>
<script>
    alert("예매가 완료되었습니다.");
    location.href="reserve_list.jsp";
</script>
<%
//    } catch(SQLException ex) {
//        System.err.println("SQLException: " + ex.getMessage());
//    } finally {
//        if(cstmt != null) {
//            try {
                myConn.commit();
                cstmt.close();
                myConn.close();
//            } catch(SQLException ex) { }
//        }
//    }
%>
</body>
</html>
