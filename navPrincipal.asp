<nav class="nav flex-column px-4">
	<h1 class="align-self-start">NORTHWIND</h1>
	<p class="align-self-center">Logado como usuário 
		<%
		fname=Session.Contents("name")
		Response.Write(fname)
		%>
	</p>
	<a class="nav-link align-self-end" href="index.asp">Desconectar</a>
</nav>