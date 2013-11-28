/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DBAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Роман
 */
public class DBAccess {
    protected Connection createConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/WebAirport", "pilot", "pilot");
        
    }
}
