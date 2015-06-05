<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
    String userType = request.getParameter("userType");
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");

    Connection myConn = null;
    Statement stmt = null;
    String mySQL = null;

    String dburl  = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
    String user="ST2009111979"; 		// 본인 아이디(ex.ST0000000000)
    String passwd="ST2009111979";   // 본인 패스워드(ex.ST0000000000)
    String dbdriver = "oracle.jdbc.OracleDriver";

    Class.forName(dbdriver);
    myConn =  DriverManager.getConnection (dburl, user, passwd);
    stmt = myConn.createStatement();

    if(userType.equals("employee")) {
        mySQL = "SELECT * " +
                "FROM EMPLOYEES " +
                "WHERE EmployeeID = ? AND Password = ?";

        ResultSet myResultSet = stmt.executeQuery(mySQL);
        if (myResultSet.next()) {
            String eID = myResultSet.getString("EmployeeID");
            String eName = myResultSet.getString("Name");
            session.setAttribute("eID", eID);
            session.setAttribute("eName", eName);
            response.sendRedirect("employee_main.jsp");
        }
    }
    else if(userType.equals("member")) {
        mySQL = "SELECT *" +
                "FROM MEMBERS" +
                "WHERE MemberID = ? AND Password = ?";

        ResultSet myResultSet = stmt.executeQuery(mySQL);
        if (myResultSet.next()) {
            String eID = myResultSet.getString("MemberID");
            String eName = myResultSet.getString("Name");
            session.setAttribute("eID", eID);
            session.setAttribute("eName", eName);
            response.sendRedirect("employee_main.jsp");
        }
    }
    else if(userType.equals("customer")) {
        mySQL = "SELECT * " +
                "FROM CUSTOMERS " +
                "WHERE PhoneNumber = ?";
    }

    ResultSet myResultSet = stmt.executeQuery(mySQL);
    if (myResultSet.next()) {
        String userName = myResultSet.getString("s_name");
        session.setAttribute("user", userID);
        session.setAttribute("userName", userName);
        response.sendRedirect("main.jsp");
    } else {
%>
<script>
	alert("사용자아이디 혹은 암호가 틀렸습니다");
    location.href = "login.jsp";
</script>
<%
    }
    stmt.close();
    myConn.close();
%>
  
  
  
