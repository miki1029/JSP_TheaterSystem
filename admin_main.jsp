<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="admin_top.jsp" %>
<table width="75%" align="center" height="100%">
    <%  if (session_eid != null)  {  %>
    <tr>
        <td align="center"><%=session_ename%>님 방문을 환영합니다.</td>
    </tr>
    <% } else {  %>
    <tr>
        <td align="center">관리자 화면에 접속하셨습니다.</td>
    </tr>
    <% } %>
</table>
</body>
</html>
