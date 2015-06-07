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
            "FROM MOVIES m " +
            "INNER JOIN MOVIES_GENRE mg " +
            "ON (m.MovieID = mg.MovieID) " +
            "INNER JOIN GENRE g " +
            "ON (mg.GenreID = g.GenreID) ";

    myResultSet = stmt.executeQuery(mySQL);

    if (myResultSet != null) {
        while(myResultSet.next()) {
            int movieID = myResultSet.getInt("MovieID");
            String movieName = myResultSet.getString("MovieName");
            String director = myResultSet.getString("Director");
            String mainActor = myResultSet.getString("MainActor");
            String synopsis = myResultSet.getString("Synopsis");
            int runningTime = myResultSet.getInt("RunningTime");
            int movieGrade = myResultSet.getInt("MovieGrade");
            String releasedDate = myResultSet.getString("ReleasedDate");
            String expiredDate = myResultSet.getString("ExpiredDate");
            String genre = "";

            Statement stmt2 = myConn.createStatement();

            String mySQL2 = "SELECT * " +
                    "FROM MOVIES_GENRE mg " +
                    "INNER JOIN Genre g ON (mg.GenreID = g.GenreID) " +
                    "WHERE MovieID = " + movieID;

            ResultSet genreResultSet = stmt2.executeQuery(mySQL2);

            while(genreResultSet.next()) {
                genre += genreResultSet.getString("GenreName") + " ";
            }
            stmt2.close();
%>


<table width="75%" align="center" border>
    <tr><th width="100px">영화 제목</th>
        <td><%= movieName %></td>
    </tr>
    <tr><th>감독</th>
        <td> <%= director %></td>
    </tr>
    <tr><th>주연 배우</th>
        <td> <%= mainActor %></td>
    </tr>
    <tr><th>줄거리</th>
        <td> <%= synopsis %></td>
    </tr>
    <tr><th>상영 시간</th>
        <td><%= runningTime %> 분</td>
    </tr>
    <tr><th>등급</th>
        <td><%= movieGrade %>세 이상</td>
    </tr>
    <tr><th>개봉일</th>
        <td><%= releasedDate %></td>
    </tr>
    <tr><th>종영일</th>
        <td><%= expiredDate %></td>
    </tr>
    <tr><th>장르</th>
        <td><%=genre%></td>
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
