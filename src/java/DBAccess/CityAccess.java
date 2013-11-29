/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DBAccess;

import entities.City;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Роман
 */
public class CityAccess extends DBAccess{
    public void addCity(City city) throws SQLException {
        Connection connection = createConnection();
        PreparedStatement statement = connection.prepareStatement("INSERT INTO Cities"
                + " (city) VALUES(?)", Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, city.getCity());
        statement.executeUpdate();
        connection.close();
    }
    
    public void editCity(City city) throws SQLException {
        Connection connection = createConnection();
        PreparedStatement statement = connection.prepareStatement("UPDATE Cities "
                + "SET city = ? WHERE id = ?", Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, city.getCity());
        statement.setInt(2, city.getId());
        statement.executeUpdate();
        connection.close();
    }
    
    public void deleteCity(City city) throws SQLException {
        Connection connection = createConnection();
        PreparedStatement statement = connection.prepareStatement("DELETE FROM cities WHERE id = ?");
        statement.setInt(1, city.getId());
        statement.executeUpdate();
        connection.close();
    }
    
    public ArrayList<City> getCities() throws SQLException{
        ArrayList<City> cities = new ArrayList();
        Connection connection = createConnection();
        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("SELECT * FROM cities");
        while(set.next()){
            cities.add(new City(set.getInt("id"), set.getString("city")));
        }
        for (City c : cities) {
            System.out.println(c.getId() + " " + c.getCity());
        }
        connection.close();
        return cities;
    }
}
