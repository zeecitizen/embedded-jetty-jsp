<html>
<head>
  <title>Login</title>
  <link href="static/main.css" media="all" rel="stylesheet" type="text/css" />
</head>

<body>
  <h1>Login</h1>
  <p>
    <form action="/test/loginProcess.jsp" method = "GET" name = "LoginForm">
        <label>User Name: </label>
        <input type="text" name = "name"><br>

        <label>Password: </label>
        <input type="password" name = "passwd"><br>
        <input type = "submit" value = "Login"><br>
        <p>Don't have a username? <a href = "register.jsp">Register Now </a></p>

    </form>
  </p>
</body>
</html>