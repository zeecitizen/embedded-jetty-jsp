<%@ page import="org.eclipse.jetty.demo.LoginUtil" %>
<html>

<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <title>Login</title>
    <link href="../views/static/main.css" media="all" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="main">
    <div class="wrapper">

        <h1>Register</h1>
        <%
            String userName = request.getParameter("name");
            String password = request.getParameter("passwd");

            LoginUtil login = LoginUtil.getInstance();
            pageContext.setAttribute("userNameCtx", userName);

            if (userName != null && !userName.isEmpty() && password != null && !password.isEmpty()) {
                    if (login.userExists(userName)) { %>
                            <p> User already Exists! Please try a different user name. Please go <a href="../views/register.jsp">back</a> and try again </p>
                    <% } else {
                        login.addUser(userName, password);

                        if (!login.validateUser(userName, password)) { %>
                            <p> Error while registering new user! Please go <a href="../views/register.jsp">back</a> and try again! </p>
                        <% } else {%>
                            <p> Hi <c:out value="${fn:escapeXml(userNameCtx)}"/>. Registration successful! Click <a href="../views/login.jsp">here</a> to Login </p>
                        <% }
                    }
            } else { %>
                <p> Empty username or password! Please fill in the entries properly by going <a href="../views/register.jsp">back</a></p>
         <% } %>

    </div>
</div>
</body>
</html>
