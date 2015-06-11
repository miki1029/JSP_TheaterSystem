<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html> 
<head><title>WooDrims 영화관</title></head>
<body>
<%@ include file="top.jsp" %>
<jsp:useBean id="customerMgr" class="woodrimsTheater.CustomerManager" />
<%
	String m_pwd = new String(request.getParameter("m_pwd").getBytes("8859_1"),"utf-8");
	String m_sex = new String(request.getParameter("m_sex").getBytes("8859_1"),"utf-8");
	String m_email = new String(request.getParameter("m_email").getBytes("8859_1"),"utf-8"); 

    if(customerMgr.updateCustomer(Integer.parseInt(session_cid), m_pwd, m_sex, m_email)) {
%>
<script>
    alert("고객님의 정보가 수정되었습니다.");
    location.href="customer_update.jsp";
</script>
<%
    } else {
%>
<script>
    alert("SQL ERROR");
    location.href="customer_update.jsp";
</script>
<%
    }
%>
</body>
</html>
