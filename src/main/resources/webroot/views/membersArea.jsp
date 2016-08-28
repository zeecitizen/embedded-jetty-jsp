<%
    if (session == null || session.getAttribute("is_login") == null || session.getAttribute("is_login").equals("1")) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <title>Members Area</title>
    <link href="static/main.css" media="all" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="main">
    <div class="wrapper">
        <h1>Members Area</h1>
        <p>
            Tinglabs was established in 2010.. Meet the founder of Tinglabs <a href="resume/home.jsp">here</a>
        </p>
    </div>
</div>
</body>

</html>

