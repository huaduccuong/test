<%-- 
    Document   : search
    Created on : Sep 30, 2020, 1:28:15 PM
    Author     : Nhat Anh PC
--%>

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
        <form action="search" method="POST">
            Departments:
            <%String string = "";%>
            <select name="did2"> 
                <c:forEach items="${requestScope.depts}" var="d">
                    %>
                    <option 
                        value="${d.id}"> ${d.name} 
                    </option>
                </c:forEach>
                <option
                    selected="selected"
                    value="${0}"> All 
                </option>
            </select>
            Name: <input type="text" name="name2"/> <br/>
        </tr
        <br/>
        <input type="submit" value="Search" />
    </form>

    <table border="1px">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Dob</th>
            <th>Department</th>
            <th></th>
        </tr>
        <c:forEach items="${requestScope.std}" var="s" varStatus="loop">
            <tr 
                <c:if test="${loop.index mod 2 eq 0}">
                    style="background-color: lightgray;"
                </c:if>
                >
                <td> ${s.id} </td>
                <td>${s.name}</td>
                <td>
                    <input type="checkbox" 
                           <c:if test="${s.gender}">
                               checked="checked" 
                           </c:if>
                           />
                </td>
                <td> <fmt:formatDate type = "date" 
                                 value = "${s.dob}" /> </td>
        <td>${s.dept.name}</td>

    </tr>
</c:forEach>

</table>
</body>
</html>
