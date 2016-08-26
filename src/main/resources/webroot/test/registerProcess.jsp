<html>

<head>
    <%@ page import="java.util.Enumeration, org.apache.commons.lang3.StringEscapeUtils" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <title>Login</title>
    <link href="../static/main.css" media="all" rel="stylesheet" type="text/css"/>
</head>

<body>
<h1>Register</h1>

<%

    String userName = request.getParameter("name");
    String password = request.getParameter("passwd");

    session.setAttribute("name", userName);
    session.setAttribute("passwd", password);
    pageContext.setAttribute("userNameCtx", userName);

    if (session.getAttribute("name") == null || session.getAttribute("passwd") == null) { %>
    <p> Error while registering new user! Please go <a href="../register.jsp">back</a> and try again </p>
<% } else {%>
    <p> Hi <c:out value="${fn:escapeXml(userNameCtx)}" />. Registration successful! Click <a href="../login.jsp">here</a> to Login </p>
<% } %>

</body>
</html>
