/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.farmacia.GestionarFarmacia;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juand
 */
@WebServlet(name = "SvEliminarMedicamento", urlPatterns = {"/SvEliminarMedicamento"})
public class SvEliminarMedicamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEliminarMedicamento</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEliminarMedicamento at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del medicamento a eliminar desde los parámetros de la solicitud
        int idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));

        GestionarFarmacia gestionar = new GestionarFarmacia();
        try {
            gestionar.eliminarMedicamento(idMedicamento);
        } catch (SQLException ex) {
            Logger.getLogger(SvEliminarMedicamento.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // Redirigir de vuelta a la página de lista de medicamentos después de la eliminación
        response.sendRedirect("listaMedicamentos.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
