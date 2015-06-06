<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
    String userType = request.getParameter("userType");
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");

    Connection myConn = null;
    String mySQL = null;

    String dburl  = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
    String user="ST2009111979"; 		// 본인 아이디(ex.ST0000000000)
    String passwd="ST2009111979";   // 본인 패스워드(ex.ST0000000000)
    String dbdriver = "oracle.jdbc.OracleDriver";

    Class.forName(dbdriver);
    myConn =  DriverManager.getConnection (dburl, user, passwd);

    if(userType.equals("employee")) {
        mySQL = "SELECT * " +
                "FROM EMPLOYEES " +
                "WHERE EmployeeID = ? AND Password = ?";

        PreparedStatement pstmt = myConn.prepareStatement(mySQL);
        pstmt.setString(1, userID);
        pstmt.setString(2, userPassword);

        ResultSet myResultSet = pstmt.executeQuery();
        if (myResultSet.next()) {
            String eID = myResultSet.getString("EmployeeID");
            String eName = myResultSet.getString("Name");
            String eRole = myResultSet.getString("Role");
            session.setAttribute("eID", eID);
            session.setAttribute("eName", eName);
            session.setAttribute("eRole", eRole);
            response.sendRedirect("admin_main.jsp");
        }
    }
    else if(userType.equals("member")) {
        mySQL = "SELECT *" +
                "FROM MEMBERS" +
                "WHERE CustomerID = ? AND Password = ?";

        PreparedStatement pstmt = myConn.prepareStatement(mySQL);
        pstmt.setString(1, userID);
        pstmt.setString(2, userPassword);

        ResultSet myResultSet = pstmt.executeQuery();
        if (myResultSet.next()) {
            String cID = myResultSet.getString("CustomerID");
            String cName = myResultSet.getString("Name");
            String cGrade = myResultSet.getString("MemberGrade");

            session.setAttribute("cID", cID);
            session.setAttribute("cName", cName);
            session.setAttribute("cGrade", cGrade);
            response.sendRedirect("main.jsp");
        }
    }
    else if(userType.equals("customer")) {
        mySQL = "SELECT * " +
                "FROM CUSTOMERS " +
                "WHERE CustomerID = ?";

        PreparedStatement pstmt = myConn.prepareStatement(mySQL);
        pstmt.setString(1, userID);

        ResultSet myResultSet = pstmt.executeQuery();
        if (myResultSet.next()) {
            String cID = myResultSet.getString("CustomerID");
            String cGrade = myResultSet.getString("MemberGrade");

            session.setAttribute("cID", cID);
            session.setAttribute("cName", cID); // 비회원은 고객번호로 대체
            session.setAttribute("cGrade", cGrade);
            response.sendRedirect("main.jsp");
        }
    }
%>
<script>
	alert("사용자아이디 혹은 암호가 틀렸습니다");
    location.href = "login.jsp";
</script>
<%
    stmt.close();
    myConn.close();
%>
  
  
  
