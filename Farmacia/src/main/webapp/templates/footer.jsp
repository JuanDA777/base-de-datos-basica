<!-- Footer -->
<footer class="footer text-center">
    <div class="container">
        <p>&copy; 2024 Drogas JJ. Todos los derechos reservados.</p>
        <a href="#">Política de Privacidad</a> | <a href="#">Términos de Uso</a>
    </div>
</footer>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $('#editarMedicamentoModal').on('hidden.bs.modal', function () {
            $(this).find('form')[0].reset(); // Limpiar el formulario al cerrar la modal
        });
    });
</script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
