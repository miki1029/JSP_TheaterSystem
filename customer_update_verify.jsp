<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html> 
<head><title> 고객정보 수정 </title></head>
<body>
<%@ include file="top.jsp" %>
<%
	String m_ID = session_cid;
	String m_pwd = new String(request.getParameter("m_pwd").getBytes("8859_1"),"utf-8"); 
	String m_name = new String(request.getParameter("m_name").getBytes("8859_1"),"utf-8"); 
	String m_sex = new String(request.getParameter("m_sex").getBytes("8859_1"),"utf-8"); 
//	Date m_birth = new String(request.getParameter("m_brith").getBytes("8859_1"),"utf-8"); 
	String m_email = new String(request.getParameter("m_email").getBytes("8859_1"),"utf-8"); 

	Connection myConn = null;  
	Statement stmt = null;  
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
    mySQL = "update memebers ";
	mySQL = mySQL + " set Password = '" + m_pwd + "' , " ;	
	mySQL = mySQL + " set Name = '" + m_name + "' , " ;	
	mySQL = mySQL + " set Sex = '" + m_sex + "' , " ;	
//	mySQL = mySQL + " set Birthdate = '" + m_birth + "' , " ;	
	mySQL = mySQL + " set Email = '" + m_email + "' , " ;	
	mySQL = "where CustomerID = '" + m_ID + "' "; 
	try  {
	  stmt.executeQuery(mySQL);  
%>

<script>
  alert("고객님의 정보가 수정되었습니다.");       
  location.href="customer_update.jsp";
</script>
<%    
     } catch(SQLException ex) {
  	   String sMessage;
   	   if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	  else sMessage="잠시 후 다시 시도하십시오";	
%>
<script>
	alert("<%= sMessage %>");    
	location.href = "customer_update.jsp";
</script>
<%	
	} finally {
		if (stmt != null)   try { 	stmt.close();  myConn.close(); }
		catch(SQLException ex) { }
	}
%>
</body></html>



   