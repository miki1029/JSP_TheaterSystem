<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="top.jsp" %>
<%@ page import="java.sql.*" %>
<%
    String redirectURL = request.getParameter("redirectURL");
    if(redirectURL == null) {
        redirectURL = "main.jsp";
    }
%>
<html>
<head>
    <title>WooDrims 영화관</title>
</head>

<body>

<table width="75%"  align="center" bgcolor="#FFFF99" border>
    <tr>
        <td>
            <div align="center"> 비회원 본인 인증 </div>
        </td>
    </tr>
</table>
<form method="post" action="login_verify.jsp?redirectURL=<%=redirectURL%>">
    <input type="hidden" name="userType" value="customer" />
    <table width="75%" align="center" border>
        <tr>
            <td><div align="center">전화번호</div></td>
            <td><div align="center"><input type="text" name="userID" /></div></td>
        </tr>
        <tr>
            <td colspan=2><div align="center">
                <INPUT TYPE="SUBMIT" NAME="Submit" VALUE="인증">
                <INPUT TYPE="RESET" VALUE="취소">
            </div></td>
        </tr>
    </table>
</form>

</body>
</html>