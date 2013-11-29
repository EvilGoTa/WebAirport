/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function getRaces() {
    $("#races tbody").empty().append("Загрузка...");
    var cityElem = document.getElementById("filter-city");
    var cityId = cityElem.options[cityElem.selectedIndex].value;
    $.ajax({
        type: "POST",
        url: "FilterRace",
        data: {data: cityId},
        success: function(data) {
            $("#races tbody").empty().append(data);
        },
        error: function() {
            $("#races tbody").empty().append("ошибка ajax");
        }
    });
}


