<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gambbu Turismo - Lista de Clientes</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
     <a class="navbar-brand" href="#" style="color: blue;"><img src="Imagens/Logo_Branca_1-removebg-preview.png"/></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"> <a class="nav-link active" aria-current="page" href="PaginaInicial.html">Página Inicial</a> </li>
        <li class="nav-item"><a class="nav-link" href="CreateAndFind">Lista de Clientes</a> </li>
    <li class="nav-item"><a  class="nav-link" href="Promocoes.html">Promoções</a></li>
    <li class="nav-item"><a  class="nav-link" href="DestinosNac.html">Destinos Nacionais</a></li>
    <li class="nav-item"><a  class="nav-link" href="DestinosInter.html">Destinos Internacionais</a></li>
    <li class="nav-item"><a  class="nav-link" href="Contatos.html">Fale Conosco</a></li>
      </ul>
      <form action="CreateAndFind" method="GET" class="d-flex">
        <input name="pesquisa" class="form-control me-2" type="search" placeholder="Informe nome ou CPF" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Procurar</button>
      </form>
    </div>
  </div>
</nav>
<div class="container">
   <div class="row">
     <div class="cold-md-7">
     <hr> 
     <h3 style="color: blue;"> Lista de Clientes Cadastrados</h3>
     <hr>
     <table class="table">
     <thead>
     <tr>
     <th>Id</th>
     <th>Nome</th>
     <th>CPF</th>
     <th>Nascimento</th>
     <th>Endereço</th>
     <th>Telefone</th>
     <th>Email</th>
     <th>Senha</th>
     </tr>
      </thead>
      <tbody>
      <c:forEach items="${clientes}" var="cliente">
							<tr>
								<td>${cliente.id}</td>
								<td>${cliente.nome}</td>
								<td>${cliente.cpf}</td>
								<td>${cliente.nascimento}</td>
								<td>${cliente.endereco}</td>
								<td>${cliente.telefone}</td>
								<td>${cliente.email}</td>
								<td>${cliente.senha}</td>
								<td>
									<a href="ClienteDestroy?clienteId=${cliente.id}">Deletar</a> |
									<a href="ClienteUpdate?clienteId=${cliente.id}">Atualizar</a>
								</td>
							</tr>
						</c:forEach>
      </tbody>
     </table>
     <h5><a href="Index.html">Voltar para o Cadastro de Clientes</a></h5>
     </div>
   </div>
</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>