<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="admin_top.jsp" %>
<% 
	if (session_eid==null) response.sendRedirect("login.jsp");

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
            "FROM EMPLOYEES e INNER JOIN SCREEN_ROOM_MANAGER s " +
            "ON (e.EmployeeID = s.EmployeeID) " +
            "WHERE e.Role = 'screen_room_manager'";
			
	myResultSet = stmt.executeQuery(mySQL);
	%>
		 <h2 align="center">*****스크린 관리요원*****</h2>
	<%
	
	if (myResultSet != null) {
		while(myResultSet.next()) {
		int s_ID = myResultSet.getInt("EmployeeID");
		String s_name = myResultSet.getString("Name");
		String s_sex = myResultSet.getString("Sex");
		Date s_hdate = myResultSet.getDate("HireDate");
		String s_role = myResultSet.getString("Role");
		String s_position = myResultSet.getString("Position");
		String s_phone = myResultSet.getString("PhoneNumber");
		int s_roomnum = myResultSet.getInt("RoomNumber");
%>


  <table width="75%" align="center" border>
     <tr><th>직원 ID</th>
         <td><%= s_ID %></td>
     </tr>
	 <tr><th>이름</th>
         <td> <%= s_name %></td>
     </tr>
	 <tr><th>성별</th>
         <td> <%= s_sex %></td>
     </tr>
	 <tr><th>고용일</th>
         <td> <%= s_hdate %></td>
     </tr>
	 <tr><th>전화번호</th>
         <td><%= s_phone %></td>
     </tr>		 
	 <tr><th>직무</th>
         <td><%= s_role %></td>
     </tr>
	 <tr><th>직급</th>
         <td><%= s_position %></td>
     </tr>
		   
	 <br><br>
	 
	 
	 <%
		}
	}
	%>
	 
<%
	mySQL = "SELECT * " +
            "FROM EMPLOYEES e INNER JOIN TICKET_SELLER t " +
            "ON (e.EmployeeID = t.EmployeeID) " +
            "WHERE e.Role = 'ticket_seller'";
			
	myResultSet = stmt.executeQuery(mySQL);
	%>
		 <h2 align="center">*****티켓 판매직원*****</h2>
	<%	
	if (myResultSet != null) {
		while(myResultSet.next()) {
		int t_ID = myResultSet.getInt("EmployeeID");
		String t_name = myResultSet.getString("Name");
		String t_sex = myResultSet.getString("Sex");
		Date t_hdate = myResultSet.getDate("HireDate");
		String t_role = myResultSet.getString("Role");
		String t_position = myResultSet.getString("Position");
		String t_phone = myResultSet.getString("PhoneNumber");
		int t_tbox = myResultSet.getInt("TicketboxID");

%>	 
	 
  <table width="75%" align="center" border>
     <tr><th>직원 ID</th>
         <td><%= t_ID %></td>
     </tr>
	 <tr><th>이름</th>
         <td> <%= t_name %></td>
     </tr>
	 <tr><th>성별</th>
         <td> <%= t_sex %></td>
     </tr>
	 <tr><th>고용일</th>
         <td> <%= t_hdate %></td>
     </tr>
	 <tr><th>전화번호</th>
         <td><%= t_phone %></td>
     </tr>		 
	 <tr><th>직무</th>
         <td><%= t_role %></td>
     </tr>
	 <tr><th>직급</th>
         <td><%= t_position %></td>
     </tr>
		   
	 <br><br> 
	 
	 
	 
	 
	 <%
		}
	}
	 
	 %>
	 	 
	 	 
<%
	mySQL = "SELECT * " +
            "FROM EMPLOYEES e INNER JOIN CLEANER c " +
            "ON (e.EmployeeID = c.EmployeeID) " +
            "WHERE e.Role = 'cleaner'";
			
	myResultSet = stmt.executeQuery(mySQL);
	%>
		 <h2 align="center">*****극장 청소직원*****</h2>
	<%	
	if (myResultSet != null) {
		while(myResultSet.next()) {
		int c_ID = myResultSet.getInt("EmployeeID");
		String c_name = myResultSet.getString("Name");
		String c_sex = myResultSet.getString("Sex");
		Date c_hdate = myResultSet.getDate("HireDate");
		String c_role = myResultSet.getString("Role");
		String c_position = myResultSet.getString("Position");
		String c_phone = myResultSet.getString("PhoneNumber");
		String c_dist = myResultSet.getString("District");

%>	 
	 
  <table width="75%" align="center" border>
     <tr><th>직원 ID</th>
         <td><%= c_ID %></td>
     </tr>
	 <tr><th>이름</th>
         <td> <%= c_name %></td>
     </tr>
	 <tr><th>성별</th>
         <td> <%= c_sex %></td>
     </tr>
	 <tr><th>고용일</th>
         <td> <%= c_hdate %></td>
     </tr>
	 <tr><th>전화번호</th>
         <td><%= c_phone %></td>
     </tr>		 
	 <tr><th>직무</th>
         <td><%= c_role %></td>
     </tr>
	 <tr><th>직급</th>
         <td><%= c_position %></td>
     </tr>
		   
	 <br><br> 
	 
	 
	 <%
		}
	}
	 
	 %>


	 
<%
	stmt.close();  
	myConn.close();
%>
</table>
<br><br>
	
	<input type="submit" value="수정">
	
</body></html>
