<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.farmacia.GestionarFarmacia"%>
<%@include file="templates/header.jsp"%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Crear Nueva Categoría</h3>
                </div>
                <div class="card-body">
                    <form action="SvCategoria" method="POST">
                        <div class="form-group">
                            <label for="nombre_categoria">Nombre de la Categoría:</label>
                            <input type="text" class="form-control" id="nombre_categoria" name="nombre_categoria" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Crear Categoría</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-5 justify-content-center">
        <div class="col-md-8">
            <h3 class="text-center">Categorías</h3>
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        GestionarFarmacia gestionar = new GestionarFarmacia();
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            conn = gestionar.establecerConexion();
                            String sql = "SELECT ID_Categoria, Nombre_Categoria FROM Categorias";
                            pstmt = conn.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                int idCategoria = rs.getInt("ID_Categoria");
                                String nombreCategoria = rs.getString("Nombre_Categoria");
                    %>
                    <tr>
                        <td><%= idCategoria%></td>
                        <td><%= nombreCategoria%></td>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editarModal<%= idCategoria%>">
                                <i class="fas fa-edit"></i> Editar
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#eliminarModal<%= idCategoria%>">
                                <i class="fas fa-trash"></i> Eliminar
                            </button>
                        </td>

                        <!-- Modal para editar categoría -->
                    <div class="modal fade" id="editarModal<%= idCategoria%>" tabindex="-1" aria-labelledby="editarModalLabel<%= idCategoria%>" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editarModalLabel<%= idCategoria%>">Editar Categoría</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- Formulario para editar la categoría -->
                                    <form action="SvEditarCategoria" method="POST">
                                        <input type="hidden" name="id_categoria" value="<%= idCategoria%>">
                                        <div class="form-group">
                                            <label for="nombre_categoria_edit">Nombre de la Categoría:</label>
                                            <input type="text" class="form-control" id="nombre_categoria_edit" name="nombre_categoria_edit" value="<%= nombreCategoria%>" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal para confirmar eliminación de categoría -->
                    <div class="modal fade" id="eliminarModal<%= idCategoria%>" tabindex="-1" aria-labelledby="eliminarModalLabel<%= idCategoria%>" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="eliminarModalLabel<%= idCategoria%>">Confirmar Eliminación</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ¿Estás seguro de que deseas eliminar la categoría "<%= nombreCategoria%>"?
                                </div>
                                <div class="modal-footer">
                                    <form action="SvEliminarCategoria" method="POST">
                                        <input type="hidden" name="id_categoria" value="<%= idCategoria%>">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-danger">Eliminar</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                                        
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        // Cerrar la conexión y los recursos
                        try {
                            if (rs != null) {
                                rs.close();
                            }
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
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="templates/footer.jsp"%>
