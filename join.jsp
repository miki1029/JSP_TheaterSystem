<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head><title>WooDrims 영화관</title></head>
<body>
<%@ include file="top.jsp" %>
<%
    if (!session_cgradeid.equals("0")) {
%>
<script>
    alert("이미 멤버쉽에 가입되어 있습니다.");
    location.href = "main.jsp";
</script>
<%
    } else {
%>
<form method="post" action="join_verify.jsp">
    <table width="75%" align="center" border>
        <tr>
            <th>멤버쉽 ID</th>
            <td><input type="text" name="m_id" /></td>
        </tr>
        <tr>
            <th>패스워드</th>
            <td><input type="password" name="m_pwd" /></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text" name="m_name" /></td>
        </tr>
        <tr>
            <th>성별</th>
            <td>
                <input type="radio" name="m_sex" value="m">남자
                <input type="radio" name="m_sex" value="f">여자
            </td>
        </tr>
        <tr>
            <th>생일</th>
            <td><input type="text" name="m_birth" /></td>
        </tr>
        <tr>
            <th>이메일 주소</th>
            <td><input type="text" name="m_email" /></td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><input type="text" name="m_phone" value="<%=session_cname%>" disabled="disabled" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="회원가입">
            </td>
        </tr>
    </table>
</form>
<%
    }
%>
</body>
</html>
