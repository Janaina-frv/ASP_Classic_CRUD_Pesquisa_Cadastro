<!DOCTYPE html>
<html lang="pt-br">
<!--#include virtual ="head.asp"-->

<body>
	<!--#include file="bdo/conectarLogin.asp"-->

	<div class="container" id="form1">
		<div class="row">
			<h2>NORTHWIND</h2>
		</div>
		<div class="row">
			<form class="form-inline w-100" method="post" name ="form2" id="form2" action="index.asp">
				<div class="form-group mb-2 col-md-4">
					<label for="exampleInputEmail1" class="w-100 text-center" >E-mail</label>
					<input type="email" class="form-control w-100" aria-describedby="emailHelp" name="login" maxlength="50" required>
					<label class="form-check-label w-100 text-center" for="exampleCheck1">Esqueci a senha</label>
				</div>
				<div class="form-group mx-sm-3 mb-2 col-md-4">
					<label for="exampleInputPassword1" class="w-100 text-center">Senha</label>
					<input type="password" class="form-control w-100" name="senha" maxlength="100" required>
					<a href="index.asp?cadastro=C" class="w-100 text-center">Novo usuário</a>
				</div>
				<button type="button" class="btn btn-primary col-md-3" onclick="funcao()">Entrar</button>
			</form>
		</div>
	</div>

<!--#include virtual ="script.asp"-->
</body>
</html>