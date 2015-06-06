<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String session_eid = (String)session.getAttribute("eID");
    String session_ename = (String)session.getAttribute("eName");

    if (session_eid==null) {
%>
<script>
    alert("접근 권한이 없습니다.");
    location.href = "main.jsp";
</script>
<%
    }
%>

<table width="75%" align="center" bgcolor="#FFFF99" border>
    <tr>
        <td align="center"><b><a href=logout.jsp>로그아웃</a></b></td>
        <td align="center"><b><a href="admin_movie.jsp">영화 정보 관리</a></b></td>
        <td align="center"><b><a href="admin_showing.jsp">상영 정보 관리</a></b></td>
        <td align="center"><b><a href="admin_employee.jsp">직원 정보 관리</a></b></td>
        <td align="center"><b><a href="admin_customer.jsp">회원 정보 관리</a></b></td>
    </tr>
</table>

<br />