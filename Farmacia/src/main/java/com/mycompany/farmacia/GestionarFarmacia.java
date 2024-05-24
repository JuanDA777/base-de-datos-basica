/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.farmacia;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GestionarFarmacia {

    public static Connection establecerConexion() {
        String url = "jdbc:mysql://localhost:3306/farmacia?serverTimeZone=utc";
        String user = "root";
        String password = "123456";
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            if (conn != null) {
                System.out.println("Conexion exitosa");
            }
        } catch (Exception e) {
            System.out.println("Error de conexion" + e.getMessage());
        }
        return conn;
    }

    // Método para crear una nueva categoría
    public void crearCategoria(String nombreCategoria) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = establecerConexion();
            String sql = "INSERT INTO Categorias (Nombre_Categoria) VALUES (?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nombreCategoria);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar la conexión y los recursos
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void editarCategoria(int idCategoria, String nuevoNombreCategoria) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = establecerConexion();
            String sql = "UPDATE Categorias SET Nombre_Categoria = ? WHERE ID_Categoria = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nuevoNombreCategoria);
            pstmt.setInt(2, idCategoria);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar la conexión y los recursos
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void eliminarCategoria(int idCategoria) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = establecerConexion();
            String sql = "DELETE FROM Categorias WHERE ID_Categoria = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idCategoria);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar la conexión y los recursos
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    public void eliminarMedicamento(int idMedicamento) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = establecerConexion();
            String sql = "DELETE FROM Medicamentos WHERE ID_Medicamento = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idMedicamento);
            pstmt.executeUpdate();
        } finally {
            // Cerrar la conexión y los recursos
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }


    public void crearMedicamento(String nombre, double precio, String compuestos, String fechaVencimiento, int cantidadStock, int idCategoria) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = establecerConexion();
            String sql = "INSERT INTO Medicamentos (Nombre, Precio, Compuestos, Fecha_Vencimiento, Cantidad_Stock, ID_Categoria) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nombre);
            pstmt.setDouble(2, precio);
            pstmt.setString(3, compuestos);
            pstmt.setString(4, fechaVencimiento);
            pstmt.setInt(5, cantidadStock);
            pstmt.setInt(6, idCategoria);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar la conexión y los recursos
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void editarMedicamento(int idMedicamento, String nombre, double precio, String compuestos, String fechaVencimiento, int cantidadStock, int idCategoria) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = establecerConexion();
            String sql = "UPDATE Medicamentos SET Nombre=?, Precio=?, Compuestos=?, Fecha_Vencimiento=?, Cantidad_Stock=?, ID_Categoria=? WHERE ID_Medicamento=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nombre);
            pstmt.setDouble(2, precio);
            pstmt.setString(3, compuestos);
            pstmt.setString(4, fechaVencimiento);
            pstmt.setInt(5, cantidadStock);
            pstmt.setInt(6, idCategoria);
            pstmt.setInt(7, idMedicamento);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
