<html>

<head>
    <%@ page import="java.util.Enumeration, org.apache.commons.lang3.StringEscapeUtils" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Login</title>
    <link href="../static/main.css" media="all" rel="stylesheet" type="text/css"/>
</head>

<body>
<h1>Login</h1>

<%
    String userName = request.getParameter("name");
    String password = request.getParameter("passwd");
    pageContext.setAttribute("userNameCtx", userName);

    if (userName.equals(session.getAttribute("name")) && password.equals(session.getAttribute("passwd"))) { %>
    <p>Welcome <c:out value="${fn:escapeXml(userNameCtx)}" /></p>
<% } else { %>
    <p>Wrong User Name or Password. Please try again! <a href="../login.jsp">Back</a></p>
<% } %>

</body>
</html>
