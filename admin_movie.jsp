<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="admin_top.jsp" %>
<table width="75%" align="center" border>
    <tr>
        <th></th>
        <th>분반</th>
        <th>과목명</th>
        <th>학점</th>
        <th>수강신청</th>
    </tr>

    <%
        Connection myConn = null;
        ResultSet myResultSet = null;
        String mySQL = "";
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

//    mySQL = "select * from course";

        mySQL = "select * from course where c_id not in " +
                "(select c_id from enroll where s_id = ? or " +
                "e_year != '2015' or e_semester != '2') " +
                "and c_id in " +
                "(select c_id from teach where t_year = '2015' and t_semester = '2')";

        PreparedStatement pstmt = myConn.prepareStatement(mySQL);
        // session_id String
        pstmt.setString(1, session_eid);

        myResultSet = pstmt.executeQuery();

        if(myResultSet != null) {
            while(myResultSet.next()) {
                String c_id = myResultSet.getString("c_id");
                int c_id_no = myResultSet.getInt("c_id_no");
                String c_name = myResultSet.getString("c_name");
                int c_unit = myResultSet.getInt("c_unit");
    %>
    <tr>
        <td align="center"><%=c_id%></td>
        <td align="center"><%=c_id_no%></td>
        <td align="center">
            <a href="insert_course_info.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>&t_year=2015&t_semester=2">
                <%=c_name%>
            </a>
        </td>
        <td align="center"><%=c_unit%></td>
        <td align="center">
            <a href="insert_verify.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>">
                신청
            </a>
        </td>
    </tr>
    <%
            }
        }
        pstmt.close();
        myConn.close();
    %>
</table>
</body>
</html>
