<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
	 <tr><th>*****스크린 관리요원*****</th><tr>
     <tr><th>직원 ID</th>
         <td><%= s_ID %></td>
     </tr>
	 <tr><th>이름</th>
         <td> <%= s_name %></td>
     </tr>
	 <tr><th>성별</th>
         <td> <%= s_name %></td>
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
         <td><%= s_sex %></td>
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
	 <tr><th>*****스크린 관리요원*****</th><tr>
     <tr><th>직원 ID</th>
         <td><%= s_ID %></td>
     </tr>
	 <tr><th>이름</th>
         <td> <%= s_name %></td>
     </tr>
	 <tr><th>성별</th>
         <td> <%= s_name %></td>
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
         <td><%= s_sex %></td>
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
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="수정">
	</td> 
</tr>
</table></form></body></html>
