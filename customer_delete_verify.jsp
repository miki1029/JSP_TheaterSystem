<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head><title>WooDrims 영화관</title></head>
<body>
<%@ include file="top.jsp" %>
<jsp:useBean id="customerMgr" class="woodrimsTheater.CustomerManager" />
<%
    if(session_cid == null) {
%>
<script>
    alert("잘못된 접근입니다.");
    location.href="main.jsp";
</script>
<%
    }
    if(customerMgr.deleteCustomer(Integer.parseInt(session_cid))) {
        session.invalidate();
%>
<script>
    alert("고객님의 정보가 삭제되었습니다.");
    location.href="main.jsp";
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
