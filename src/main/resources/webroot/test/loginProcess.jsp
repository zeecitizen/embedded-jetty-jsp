<html>

<head>
<%@ page import="java.util.Enumeration, org.apache.commons.lang3.StringEscapeUtils" %>
<title>Login</title>
<link href="../static/main.css" media="all" rel="stylesheet" type="text/css" />
</head>

<body>
<h1>Login</h1>

<%
String userName = request.getParameter("name");
userName = StringEscapeUtils.escapeJava(userName);
userName = StringEscapeUtils.escapeHtml4(userName);

String password = request.getParameter("passwd");
password = StringEscapeUtils.escapeJava(password);
password = StringEscapeUtils.escapeHtml4(password);

if (userName.equals(session.getAttribute("name")) && password.equals(session.getAttribute("passwd"))) { %>
    <h2>Welcome <%= userName %> </h2>
<% } else { %>
    <h2>Wrong User Name or Password. Please try again! <a href="../login.jsp">Back</a></h2>
<% } %>

</body></html>
