/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.farmacia.GestionarFarmacia;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juand
 */
@WebServlet(name = "SvMedicamento", urlPatterns = {"/SvMedicamento"})
public class SvMedicamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvMedicamento</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvMedicamento at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String compuestos = request.getParameter("compuestos");
        String fechaVencimiento = request.getParameter("fecha_vencimiento");
        int cantidadStock = Integer.parseInt(request.getParameter("cantidad_stock"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        
        // Llamar al método para crear el medicamento en la base de datos
        GestionarFarmacia gestionar = new GestionarFarmacia();
        gestionar.crearMedicamento(nombre, precio, compuestos, fechaVencimiento, cantidadStock, idCategoria);
        
        // Redirigir a una página de confirmación o a otra página según lo desees
        response.sendRedirect("medicamentos.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
