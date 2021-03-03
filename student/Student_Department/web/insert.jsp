<%-- 
    Document   : insert
    Created on : Sep 23, 2020, 1:40:37 PM
    Author     : sonnt
--%>

<%@page import="model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Department> depts = 
            (ArrayList<Department>) request.getAttribute("depts");
        
        %>
    </head>
    <body>
        <form action="insert" method="POST">
            Name: <input type="text" name="name"/> <br/>
            Dob: <input type="date" name="dob" /><br/>
            Gender: <input type="radio" name="gender" value="male"/> Male
            <input type="radio" name="gender" value="female"/> Female <Br/>
            Departments:
            <select name="did"> 
                <% for (Department d : depts) {
                %>
                <option value="<%=d.getId()%>"> <%=d.getName()%> </option>
                <%}%>
            </select>
            <br/>
            <input type="submit" value="Save" />
        </form>
    </body>
</html>
