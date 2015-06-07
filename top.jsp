<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String session_cid = (String)session.getAttribute("cID");
    String session_cname = (String)session.getAttribute("cName");
    //String session_cgrade = (String)session.getAttribute("cGrade");

    String log;
    if (session_cid==null)
        log="<a href=login.jsp>로그인</a>";
    else
        log="<a href=logout.jsp>로그아웃</a>";
%>

<table width="85%" align="center" bgcolor="#FFFF99" border>
    <tr>
        <td align="center"><b><%=log%></b></td>
        <td align="center"><b><a href="showing_list.jsp">영화 예매</a></b></td>
        <td align="center"><b><a href="reserve_list.jsp">예매 내역 확인</a></b></td>
        <td align="center"><b><a href="customer_update.jsp">사용자 정보 수정</a></b></td>
        <td align="center"><b><a href="admin_login.jsp">관리자 페이지</a></b></td>
    </tr>
</table>
<br />
