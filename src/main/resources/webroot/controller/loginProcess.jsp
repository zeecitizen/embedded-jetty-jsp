<%@ page import="org.eclipse.jetty.demo.LoginUtil" %>
<html>

<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Login</title>
    <link href="../views/static/main.css" media="all" rel="stylesheet" type="text/css"/>
</head>

<body>
<h1>Login</h1>

<%

    String userName = request.getParameter("name");
    String password = request.getParameter("passwd");
    pageContext.setAttribute("userNameCtx", userName);

    LoginUtil login = LoginUtil.getInstance();

    if (login.validateUser(userName, password)) { %>
    <p>Welcome <c:out value="${fn:escapeXml(userNameCtx)}"/></p>
    <p>Click <a href="../views/membersArea.jsp">here</a> to go to Members Area!</p>
    <%
        session.setAttribute("is_login", "1");
    } else { %>
    <p>Wrong User Name or Password. Please try again! <a href="../views/login.jsp">Back</a></p>
    <% } %>

</body>
</html>
