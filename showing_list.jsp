<%@ page import="java.sql.*, java.util.*, woodrimsTheater.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<table width="85%" align="center" border>
    <tr>
        <th>영화 제목</th>
        <th>시작 시간</th>
        <th>종료 시간</th>
        <th>상영관</th>
        <th>예매</th>
    </tr>

    <jsp:useBean id="reserveMgr" class="woodrimsTheater.ReserveManager" />
    <%
        Vector showingVect = reserveMgr.getShowingInfo();

        for(int i=0; i< showingVect.size(); i++) {
            ShowingInfo showingInfo = (ShowingInfo) showingVect.elementAt(i);
    %>
    <tr>
        <td align="center"><%=showingInfo.getMovieName()%></td>
        <td align="center"><%=showingInfo.getStartTime()%></td>
        <td align="center"><%=showingInfo.getEndTime()%></td>
        <td align="center"><%=showingInfo.getRoomName()%></td>
        <td align="center">
            <a href="reserve.jsp?showingID=<%=showingInfo.getShowingID()%>">
                예매
            </a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<%
    if (session_cid==null) {
%>
<br />
<div align="center">멤버쉽 혜택을 받으려면 먼저 로그인 해 주세요.</div>
<%
    }
%>

</body>
</html>
