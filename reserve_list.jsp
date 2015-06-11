<%@ page import="java.sql.*, java.util.*, woodrimsTheater.*" %>
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

    <jsp:useBean id="reserveMgr" class="woodrimsTheater.ReserveManager" />
    <%
        Vector rvVect = reserveMgr.getReserveInfo(Integer.parseInt(session_cid));

        for(int i=0; i<rvVect.size(); i++) {
            ReserveInfo rvList = (ReserveInfo)rvVect.elementAt(i);
            int showingID = rvList.getShowingID();

            // get price
            Vector pVect = reserveMgr.getPriceInfo(showingID, Integer.parseInt(session_cid));
            int finalPrice = (Integer) pVect.elementAt(0);
    %>
    <tr>
        <td align="center"><%=rvList.getTicketID()%></td>
        <td align="center"><%=rvList.getMovieName()%></td>
        <td align="center"><%=rvList.getRoomName()%></td>
        <td align="center">[<%=rvList.getSeatRow()%>,<%=rvList.getSeatColumn()%>]</td>
        <td align="center"><%=rvList.getStartTime()%></td>
        <td align="center"><%=rvList.getEndTime()%></td>
        <td align="center"><%=finalPrice%></td>
        <td align="center">
            <a href="reserve_cancel.jsp?ticketID=<%=rvList.getTicketID()%>">
                취소
            </a>
        </td>
    </tr>
<%
        }
    }
%>
</table>
</body>
</html>
