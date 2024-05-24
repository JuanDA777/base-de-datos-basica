<%@page import="java.sql.SQLException"%>
<%@page import="com.mycompany.farmacia.GestionarFarmacia"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file="templates/header.jsp"%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Formulario de Agregar Medicamento</h3>
                </div>
                <div class="card-body">
                    <form action="SvMedicamento" method="POST">
                        <div class="form-group">
                            <label for="nombre">Nombre Medicamento:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="precio">Precio:</label>
                            <input type="text" class="form-control" id="precio" name="precio" required>
                        </div>
                        <div class="form-group">
                            <label for="compuestos">Compuestos:</label>
                            <input type="text" class="form-control" id="compuestos" name="compuestos">
                        </div>
                        <div class="form-group">
                            <label for="fecha_vencimiento">Fecha de Vencimiento:</label>
                            <input type="date" class="form-control" id="fecha_vencimiento" name="fecha_vencimiento" required>
                        </div>
                        <div class="form-group">
                            <label for="cantidad_stock">Cantidad en Stock:</label>
                            <input type="number" class="form-control" id="cantidad_stock" name="cantidad_stock" required>
                        </div>
                        <div class="form-group">
                            <label for="categoria">Categoría:</label>
                            <select class="form-control" id="categoria" name="categoria" required>
                                <option value="" disabled selected>-- Selecciona una categoría --</option>
                                <%
                                    try {
                                        Connection conn = null;
                                        PreparedStatement stmt = null;
                                        ResultSet rs = null;

                                        GestionarFarmacia gestionar = new GestionarFarmacia();
                                        conn = gestionar.establecerConexion();

                                        String sql = "SELECT * FROM farmacia.categorias;";
                                        stmt = conn.prepareStatement(sql);
                                        rs = stmt.executeQuery();

                                        while (rs.next()) {
                                            int idCategoria = rs.getInt("ID_Categoria");
                                            String categoria = rs.getString("Nombre_Categoria");
                                %>
                                <option value="<%= idCategoria%>"><%= categoria%></option>
                                <%
                                        }
                                        conn.close(); // Cerrar la conexión cuando hayas terminado de usarla
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Agregar Medicamento</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-bottom: 50px;"></div>
<%@include file="templates/footer.jsp"%>
