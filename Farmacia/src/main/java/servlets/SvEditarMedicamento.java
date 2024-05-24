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

@WebServlet(name = "SvEditarMedicamento", urlPatterns = {"/SvEditarMedicamento"})
public class SvEditarMedicamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEditarMedicamento</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEditarMedicamento at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recuperar los parámetros del formulario de edición
        int idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String compuestos = request.getParameter("compuestos");
        String fechaVencimiento = request.getParameter("fechaVencimiento");
        int cantidadStock = Integer.parseInt(request.getParameter("cantidadStock"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));

        // Llamar al método editarMedicamento de la clase GestionarFarmacia
        GestionarFarmacia gestionar = new GestionarFarmacia();
        gestionar.editarMedicamento(idMedicamento, nombre, precio, compuestos, fechaVencimiento, cantidadStock, idCategoria);

        // Redirigir a la página de lista de medicamentos después de la edición
        response.sendRedirect("listaMedicamentos.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
