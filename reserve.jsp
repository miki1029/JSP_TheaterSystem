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
    location.href = "nonmember_login.jsp?redirectURL=showing_list.jsp";
</script>
<%
}
else {
%>
<table width="75%" align="center" border>
    <jsp:useBean id="reserveMgr" class="reserveManager.ReserveManager" />
<%
    int showingID = Integer.parseInt(request.getParameter("showingID"));
    int rowCnt = 0;
    int columnCnt = 0;

    // get room seats size
    Vector rcVect = reserveMgr.getRoomSeatsRowColumn(showingID);
    rowCnt = (Integer) rcVect.elementAt(0);
    columnCnt = (Integer) rcVect.elementAt(1);

    // draw seat
    for(int row=1; row<=rowCnt; row++) {
%>
    <tr>
    <%
        for(int column=1; column<=columnCnt; column++) {
            boolean isReserve = reserveMgr.getReservedState(showingID, row, column);
            String seatLink = null;
            if(isReserve) {
                seatLink = "예약됨";
            }
            else {
                seatLink = "<a href='reserve_verify.jsp?showingID=" + showingID +
                        "&row=" + row + "&column=" + column + "'>" +
                        "[" + row + "," + column + "]</a>";
            }
    %>
        <td align="center"><%=seatLink%></td>
    <%
        }
    %>
    </tr>
<%
    }
%>
</table>

<%
    // get price
    Vector pVect = reserveMgr.getPriceInfo(showingID, Integer.parseInt(session_cid));

    int finalPrice = (Integer) pVect.elementAt(0);
    int roomPrice = (Integer) pVect.elementAt(1);
    int memberDiscount = (Integer) pVect.elementAt(2);
    int timeDiscount = (Integer) pVect.elementAt(3);
    int holidayExtra = (Integer) pVect.elementAt(4);
%>
<br />
<table align="center" border cellpadding="10px">
    <tr>
        <td>상영관 가격(+)</td>
        <td><%=roomPrice%></td>
    </tr>
    <tr>
        <td>주말/공휴일 추가 비용(+)</td>
        <td><%=holidayExtra%></td>
    </tr>
    <tr>
        <td>조조/심야 할인(-)</td>
        <td><%=timeDiscount%></td>
    </tr>
    <tr>
        <td>멤버쉽 할인(-)</td>
        <td><%=memberDiscount%></td>
    </tr>
    <tr>
        <td>최종 가격</td>
        <td><%=finalPrice%></td>
    </tr>
</table>

<%
}
%>

</body>
</html>
