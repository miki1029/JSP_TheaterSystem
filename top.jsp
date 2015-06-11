<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String session_cid = (String)session.getAttribute("cID");
    String session_cname = (String)session.getAttribute("cName");
    String session_cgradeid = (String)session.getAttribute("cGradeID");

    String log;
    if (session_cid==null)
        log="<a href=login.jsp>로그인</a>";
    else
        log="<a href=logout.jsp>로그아웃</a>";
%>

<table width="85%" align="center" bgcolor="#FFFF99" border>
    <tr>
        <td align="center"><b><%=log%></b></td>
        <%
            if(session_cgradeid == null || session_cgradeid.equals("0")) {
                String redirectURL = "join.jsp";
                if(session_cid == null) {
                    redirectURL = "nonmember_login.jsp";
                }
        %>
        <td align="center"><b><a href="<%=redirectURL%>?redirectURL=join.jsp">멤버쉽 가입</a></b></td>
        <%
            }
        %>
        <td align="center"><b><a href="showing_list.jsp">영화 예매</a></b></td>
        <td align="center"><b><a href="reserve_list.jsp">예매 내역 확인</a></b></td>
        <td align="center"><b><a href="customer_update.jsp">고객정보 수정</a></b></td>
        <td align="center"><b><a href="admin_login.jsp">관리자 페이지</a></b></td>
    </tr>
</table>
<br/>
