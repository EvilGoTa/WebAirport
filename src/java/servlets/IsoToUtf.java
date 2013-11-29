/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.UnsupportedEncodingException;

/**
 *
 * @author Роман
 */
public class IsoToUtf {
    static public String convert(String input) throws UnsupportedEncodingException {
        return new String(input.getBytes("ISO-8859-1"), "UTF-8");
    }
}
