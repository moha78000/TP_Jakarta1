package com.example.demo;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


@WebServlet(name = "accueilServlet", value = "/accueil-servlet")
public class Accueil extends HttpServlet {

}
