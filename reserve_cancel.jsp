<%@ page import="java.sql.*, java.util.*, reserveManager.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<jsp:useBean id="reserveMgr" class="reserveManager.ReserveManager" />
<%
    int ticketID = Integer.parseInt(request.getParameter("ticketID"));
    int showingID = 0;

    // showingid
    showingID = reserveMgr.getShowingIDByTicketID(ticketID);

    // get price
    Vector pVect = reserveMgr.getPriceInfo(showingID, Integer.parseInt(session_cid));
    int finalPrice = (Integer) pVect.elementAt(0);

    // delete ticket, point down, grade down
    reserveMgr.deleteTicket(Integer.parseInt(session_cid), ticketID, finalPrice);
%>
<script>
    alert("예매가 취소되었습니다.");
    location.href="reserve_list.jsp";
</script>
</body>
</html>
