<html>
<head>
    <title>Register</title>
    <link href="static/main.css" media="all" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="main">
    <div class="wrapper">
        <h1>Registration</h1>
        <p>
            Please enter details to register.
        <table height="100%" width="30%" border="0" id="formTable">
            <form action="../controller/registerProcess.jsp" method="GET" name="registerForm">

                <tr>
                    <td><label>New User Name: </label></td>
                    <td><input type="text" name="name"></td>
                </tr>

                <tr>
                    <td><label>Choose a password: </label></td>
                    <td><input type="password" name="passwd"></td>
                </tr>

                <tr>
                    <td colspan="2"><input type="submit" class="button" value="Register"></td>
                </tr>

            </form>
        </table>
        Already Registered? Click <a href="login.jsp">here</a> to Login
        </p>
    </div>
</div>
</body>
</html>