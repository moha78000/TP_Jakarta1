package com.example.demo;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;



@WebServlet(name = "TestHttp", value = "/testHttp")
public class TestHttp {
    private String message;
    public void init() {
        message = "Hello World!";
        System.out.println("la Servlet passe par init");
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("la Servlet passe par la méthode service");
        doGet(request, response);

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}
