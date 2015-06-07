<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html> 
<head><title> 고객정보 수정 </title></head>
<body>
<%@ include file="top.jsp" %>
<%
	String m_pwd = new String(request.getParameter("m_pwd").getBytes("8859_1"),"utf-8"); 
	String m_name = new String(request.getParameter("m_name").getBytes("8859_1"),"utf-8"); 
	String m_sex = new String(request.getParameter("m_sex").getBytes("8859_1"),"utf-8");
	String m_email = new String(request.getParameter("m_email").getBytes("8859_1"),"utf-8"); 

	Connection myConn = null;  
	PreparedStatement pstmt = null;
	String mySQL = "";

	String dburl  = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user="ST2009111979"; 		  // 본인 아이디(ex.ST0000000000)
	String passwd="ST2009111979";   // 본인 패스워드(ex.ST0000000000)
	String dbdriver = "oracle.jdbc.driver.OracleDriver";    

    Class.forName(dbdriver);
    myConn =  DriverManager.getConnection (dburl, user, passwd);


    mySQL = "UPDATE MEMBERS SET " +
            "Password=?,Name=?,Sex=?,Email=? " +
            "WHERE CustomerID=?";

    try {
        pstmt = myConn.prepareStatement(mySQL);
        pstmt.setString(1, m_pwd);
        pstmt.setString(2, m_name);
        pstmt.setString(3, m_sex);
        pstmt.setString(4, m_email);
        pstmt.setInt(5, Integer.parseInt(session_cid));

        if(pstmt.executeUpdate() == 0) {
            throw new SQLException();
        }
%>
<script>
    alert("고객님의 정보가 수정되었습니다.");
    location.href="customer_update.jsp";
</script>
<%
    } catch (SQLException e) {
        e.printStackTrace();
%>
<script>
    alert("SQL Error");
    location.href = "update.jsp";
</script>
<%
} finally {
        pstmt.close();
    }
%>
</body></html>



   