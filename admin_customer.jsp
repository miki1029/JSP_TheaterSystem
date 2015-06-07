<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="admin_top.jsp" %>
<%
    Connection myConn = null;
    Statement stmt = null;
    ResultSet myResultSet = null;
    String mySQL = "";

    String dburl  = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
    String user="ST2009111979"; 		  // 본인 아이디(ex.ST0000000000)
    String passwd="ST2009111979";   // 본인 패스워드(ex.ST0000000000)
    String dbdriver = "oracle.jdbc.driver.OracleDriver";

    try {
        Class.forName(dbdriver);
        myConn =  DriverManager.getConnection (dburl, user, passwd);
        stmt = myConn.createStatement();
    } catch(SQLException ex) {
        System.err.println("SQLException: " + ex.getMessage());
    }
    mySQL = "SELECT * " +
            "FROM CUSTOMERS c " + 
            "INNER JOIN MEMBERS m " + 
            "ON (c.CustomerID = m.CustomerID) " +
            "INNER JOIN MEMBER_GRADE g " + 
            "ON (c.GradeID = g.GradeID) " +
            "WHERE c.GradeID <> 0";

    myResultSet = stmt.executeQuery(mySQL);
%>
<h2 align="center">*****회원 명단*****</h2>
<%

    if (myResultSet != null) {
        while(myResultSet.next()) {
            int m_CID = myResultSet.getInt("CustomerID");
            String m_ID = myResultSet.getString("ID");
            String m_name = myResultSet.getString("Name");
            //String m_pwd = myResultSet.getString("Password");
            Date m_rgdate = myResultSet.getDate("RegisterDate");
            String m_sex = myResultSet.getString("Sex");
            Date m_birth = myResultSet.getDate("Birthdate");
            String m_email = myResultSet.getString("Email");
            int m_point = myResultSet.getInt("Point");
            String m_gname = myResultSet.getString("GradeName");
            
%>


<table width="75%" align="center" border>
    <tr><th width="150">고객 식별ID</th>
        <td><%= m_CID %></td>
    </tr>
    <tr><th>고객 회원ID</th>
        <td> <%= m_ID %></td>
    </tr>
    <tr><th>적립된 포인트</th>
        <td> <%= m_point %></td>
    </tr> 
    <tr><th>회원 등급</th>
        <td> <%= m_gname %></td>
    </tr>    
    <tr><th>이름</th>
        <td> <%= m_name %></td>
    </tr>
    <tr><th>성별</th>
        <td> <%= m_sex %></td>
    </tr>
    <tr><th>생일</th>
        <td><%= m_birth %></td>
    </tr>
    <tr><th>이메일</th>
        <td><%= m_email %></td>
    </tr>
    <tr><th>등록일</th>
        <td><%= m_rgdate %></td>
    </tr>
</table>
<br />
<%
		}
	}

	mySQL = "SELECT * " +
            "FROM CUSTOMERS c INNER JOIN MEMBER_GRADE m " +
            "ON (c.GradeID = m.GradeID) " +
            "WHERE c.GradeID = 0";
			
	myResultSet = stmt.executeQuery(mySQL);
%>
    <h2 align="center">*****비회원 고객 명단*****</h2>
<%
	if (myResultSet != null) {
		while(myResultSet.next()) {
		int c_ID = myResultSet.getInt("CustomerID");
		String c_phone = myResultSet.getString("PhoneNumber");
		int c_GID = myResultSet.getInt("GradeID");
		String c_gname = myResultSet.getString("GradeName");

%>

<table width="75%" align="center" border>
    <tr><th width="150">고객 ID</th>
        <td><%= c_ID %></td>
    </tr>
    <tr><th>전화번호</th>
        <td><%= c_phone %></td>
    </tr>
</table>
<br /> 
<%
        }
    }

    stmt.close();
    myConn.close();
%>

<%--<input type="submit" value="수정">--%>

</body></html>
