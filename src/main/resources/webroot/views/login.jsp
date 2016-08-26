<html>
<head>
    <title>Login</title>
    <link href="static/main.css" media="all" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="main">
    <div class="wrapper">
        <h1>Login</h1>
        <p>
            <table height="100%" width="30%" border="0" id="formTable">

                <form action="../controller/loginProcess.jsp" method="GET" name="LoginForm">
                    <tr>
                        <td><label>User Name: </label></td>
                        <td><input type="text" name="name"></td>
                    </tr>

                    <tr>
                        <td><label>Password: </label></td>
                        <td><input type="password" name="passwd"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Login" class="button"></td>
                    </tr>

                    <tr>
                        <td colspan="2">
                        <p>Don't have a username? <a href="register.jsp">Register Now </a></p>
                        </td>
                    </tr>

        </form>
        </table>
        </p>
    </div>
</div>
</body>
</html>