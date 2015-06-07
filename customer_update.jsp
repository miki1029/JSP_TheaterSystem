<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
<html>
<head><title>고객정보 수정</title></head>
<body>
<%@ include file="top.jsp" %>
<%
if (session_cgrade == null || session_cgrade.equals("0")) {
%>
<script>
    alert("회원 전용입니다.");
    location.href = "main.jsp";
</script>
<%
}
else {
	if (session_cid==null) response.sendRedirect("login.jsp");

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
            "INNER JOIN MEMBER_GRADE mg " +
            "ON (c.GradeID = mg.GradeID) " +
            "WHERE m.CustomerID = '" + session_cid + "'";

	myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet.next()) {
		String m_ID = myResultSet.getString("ID").trim();
		String m_pwd = myResultSet.getString("Password").trim();
		String m_name = myResultSet.getString("Name").trim();
		String m_sex = myResultSet.getString("Sex").trim();
		Date m_birth = myResultSet.getDate("Birthdate");
		String m_email = myResultSet.getString("Email").trim();
        String m_phone = myResultSet.getString("PhoneNumber").trim();
		Date m_rgDate = myResultSet.getDate("RegisterDate");
        String m_grade = myResultSet.getString("GradeName").trim();
		int m_point = myResultSet.getInt("Point");
        String isCheckedm = "";
        String isCheckedf = "";

        if(m_sex.equals("m")) {
            isCheckedm = " checked='checked'";
        } else {
            isCheckedf = " checked='checked'";
        }
%>

<form method="post" action="customer_update_verify.jsp">
    <input type="hidden" name="m_id" size="30" value="<%= session_cid %>">
    <table width="75%" align="center" border>
        <tr>
            <th>멤버쉽 ID</th>
            <td><%= m_ID %></td>
        </tr>
        <tr>
            <th>패스워드</th>
            <td><input type="password" name="m_pwd" value="<%=m_pwd%>"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><%= m_name %></td>
        </tr>
        <tr>
            <th>성별</th>
            <td>
                <input type="radio" name="m_sex" value="m"<%=isCheckedm%>>남자
                <input type="radio" name="m_sex" value="f"<%=isCheckedf%>>여자
            </td>
        </tr>
        <tr>
            <th>생일</th>
            <td><%= m_birth %></td>
        </tr>
        <tr>
            <th>이메일 주소</th>
            <td><input type="text" name="m_email" value="<%= m_email %>"> </td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><%= m_phone %></td>
        </tr>
        <tr>
            <th>등록일</th>
            <td><%= m_rgDate %></td>
        </tr>
        <tr>
            <th>회원 등급</th>
            <td><%=m_grade%> (<%= m_point %>점)</td>
        </tr>
 
			   
<%
	}
    else {
%>
<%
    }
	stmt.close();  
	myConn.close();
}
%>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="수정">
	</td> 
</tr>
</table></form></body></html>

