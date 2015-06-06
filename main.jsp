<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<table width="75%" align="center" height="100%">
    <%  if (session_cid != null)  {  %>
    <tr>
        <td align="center"><%=session_cname%>님 방문을 환영합니다.</td>
    </tr>
    <% } else {  %>
    <tr>
        <td align="center">우드림스 영화관에 오신 것을 환영합니다.</td>
    </tr>
    <% } %>
</table>
</body>
</html>
