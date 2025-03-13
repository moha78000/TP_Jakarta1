package com.example.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;

@WebServlet(name = "damierServlet", value = "/damier-servlet")
public class DamierServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Définir les dimensions du damier
        int rows = 8; // Par exemple, 8 lignes
        int cols = 8; // Par exemple, 8 colonnes

        // Placer ces valeurs comme attributs dans la requête
        request.setAttribute("rows", rows);
        request.setAttribute("cols", cols);

        // Rediriger vers la page JSP qui affichera le damier
        RequestDispatcher dispatcher = request.getRequestDispatcher("damier.jsp");
        dispatcher.forward(request, response);
    }
}
