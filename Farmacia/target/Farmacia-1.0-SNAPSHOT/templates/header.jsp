<%-- 
    Document   : index
    Created on : 22 may 2024, 19:49:47
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Drogas JJ</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        .navbar-brand img {
            height: 50px;
        }
        .hero {
            background: url('https://www.unir.net/wp-content/uploads/2022/10/efficient-pharmacy-operations-thanks-to-teamwork-picture-id1036131880.jpg') no-repeat center center;
            background-size: cover;
            color: white;
            padding: 150px 0;
            text-align: center;
        }
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 1.5rem;
        }
        .services .icon {
            font-size: 4rem;
            color: #28a745;
        }
        .footer {
            background: #343a40;
            color: white;
            padding: 20px 0;
        }
        .footer a {
            color: #28a745;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.jsp">
            <img src="imagenes/logo.jpg" alt="Logo de Drogas JJ">
            Drogas JJ
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="medicamentos.jsp">Agregar Medicamentos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="listaMedicamentos.jsp">Ver Medicamentos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="categorias.jsp">Categorias</a>
                </li>
            </ul>
        </div>
    </nav>