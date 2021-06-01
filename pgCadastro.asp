<!DOCTYPE html>
<html lang="pt-br">
<!--#include virtual ="head.asp"-->
<body>
  <!--#include file="bdo/conectarCadastro.asp"-->

  <div class="container" id="form1">
    <div class="row">
      <h2>NORTHWIND</h2>
    </div>
    <div class="row">
      <form class="w-100" method="post" name ="form" id="form" action="pgCadastro.asp" >
        <div class="form-group row">
          <label for="validationCustom03" class="col-sm-2 col-form-label">Nome</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="validationCustom03" name="nome" maxlength="50" required>
          </div>
        </div>
        <div class="form-group row">
          <label for="staticEmail" class="col-sm-2 col-form-label">E-mail</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" name="email"  maxlength="50" required>
          </div>
        </div>
        <div class="form-group row">
          <label for="staticEmail" class="col-sm-2 col-form-label" >Nascimento</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="dtnasc" maxlength="10" placeholder="DD-AA-MMMM" onkeyup="mascara_data(this, this.value)" required>
          </div>
        </div>
        <div class="form-group row" >
          <label for="validationDefault01" class="col-sm-2 col-form-label" >Senha</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="validationDefault01" name="senha" maxlength="100" required>
          </div>
        </div>
        <div class="form-group row" >
          <label for="inputPassword" class="col-sm-2 col-form-label">Senha</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" name="senha2" maxlength="100" required>
          </div>
        </div>
        <div class="form-check row" style="line-height: 1.0;">
          <input class="col-sm-1" type="checkbox" value="S" id="Check1" name="check" >
          <label class="col-sm-3" for="defaultCheck1">Receber e-mail</label>
        </div>
        <button type="submit" class="btn btn-primary col-md-3 mt-3" onclick="funcao()" >Gravar</button>
      </form>
    </div>
  </div>
<!-- onclick="funcao()" -->
<!--#include virtual ="script.asp"-->

</body>
</html>