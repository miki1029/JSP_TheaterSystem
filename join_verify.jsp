<%@ page import="woodrimsTheater.SessionUserInfo" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head><title>WooDrims 영화관</title></head>
<body>
<%@ include file="top.jsp" %>
<jsp:useBean id="customerMgr" class="woodrimsTheater.CustomerManager" />
<%
    // user info
    String id = new String(request.getParameter("m_id").getBytes("8859_1"),"utf-8");
    String password = new String(request.getParameter("m_pwd").getBytes("8859_1"),"utf-8");
    String name = new String(request.getParameter("m_name").getBytes("8859_1"),"utf-8");
    String sex = new String(request.getParameter("m_sex").getBytes("8859_1"),"utf-8");
    String birthdate = new String(request.getParameter("m_birth").getBytes("8859_1"),"utf-8");
    String email = new String(request.getParameter("m_email").getBytes("8859_1"),"utf-8");

    SessionUserInfo user = customerMgr.insertCustomer(Integer.parseInt(session_cid),
            id, password, name, sex, birthdate, email);
    if (user != null) {
        session.setAttribute("cID", user.getId());
        session.setAttribute("cName", user.getName());
        session.setAttribute("cGradeID", user.getGradeID());
    }
%>

<script>
    alert("회원 가입에 성공하였습니다.");
    location.href="main.jsp";
</script>
</body>
</html>
