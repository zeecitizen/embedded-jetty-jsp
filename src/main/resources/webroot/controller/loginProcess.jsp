<%@ page import="org.eclipse.jetty.demo.LoginUtil" %>
<html>

<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Login</title>
    <link href="../views/static/main.css" media="all" rel="stylesheet" type="text/css"/>
</head>

<body>

<div class="main">
    <div class="wrapper">

        <h1>Login</h1>
        <%
            String userName = request.getParameter("name");
            String password = request.getParameter("passwd");
            pageContext.setAttribute("userNameCtx", userName);

            LoginUtil login = LoginUtil.getInstance();

        if (userName != null && !userName.isEmpty() && password != null && !password.isEmpty())
        {
        } else { %>
            <p> Empty username or password! Please fill in the entries properly by going <a href="../views/login.jsp">back</a></p>
        <% } %>


    </div>
</div>
</body>
</html>
