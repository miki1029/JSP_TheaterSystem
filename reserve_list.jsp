<%@ page import="java.sql.*, java.util.*, reserveManager.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<%
    if (session_cid==null) {
%>
<script>
    location.href = "nonmember_login.jsp?redirectURL=reserve_list.jsp";
</script>
<%
    }
    else {
%>
<table width="85%" align="center" border>
    <tr>
        <th>티켓 번호</th>
        <th>영화 제목</th>
        <th>상영관</th>
        <th>좌석</th>
        <th>시작 시간</th>
        <th>종료 시간</th>
        <th>가격</th>
        <th>취소</th>
    </tr>

    <jsp:useBean id="reserveMgr" class="reserveManager.ReserveManager" />
    <%
        ResultSet myResultSet = reserveMgr.getReserveInfo(Integer.parseInt(session_cid));

        if(myResultSet != null) {
            while(myResultSet.next()) {
                int ticketID = myResultSet.getInt("ticketid");
                String movieName = myResultSet.getString("moviename");
                int roomNumber = myResultSet.getInt("roomnumber");
                String theaterType = myResultSet.getString("theatertype");
                int seatRow = myResultSet.getInt("seatrow");
                int seatColumn = myResultSet.getInt("seatcolumn");
                String startTime = myResultSet.getString("starttime");
                String endTime = myResultSet.getString("endtime");
                int showingID = myResultSet.getInt("showingid");

                // get price
                Vector pVect = reserveMgr.getPriceInfo(showingID, Integer.parseInt(session_cid));
                int finalPrice = (Integer) pVect.elementAt(0);
%>
    <tr>
        <td align="center"><%=ticketID%></td>
        <td align="center"><%=movieName%></td>
        <td align="center"><%=theaterType%> <%=roomNumber%>관</td>
        <td align="center">[<%=seatRow%>,<%=seatColumn%>]</td>
        <td align="center"><%=startTime%></td>
        <td align="center"><%=endTime%></td>
        <td align="center"><%=finalPrice%></td>
        <td align="center">
            <a href="reserve_cancel.jsp?ticketID=<%=ticketID%>">
                취소
            </a>
        </td>
    </tr>
<%
            }
        }
    }
%>
</table>
</body>
</html>
