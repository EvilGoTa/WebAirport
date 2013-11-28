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
public class Race {
    Integer start_city, end_city;
    String start_time, end_time, city1, city2;

    public Race(Integer start_city, Integer end_city, String start_time, String end_time, String city1, String city2) {
        this.start_city = start_city;
        this.end_city = end_city;
        this.start_time = start_time;
        this.end_time = end_time;
        this.city1 = city1;
        this.city2 = city2;
    }

    public void setStart_city(Integer start_city) {
        this.start_city = start_city;
    }

    public void setEnd_city(Integer end_city) {
        this.end_city = end_city;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public void setCity1(String city1) {
        this.city1 = city1;
    }

    public void setCity2(String city2) {
        this.city2 = city2;
    }

    public Integer getStart_city() {
        return start_city;
    }

    public Integer getEnd_city() {
        return end_city;
    }

    public String getStart_time() {
        return start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public String getCity1() {
        return city1;
    }

    public String getCity2() {
        return city2;
    }
    
}
