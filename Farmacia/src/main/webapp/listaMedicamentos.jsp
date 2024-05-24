<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.farmacia.GestionarFarmacia"%>
<%@include file="templates/header.jsp"%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h2 class="text-center">Lista de Medicamentos</h2>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Compuestos</th>
                        <th>Fecha de Vencimiento</th>
                        <th>Cantidad en Stock</th>
                        <th>Categoría</th>
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
                            String sql = "SELECT m.ID_Medicamento, m.Nombre, m.Precio, m.Compuestos, m.Fecha_Vencimiento, m.Cantidad_Stock, c.Nombre_Categoria " +
                                         "FROM Medicamentos m " +
                                         "INNER JOIN Categorias c ON m.ID_Categoria = c.ID_Categoria";
                            pstmt = conn.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                int idMedicamento = rs.getInt("ID_Medicamento");
                                String nombre = rs.getString("Nombre");
                                double precio = rs.getDouble("Precio");
                                String compuestos = rs.getString("Compuestos");
                                String fechaVencimiento = rs.getString("Fecha_Vencimiento");
                                int cantidadStock = rs.getInt("Cantidad_Stock");
                                String categoria = rs.getString("Nombre_Categoria");
                    %>
                    <tr>
                        <td><%= idMedicamento %></td>
                        <td><%= nombre %></td>
                        <td>$<%= precio %></td>
                        <td><%= compuestos %></td>
                        <td><%= fechaVencimiento %></td>
                        <td><%= cantidadStock %></td>
                        <td><%= categoria %></td>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm editar-btn"
                                    data-bs-toggle="modal" data-bs-target="#editarMedicamentoModal"
                                    data-idMedicamento="<%= idMedicamento%>"
                                    data-nombre="<%= nombre%>"
                                    data-precio="<%= precio%>"
                                    data-compuestos="<%= compuestos%>"
                                    data-fechaVencimiento="<%= fechaVencimiento%>"
                                    data-cantidadStock="<%= cantidadStock%>"
                                    data-categoria="<%= categoria%>">
                                <i class="fas fa-edit"></i> Editar
                            </button>
                        </td>

                        <td>
                            <button type="button" class="btn btn-danger btn-sm eliminar-btn"
                                    data-idMedicamento="<%= idMedicamento%>">
                                <i class="fas fa-trash-alt"></i> Eliminar
                            </button>
                        </td>

                    </tr>
                    <% 
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            // Cerrar la conexión y los recursos
                            try {
                                if (rs != null) rs.close();
                                if (pstmt != null) pstmt.close();
                                if (conn != null) conn.close();
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
<div class="modal fade" id="editarMedicamentoModal" tabindex="-1" aria-labelledby="editarMedicamentoModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarMedicamentoModalLabel">Editar Medicamento</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editarMedicamentoForm" action="SvEditarMedicamento" method="POST">
                    <!-- Campos del formulario para editar medicamento -->
                    <input type="hidden" id="idMedicamentoEditar" name="idMedicamento">
                    <div class="mb-3">
                        <label for="nombreEditar" class="form-label">Nombre:</label>
                        <input type="text" class="form-control" id="nombreEditar" name="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="precioEditar" class="form-label">Precio:</label>
                        <input type="text" class="form-control" id="precioEditar" name="precio" required>
                    </div>
                    <div class="mb-3">
                        <label for="compuestosEditar" class="form-label">Compuestos:</label>
                        <input type="text" class="form-control" id="compuestosEditar" name="compuestos">
                    </div>
                    <div class="mb-3">
                        <label for="fechaVencimientoEditar" class="form-label">Fecha de Vencimiento:</label>
                        <input type="date" class="form-control" id="fechaVencimientoEditar" name="fechaVencimiento" required>
                    </div>
                    <div class="mb-3">
                        <label for="cantidadStockEditar" class="form-label">Cantidad en Stock:</label>
                        <input type="number" class="form-control" id="cantidadStockEditar" name="cantidadStock" required>
                    </div>
                    <div class="form-group">
                            <label for="categoria">Categoría:</label>
                            <select class="form-control" id="categoria" name="categoria" required>
                                <option value="" disabled selected>-- Selecciona una categoría --</option>
                                <%
                                    try {
                                        
                                        PreparedStatement stmt = null;
                                        
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
                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal de confirmación -->
<div class="modal fade" id="eliminarMedicamentoModal" tabindex="-1" aria-labelledby="eliminarMedicamentoModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eliminarMedicamentoModalLabel">Confirmar Eliminación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Estás seguro de que deseas eliminar este medicamento?
            </div>
            <div class="modal-footer">
                <form id="eliminarMedicamentoForm" method="post">
                    <input type="hidden" id="idMedicamentoEliminar" name="idMedicamento">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button id="confirmarEliminarBtn" type="button" class="btn btn-danger">Eliminar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="templates/footer.jsp"%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Escuchar clic en los botones de editar
        var editarButtons = document.querySelectorAll('.editar-btn');
        editarButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                // Obtener los datos del medicamento seleccionado
                var idMedicamento = button.getAttribute('data-idMedicamento');
                var nombre = button.getAttribute('data-nombre');
                var precio = button.getAttribute('data-precio');
                var compuestos = button.getAttribute('data-compuestos');
                var fechaVencimiento = button.getAttribute('data-fechaVencimiento');
                var cantidadStock = button.getAttribute('data-cantidadStock');
                var categoria = button.getAttribute('data-categoria');
                
                // Autorellenar los campos del formulario
                document.getElementById('idMedicamentoEditar').value = idMedicamento;
                document.getElementById('nombreEditar').value = nombre;
                document.getElementById('precioEditar').value = precio;
                document.getElementById('compuestosEditar').value = compuestos;
                document.getElementById('fechaVencimientoEditar').value = fechaVencimiento;
                document.getElementById('cantidadStockEditar').value = cantidadStock;
                var categoriaSelect = document.getElementById('categoria');
                
                for (var i = 0; i < categoriaSelect.options.length; i++) {
                    if (categoriaSelect.options[i].text === categoria) {
                        categoriaSelect.selectedIndex = i;
                        break;
                    }
                }
                

                // Abrir el modal
                var editarMedicamentoModal = new bootstrap.Modal(document.getElementById('editarMedicamentoModal'));
                editarMedicamentoModal.show();
            });
        });
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Escuchar clic en los botones de eliminar
        var eliminarButtons = document.querySelectorAll('.eliminar-btn');
        eliminarButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                var idMedicamento = button.getAttribute('data-idMedicamento');
                // Mostrar la modal de confirmación
                var eliminarMedicamentoModal = new bootstrap.Modal(document.getElementById('eliminarMedicamentoModal'));
                eliminarMedicamentoModal.show();

                // Configurar el formulario de eliminación en la modal
                var form = document.getElementById('eliminarMedicamentoForm');
                form.setAttribute('action', 'SvEliminarMedicamento');
                document.getElementById('idMedicamentoEliminar').value = idMedicamento;

                // Enviar formulario al confirmar
                document.getElementById('confirmarEliminarBtn').addEventListener('click', function () {
                    form.submit();
                });
            });
        });
    });
</script>
<script>
    $('#editarMedicamentoModal').on('hidden.bs.modal', function () {
        $(this).find('form')[0].reset();
    });
</script>
