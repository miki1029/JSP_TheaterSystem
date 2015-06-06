<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String session_id = (String)session.getAttribute("cID");
    String session_name = (String)session.getAttribute("cName");
    String session_grade = (String)session.getAttribute("cGrade");

    String log;
    if (session_id==null)
        log="<a href=login.jsp>로그인</a>";
    else
        log="<a href=logout.jsp>로그아웃</a>";
%>

<table width="75%" align="center" bgcolor="#FFFF99" border>
    <tr>
        <td align="center"><b><%=log%></b></td>
        <td align="center"><b><a href="movie_today.jsp">오늘의 영화 예매</b></td>
        <td align="center"><b><a href="movie_reserve.jsp">날짜별 영화 예매</b></td>
        <td align="center"><b><a href="reserve_cancel.jsp">예매 취소</b></td>
        <td align="center"><b><a href="reserve_select.jsp">예매 내역 조회</b></td>
        <td align="center"><b><a href="customer_update.jsp">사용자 정보 수정</b></td>
        <td align="center"><b><a href="admin_login.jsp">관리자 페이지</b></td>
    </tr>
</table>
