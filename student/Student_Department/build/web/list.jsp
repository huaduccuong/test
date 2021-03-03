<%-- 
    Document   : list
    Created on : Sep 25, 2020, 1:21:58 PM
    Author     : sonnt
--%>

<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script>
            function submitToUpdate(id)
            {
                var choose = confirm("Are you sure?");
                if (choose)
                {
                    window.location.href = "edit?id=" + id;
                }
            }
            function submitToDelete(id)
            {
                var choose = confirm("Are you sure?");
                if (choose)
                {
                    window.location.href = "delete?id=" + id;
                }
            }

        </script>    

    </head>
    <body>
        <table border="1px">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Dob</th>
                <th>Department</th>
                <th></th>
            </tr>
            <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
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
                    <td>
                        <input type="button" value="Edit" 
                               onclick="submitToUpdate(${s.id})" />
                    </td>
                     <td>
                     
                        <input type="button" value="Delete" 
                               onclick="submitToDelete(${s.id})" />
                    </td>
                </tr>
            </c:forEach>
        </table>
        <table>
            <td>
                    <a href="insert">create</a>
                </td>
             
                <td>
                    <a href="search">Search</a>
                </td>
        </table>


    </body>
</html>
