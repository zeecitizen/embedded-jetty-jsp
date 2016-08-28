<%
    if (session != null && session.getAttribute("is_login") != null ){
        session.setAttribute("is_login","0");
    }
    response.sendRedirect("../login.jsp");
%>