package com.ejemplo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.PrintWriter;
import java.io.IOException;

@WebServlet(name = "com.ejemplo.servlets.MiServlet", value = "/escucha-peticiones")
public class MiServlet extends HttpServlet {
    // Declaraciones globales (de clase)
    private String mensaje;

    // Inicialización
    public void init() {
        mensaje = "Este es el servlet más sencillo del mundo";
    }

    // Cuando apagamos para ordenar y limpiar (sólo se ejecuta 1 vez)
    public void destroy() {
    }

    // Peticiones GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Tipo de respuesta ofrecida (texto, imagen, etc)
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.print("<html><body>" +
                mensaje +
                "</body></html>"
        );
    }

    // Peticiones POST
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
