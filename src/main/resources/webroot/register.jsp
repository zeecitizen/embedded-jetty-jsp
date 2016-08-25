<html>
<head>
  <title>Register</title>
  <link href="static/main.css" media="all" rel="stylesheet" type="text/css" />
</head>

<body>
  <h1>Registration</h1>
  <p>
  Please enter details to register.
    <form action="/test/registerProcess.jsp" method = "GET" name = "registerForm">
        <label>New User Name: </label>
        <input type="text" name = "name"><br>

        <label>Choose a password: </label>
        <input type="password" name = "passwd"><br>
        <input type = "submit" value = "Register">

    </form>
  </p>
</body>
</html>