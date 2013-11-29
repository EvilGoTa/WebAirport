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
        <script type="text/javascript">
            function goEdit(editId, editCity) {
                document.getElementById("id_edit").value = editId;
                document.getElementById("city_edit").value = editCity;
                document.getElementById("edit-form").style.display = "block";
            }
        </script>
    </head>
    <body>
        <a href="index.jsp">Рейсы</a>
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
                <td><%= city.getId() %></td>
                <td><%= city.getCity() %></td>
                <td>
                    <button onclick="goEdit(<%= city.getId() %>, '<%= city.getCity() %>');">
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
        
        <div id="edit-form" style="display: none;">
            <h2>Редактирование</h2>
            <form action="EditCity" method="POST">
                <input type="hidden" name="id_edit" id="id_edit" value="" />
                <table>
                    <tr>
                        <td>Город</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="city_edit" id="city_edit" /></td>
                        <td><button>Редактировать</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
