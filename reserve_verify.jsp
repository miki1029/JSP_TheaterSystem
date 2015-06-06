<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<table width="75%" align="center" border>
    <%
    int showingID = Integer.parseInt(request.getParameter("showingID"));
    int row = Integer.parseInt(request.getParameter("row"));
    int column = Integer.parseInt(request.getParameter("column"));
    int price = Integer.parseInt(request.getParameter("price"));

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

    String mySQL =
        "SELECT * " +
        "FROM EMPLOYEES e INNER JOIN ADMIN a " +
        "ON (e.EmployeeID = a.EmployeeID) " +
        "WHERE a.ID = '" + userID + "' AND a.Password = '" + userPassword + "'";

    Statement stmt = myConn.createStatement();

    ResultSet myResultSet = stmt.executeQuery(mySQL);

    if (myResultSet.next()) {
        String eID = myResultSet.getString("EmployeeID");
        String eName = myResultSet.getString("Name");
        session.setAttribute("eID", eID);
        session.setAttribute("eName", eName);
        response.sendRedirect("admin_main.jsp");
    }
    stmt.close();


    // insert ticket
    // point up
    // grade up

    CallableStatement cstmt = myConn.prepareCall("{call InsertTicket(?, ?, ?, ?, ?, ?)}");
    cstmt.setString(1, c_id);
    cstmt.setInt(2, c_id_no);
    cstmt.setInt(3, t_year);
    cstmt.setInt(4, t_semester);
    cstmt.registerOutParameter(5, java.sql.Types.NUMERIC);
    cstmt.registerOutParameter(6, java.sql.Types.NUMERIC);

    try {
        cstmt.execute();
        resultTMax = cstmt.getInt(5);
        resultTDiff = cstmt.getInt(6);
%>
    <script>
        alert("모집인원은 <%=resultTMax%>명이며, 현재 수강 신청을 할 수 있는 인원은 <%=resultTDiff%>명 입니다.");
        location.href="insert.jsp";
    </script>
        <%
    } catch(SQLException ex) {
        System.err.println("SQLException: " + ex.getMessage());
    } finally {
        if(cstmt != null) {
            try {
                myConn.commit();
                cstmt.close();
                myConn.close();
            } catch(SQLException ex) { }
        }
    }
%>
</body>
</html>
