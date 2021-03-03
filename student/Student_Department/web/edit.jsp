<%-- 
    Document   : edit
    Created on : Sep 25, 2020, 1:42:05 PM
    Author     : sonnt
--%>

<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <form action="edit" method="POST">
            ID:<input type="text" readonly="true" name="id" 
                      value="${requestScope.student.id}"  />
            Name: <input type="text" name="name" value="${requestScope.student.name}"/> <br/>
            Dob: <input type="date" name="dob" value="${requestScope.student.dob}" /><br/>
            Gender: <input type="radio" name="gender" 
                           ${requestScope.student.gender?"checked=\"checked\"":""}
                           value="male"/> Male
            <input type="radio" name="gender" 
                   ${!requestScope.student.gender?"checked=\"checked\"":""}
                   value="female"/> Female <Br/>
            Departments:
            <select name="did"> 
                <c:forEach items="${requestScope.depts}" var="d">
                <option 
                    <c:if test="${d.id eq requestScope.student.id}">
                    selected="selected"
                    </c:if>
                    value="${d.id}"> ${d.name} 
                </option>
                </c:forEach>
            </select>
            <br/>
            <input type="submit" value="Save" />
        </form>
    </body>
</html>
