<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <title>로그인</title>
</head>

<body>

<table width="75%"  align="center" bgcolor="#FFFF99" border>
    <tr>
        <td>
            <div align="center"> 아이디와 패스워드를 입력하세요 </div>
        </td>
    </tr>
</table>
<form method="post" action="login_verify.jsp">
    <table width="75%" align="center" border>
        <tr>
            <td><div align="center">구분</div></td>
            <td><div align="center">
                <input type="radio" name="userType" value="employee" />직원
                <input type="radio" name="userType" value="member" />회원
                <input type="radio" name="userType" value="customer" />비회원
            </div></td>
        </tr>
        <tr>
            <td><div align="center">아이디/고객번호</div></td>
            <td><div align="center"><input type="text" name="userID" /></div></td>
        </tr>
        <tr>
            <td><div align="center">패스워드</div></td>
            <td><div align="center"><input type="password" name="userPassword" /></div></td>
        </tr>
        <tr>
            <td colspan=2><div align="center">
                <INPUT TYPE="SUBMIT" NAME="Submit" VALUE="로그인">
                <INPUT TYPE="RESET" VALUE="취소">
            </div></td>
        </tr>
    </table>
</form>

<div align="center">
    <a href="join.jsp">비회원 고객번호 발급</a><br />
    <a href="find_customerid.jsp">비회원 고객번호 찾기</a><br />
</div>

</body>
</html>