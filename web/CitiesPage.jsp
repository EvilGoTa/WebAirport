<%-- 
    Document   : CitiesPage
    Created on : 29.11.2013, 3:43:04
    Author     : Роман
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DBAccess.CityAccess"%>
<%@page import="entities.City"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; UTF-8">
        <title>Список городов</title>
    </head>
    <body>
        <h1>Список городов</h1>
        <table >
            <tr>
                <td>ID</td>
                <td>Город</td>
                <td colspan="2">Действие</td>
            </tr>
            <form action="AddCity" method="POST">
                <tr>
                    <td colspan="2">
                        <input type="text" name="name_add" />
                    </td>
                    <td colspan="2">
                        <button >
                            Добавить
                        </button>
                    </td>
                </tr>
            </form>             
                
            <% for (City city : new CityAccess().getCities()) { %>
            <tr>
                <td>[<% city.getId(); %>]</td>
                <td>[<% city.getCity(); %>]</td>
                <td>
                    <button >
                        Редактировать
                    </button>
                </td>
                <td>
                    <form action="DeleteCity" method="POST">
                        <input type="hidden" name="delete_id" value="<%=city.getId()%>" />
                        <button >
                            Удалить
                        </button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
