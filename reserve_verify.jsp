<%@ page import="java.sql.*, java.util.*, woodrimsTheater.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<jsp:useBean id="reserveMgr" class="woodrimsTheater.ReserveManager" />
<%
    int showingID = Integer.parseInt(request.getParameter("showingID"));
    int row = Integer.parseInt(request.getParameter("row"));
    int column = Integer.parseInt(request.getParameter("column"));

    // get price
    Vector pVect = reserveMgr.getPriceInfo(showingID, Integer.parseInt(session_cid));
    int finalPrice = (Integer) pVect.elementAt(0);

    // insert ticket, point up, grade up
    reserveMgr.insertTicket(Integer.parseInt(session_cid), column, row, showingID, finalPrice);
%>
<script>
    alert("예매가 완료되었습니다.");
    location.href="reserve_list.jsp";
</script>
</body>
</html>
