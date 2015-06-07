<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
    String userType = request.getParameter("userType");
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");
    String loginURL = loginURL = "login.jsp";
    String redirectURL = request.getParameter("redirectURL");
    if(redirectURL == null) {
        redirectURL = "main.jsp";
    }

    Connection myConn = null;
    String mySQL = null;

    String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
    String user="ST2009111979"; 		// 본인 아이디(ex.ST0000000000)
    String passwd="ST2009111979";   // 본인 패스워드(ex.ST0000000000)
    String dbdriver = "oracle.jdbc.OracleDriver";

    Class.forName(dbdriver);
    myConn =  DriverManager.getConnection (dburl, user, passwd);

    // admin
    if(userType.equals("admin")) {
        loginURL = "admin_login.jsp";

        mySQL = "SELECT * " +
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
    }
    // member
    else if(userType.equals("member")) {
        loginURL = "login.jsp";

        mySQL = "SELECT * " +
                "FROM CUSTOMERS c INNER JOIN MEMBERS m " +
                "ON (c.CustomerID = m.CustomerID) " +
                "WHERE m.ID = '" + userID + "' AND m.Password = '" + userPassword + "'";

        Statement stmt = myConn.createStatement();

        ResultSet myResultSet = stmt.executeQuery(mySQL);

        if (myResultSet.next()) {
            String cID = myResultSet.getString("CustomerID");
            String cName = myResultSet.getString("Name");
            String cGrade = myResultSet.getString("GradeID");

            session.setAttribute("cID", cID);
            session.setAttribute("cName", cName);
            session.setAttribute("cGrade", cGrade);
            response.sendRedirect("main.jsp");
        }
        stmt.close();
    }
    else if(userType.equals("customer")) {
        loginURL = "nonmember_login.jsp";
        mySQL = "SELECT * " +
                "FROM CUSTOMERS " +
                "WHERE PhoneNumber = '" + userID + "' AND GradeID = 0";

        Statement stmt = myConn.createStatement();

        ResultSet myResultSet = stmt.executeQuery(mySQL);
        // 로그인 한 적이 있는 고객
        if (myResultSet.next()) {
            String cID = myResultSet.getString("CustomerID");
            String cGrade = myResultSet.getString("GradeID");

            session.setAttribute("cID", cID);
            session.setAttribute("cName", userID); // 비회원은 전화번호로 대체
            session.setAttribute("cGrade", cGrade);
            response.sendRedirect(redirectURL);
        }
        // 첫 방문 고객
        else {
            String mySQL2 = "INSERT INTO CUSTOMERS(CustomerID, PhoneNumber, GradeID) " +
                    "VALUES (SEQ_Customers.NEXTVAL, '" + userID + "', 0)";
            Statement stmt2 = myConn.createStatement();
            if(stmt2.executeUpdate(mySQL2) == 0) {
                throw new Exception("update fail");
            }
            stmt2.close();

            // 다시 조회
            Statement stmt3 = myConn.createStatement();
            ResultSet myResultSet3 = stmt3.executeQuery(mySQL);
            if (myResultSet3.next()) {
                String cID = myResultSet3.getString("CustomerID");
                String cGrade = myResultSet.getString("GradeID");

                session.setAttribute("cID", cID);
                session.setAttribute("cName", userID); // 비회원은 전화번호로 대체
                session.setAttribute("cGrade", cGrade);
                response.sendRedirect(redirectURL);
            }
            stmt3.close();
        }
        stmt.close();
    }
%>
<script>
	alert("사용자 아이디 혹은 암호가 틀렸습니다");
    location.href = "<%=loginURL%>";
</script>
<%
    myConn.close();
%>
