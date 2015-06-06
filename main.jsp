<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>Udrims 영화관</title>
</head>
<body>
<%@ include file="top.jsp" %>
<table width="75%" align="center" height="100%">
    <%  if (session_id != null)  {  %>
    <tr>
        <td align="center"><%=session_name%>님 방문을 환영합니다.</td>
    </tr>
    <% } else {  %>
    <tr>
        <td align="center">로그인한 후 사용하세요.</td>
    </tr>
    <% } %>
</table>
</body>
</html>



