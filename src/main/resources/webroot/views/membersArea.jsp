<%
    if (null == session || !session.getAttribute("is_login").equals("1")) {
        response.sendRedirect("login");
        return;
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
            Tinglabs was established in 2010.
        </p>
    </div>
</div>
</body>

</html>

