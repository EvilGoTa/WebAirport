<%-- 
    Document   : index
    Created on : 29.11.2013, 16:42:02
    Author     : Роман
--%>

<%@page import="DBAccess.CityAccess"%>
<%@page import="entities.City"%>
<%@page import="DBAccess.RaceAccess"%>
<%@page import="entities.Race"%>
<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Рейсы аэропорта</title>
        <script type="text/javascript">
            function getCBIndex(elem, val) {
                for (var i=0; i < elem.options.length; i++) {
                    if (val === elem.options[i].text)
                        return i;
                }
                return 0;
            }
            
            function goEdit(editId, editCity1, editCity2, editTimeStart, editTimeEnd) {
                var cb1 = document.getElementById("add_city1");
                var cb2 = document.getElementById("add_city2");
                document.getElementById("edit_id").value = editId;
                document.getElementById("edit_city1").selectedIndex = getCBIndex(cb1, editCity1);;
                document.getElementById("edit_city2").selectedIndex = getCBIndex(cb2, editCity2);
                document.getElementById("edit_time_start").value = editTimeStart;
                document.getElementById("edit_time_end").value = editTimeEnd;
                document.getElementById("edit-form").style.display = "block";
            }
        </script>
        <script src="Scripts/ajax.js" type="text/javascript"></script>
        <script src="Scripts/jquery.js" type="text/javascript"></script>
        <script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Рейсы аэропорта</h1>
    </body>
    Фильтр по городу назнвчения
    <select name="filter-city1" id="filter-city">
        <% for (City city : new CityAccess().getCities()) {%>
        <option value="<%= city.getId()%>">
            <%= city.getCity()%>
        </option>
        <% } %>
    </select>
    <button onclick="getRaces()">
        Фильтровать
    </button>
    <table id="races">
        <thead>
            <td>Город отправления</td>
            <td>Город прибытия</td>
            <td>Время отрпавления</td>
            <td>Время прибытия</td>
            <td colspan="2">Действия</td>
        </thead>
        <tbody>
            <tr>
        <form action="AddRace" method="POST">
            <td>
                <select name="add_city1" id="add_city1">
                    <% for (City city : new CityAccess().getCities()) {%>
                    <option value="<%= city.getId()%>">
                        <%= city.getCity()%>
                    </option>
                    <% } %>
                </select>
            </td>
            <td>
                <select name="add_city2" id="add_city2">
                    <% for (City city : new CityAccess().getCities()) {%>
                    <option value="<%= city.getId()%>">
                        <%= city.getCity()%>
                    </option>
                    <% } %>
                </select>
            </td>
            <td><input type="text" name="add_time_start" /></td>
            <td><input type="text" name="add_time_end" /></td>
            <td colspan="2">
                <button>
                    Добавить
                </button>
            </td>
        </form>
</tr>
<% for (Race race : new RaceAccess().getRaces()) {%>
<tr>
    <td><%= race.getCity1()%></td>
    <td><%= race.getCity2()%></td>
    <td><%= race.getStart_time()%></td>
    <td><%= race.getEnd_time()%></td>
    <td>
        <button onclick="goEdit(<%= race.getId()%>, '<%= race.getCity1()%>', '<%= race.getCity2()%>', '<%= race.getStart_time()%>', '<%= race.getEnd_time()%>')">
            Редактировать
        </button>
    </td>
    <td>
        <form action="DeleteRace" method="POST">
            <input type="hidden" value="<%= race.getId()%>" name="delete_id" />
            <button>
                Удалить
            </button>
        </form>
    </td>
</tr>
<% } %>
</tbody>
    </table>
    <div id="edit-form" style="display: none;">
        <table>
            <tr>
                <td>Город отправления</td>
                <td>Город прибытия</td>
                <td>Время отрпавления</td>
                <td>Время прибытия</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
            <form action="EditRace" method="POST">
                <input type="hidden" value="" id="edit_id" name="edit_id">
                <td>
                    <select name="edit_city1" id="edit_city1">
                        <% for (City city : new CityAccess().getCities()) {%>
                        <option value="<%= city.getId()%>">
                            <%= city.getCity()%>
                        </option>
                        <% } %>
                    </select>
                </td>
                <td>
                    <select name="edit_city2" id="edit_city2">
                        <% for (City city : new CityAccess().getCities()) {%>
                        <option value="<%= city.getId()%>">
                            <%= city.getCity()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <td><input type="text" name="edit_time_start" id="edit_time_start"/></td>
                <td><input type="text" name="edit_time_end" id="edit_time_end"/></td>
                <td>
                    <button>
                        Редактировать
                    </button>
                </td>
            </form>
            </tr>
        </table>
    </div>
</html>
