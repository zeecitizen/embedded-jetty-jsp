<html>

<head>
<%@ page import="java.util.Enumeration, org.apache.commons.lang3.StringEscapeUtils" %>
<title>Login</title>
<link href="../static/main.css" media="all" rel="stylesheet" type="text/css" />
</head>

<body>
<h1>Register</h1>

<%

String userName = request.getParameter("name");
userName = StringEscapeUtils.escapeJava(userName);
userName = StringEscapeUtils.escapeHtml4(userName);

String password = request.getParameter("passwd");
password = StringEscapeUtils.escapeJava(password);
password = StringEscapeUtils.escapeHtml4(password);

session.setAttribute("name", userName);
session.setAttribute("passwd", password);

if (session.getAttribute("name") == null || session.getAttribute("passwd") == null) { %>
    <p> Error while registering new user! Please go <a href="../register.jsp">back</a> and try again </p>
<% } else {%>
    <h2> Registration successful! Click <a href="../login.jsp">here</a> to Login </h2>
<% } %>

</body></html>
