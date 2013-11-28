/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entities;

/**
 *
 * @author Роман
 */
public class City {
    Integer id;
    String city;

    public City(Integer id, String city) {
        this.id = id;
        this.city = city;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getId() {
        return id;
    }

    public String getCity() {
        return city;
    }
    
}
