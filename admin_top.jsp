<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String session_id = (String)session.getAttribute("eID");
    String session_name = (String)session.getAttribute("eName");
    String session_role = (String)session.getAttribute("eRole");

    String log;
    if (session_id==null)
        log="<a href=login.jsp>로그인</a>";
    else
        log="<a href=logout.jsp>로그아웃</a>";
%>

<table width="75%" align="center" bgcolor="#FFFF99" border>
    <tr>
        <td align="center"><b><%=log%></b></td>
        <td align="center"><b><a href="admin_employee.jsp">사용자 정보 수정</b></td>
        <td align="center"><b><a href="admin_salary.jsp">연봉 내역 확인</b></td>
        <td align="center"><b><a href="delete.jsp"></b></td>
        <td align="center"><b><a href="select.jsp">수강신청 조회</b></td>
    </tr>
</table>
