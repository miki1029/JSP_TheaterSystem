<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
<%@ page import="woodrimsTheater.*" %>
<html>
<head><title>WooDrims 영화관</title></head>
<body>
<%@ include file="top.jsp" %>
<jsp:useBean id="customerMgr" class="woodrimsTheater.CustomerManager" />
<%
// 비회원 차단
if (session_cgradeid == null || session_cgradeid.equals("0")) {
%>
<script>
    alert("회원 전용입니다.");
    location.href = "main.jsp";
</script>
<%
}
else {
    CustomerInfo ci = customerMgr.getCustomerInfo(Integer.parseInt(session_cid));

    if (ci != null) {
        String isCheckedM = "";
        String isCheckedF = "";

        if(ci.getSex().equals("m")) {
            isCheckedM = " checked='checked'";
        } else {
            isCheckedF = " checked='checked'";
        }
%>

<form method="post" action="customer_update_verify.jsp">
    <input type="hidden" name="m_id" size="30" value="<%= session_cid %>">
    <table width="75%" align="center" border>
        <tr>
            <th>멤버쉽 ID</th>
            <td><%= ci.getId() %></td>
        </tr>
        <tr>
            <th>패스워드</th>
            <td><input type="password" name="m_pwd" value="<%=ci.getPassword()%>"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><%= ci.getName() %></td>
        </tr>
        <tr>
            <th>성별</th>
            <td>
                <input type="radio" name="m_sex" value="m"<%=isCheckedM%>>남자
                <input type="radio" name="m_sex" value="f"<%=isCheckedF%>>여자
            </td>
        </tr>
        <tr>
            <th>생일</th>
            <td><%= ci.getBirthDate() %></td>
        </tr>
        <tr>
            <th>이메일 주소</th>
            <td><input type="text" name="m_email" value="<%= ci.getEmail() %>"> </td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><%= ci.getPhoneNumber() %></td>
        </tr>
        <tr>
            <th>등록일</th>
            <td><%= ci.getRegisterDate() %></td>
        </tr>
        <tr>
            <th>회원 등급</th>
            <td><%=ci.getGradeName()%> (<%= ci.getPoint() %>점)</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="수정">
            </td>
        </tr>
    </table>
</form>
<div align="center">
    <a href="customer_delete_verify.jsp">회원 탈퇴</a>
</div>
<%
        }
    }
%>
</body>
</html>
