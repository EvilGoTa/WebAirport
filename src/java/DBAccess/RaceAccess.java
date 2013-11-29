/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DBAccess;

import java.sql.SQLException;
import entities.Race;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Роман
 */
public class RaceAccess extends DBAccess{
    public void addRace(Race race) throws SQLException {
        Connection connection = createConnection();
        PreparedStatement statement = connection.prepareStatement("INSERT INTO races "
                + "(city_start, city_end, time_start, time_end) "
                + "VALUES(?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
        statement.setInt(1, race.getStart_city());
        statement.setInt(2, race.getEnd_city());
        statement.setString(3, race.getStart_time());
        statement.setString(4, race.getEnd_time());
        statement.executeUpdate();
        connection.close();
    }
    
    public void editRace(Race race) throws SQLException {
        Connection connection = createConnection();
        PreparedStatement statement = connection.prepareStatement("UPDATE races "
                + "SET city_start = ?, city_end = ?, time_start = ?, time_end = ? "
                + "WHERE id = ?", Statement.RETURN_GENERATED_KEYS);
        statement.setInt(1, race.getStart_city());
        statement.setInt(2, race.getEnd_city());
        statement.setString(3, race.getStart_time());
        statement.setString(4, race.getEnd_time());
        statement.setInt(5, race.getId());
        statement.executeUpdate();
        connection.close();
    }
    
    public void deleteRace(Race race) throws SQLException {
        Connection connection = createConnection();
        PreparedStatement statement = connection.prepareStatement("DELETE FROM races WHERE Id = ?");
        statement.setInt(1, race.getId());
        statement.executeUpdate();
        connection.close();
    }
    
    public List<Race> getRaces() throws SQLException {
        List<Race> races = new ArrayList();
        Connection connection = createConnection();
        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("SELECT r.id, city_start, c1.city city1, city_end, c2.city city2, time_start, time_end "
                + "FROM races as r "
                + "LEFT JOIN cities as c1 on c1.id = city_start "
                + "LEFT JOIN cities as c2 on c2.id = city_end "
                + "ORDER BY r.id");
        while(set.next()){
            races.add(new Race(set.getInt("city_start"), set.getInt("city_end"), 
                    set.getInt("id"), set.getString("time_start"), set.getString("time_end"), 
                    set.getString("city1"), set.getString("city2")));
        }
        return races;
    }
    
    public List<Race> getRaces(Integer id) throws SQLException {
        List<Race> races = new ArrayList();
        Connection connection = createConnection();
        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery("SELECT r.id city_start, c1.city, city_end, c2.city, time_start, time_end "
                + "FROM reces r"
                + "LEFT JOIN cities c1 on c1.id=city_start "
                + "LEFT JOIN cities c2 on c2.id=city_end "
                + "WHERE city_end ="+id+" "
                + "ORDER BY r.id");
        while(set.next()){
            races.add(new Race(set.getInt("city_start"), set.getInt("city_end"), 
                    set.getInt("r.id"), set.getString("time_start"), set.getString("time_end"), 
                    set.getString("c1.city"), set.getString("c2.city")));
        }
        return races;
    }
}
