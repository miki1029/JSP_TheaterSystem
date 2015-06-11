<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="woodrimsTheater.SessionUserInfo" %>
<jsp:useBean id="loginMgr" class="woodrimsTheater.LoginManager" />
<%
    // user info
    String userType = request.getParameter("userType");
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");

    // redirect info
    // admin: admin_login.jsp, member: login.jsp, custormer: nonmember_login.jsp
    String loginURL = "login.jsp";
    // after login
    String redirectURL = request.getParameter("redirectURL");
    if(redirectURL == null) {
        redirectURL = "main.jsp";
    }

    // admin
    if(userType.equals("admin")) {
        loginURL = "admin_login.jsp";
        SessionUserInfo user = loginMgr.adminLogin(userID, userPassword);

        if (user != null) {
            session.setAttribute("eID", user.getId());
            session.setAttribute("eName", user.getName());
            response.sendRedirect("admin_main.jsp");
        }
    }
    // member
    else if(userType.equals("member")) {
        loginURL = "login.jsp";
        SessionUserInfo user = loginMgr.memberLogin(userID, userPassword);

        if (user != null) {
            session.setAttribute("cID", user.getId());
            session.setAttribute("cName", user.getName());
            session.setAttribute("cGradeID", user.getGradeID());
            response.sendRedirect("main.jsp");
        }
    }
    // customer
    else if(userType.equals("customer")) {
        loginURL = "nonmember_login.jsp";
        SessionUserInfo user = loginMgr.customerLogin(userID);

        if (user != null) {
            session.setAttribute("cID", user.getId());
            session.setAttribute("cName", user.getName());
            session.setAttribute("cGradeID", user.getGradeID());
            response.sendRedirect(redirectURL);
        }
    }
%>
<script>
	alert("사용자 아이디 혹은 암호가 틀렸습니다");
    location.href = "<%=loginURL%>";
</script>
