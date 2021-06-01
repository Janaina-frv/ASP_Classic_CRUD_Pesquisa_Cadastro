<!--#include file="conexao.asp"-->

<script type="text/javascript">

function funcao(){
	event.preventDefault();
  	event.stopPropagation();
	var senha;
	var email;
	email = form2.login.value;
	senha = form2.senha.value;
	if(email == "" || senha == "" ){
		alert("Favor preencher todos os campos")
	}else if(email.length >=50){
		alert("O campo Login só aceita até 50 caracteres!")
	}else{
		document.form2.action ="index.asp?login=L";
		form2.submit();
	}
}

</script>
<%
Session.Contents("name") = ""

CriaConexao()
sql = "SELECT * FROM ASP_USUARIO" 
Set rsUsuario = Server.CreateObject("ADODB.Recordset")
Set rsUsuario = conexao.execute(sql)

If request.QueryString("login") = "L" Then
	Logar()
end if
If request.QueryString("cadastro") = "C" Then
	Session("name")="novo"
	Response.Redirect "pgCadastro.asp"
end if

Sub Logar()
	dim mensagem
	dim validacao
	login = Request.Form("login")
	senha = Request.Form("senha")
	Session("login")=login
	Session("senha")=senha

	set rsUsuario = Server.CreateObject("ADODB.recordset")
	sql="Select NMUSU, DCEML, DCSENUSU from ASP_USUARIO WHERE 1=1 and DCEML ='"& login&"' "
	Set rsUsuario = conexao.execute(sql)
	
 	if not rsUsuario.BOF and not rsUsuario.EOF then
 		if login = rsUsuario.Fields("DCEML") then
			validacao = "ok"
		end if
		if senha = rsUsuario.Fields("DCSENUSU") then
			validacao = validacao&"ok"
		else
	 		mensagem = "Senha incorreta!"
			response.write "<script>"
			response.write "alert('"&mensagem&"');"
			response.write "</script>"
			response.write login
			'form.login = login
			response.Form("login") = Session.Contents("senha")
			response.write senha
		end if
		if validacao = "okok" then
			Session("name")=rsUsuario.Fields("NMUSU")
			Response.Redirect "pgListagem.asp"
		end if	
 	else 'se o usuario nao existir no banco de dados'
		mensagem = "Esse e-mail não está cadastro!"
		response.write "<script>"
		response.write "alert('"&mensagem&"')"
		response.write "</script>"
	end if

	rsUsuario.close
	conexao.Close
	set rsUsuario=Nothing
	set conexao=Nothing
End Sub
%>


<!-- - 
4 - Quando a tela dá uma crítica de validação, mesmo assim a tela é limpa. O submit só pode ser executado se o formulário estiver preenchido corretamente; Desafio (se tiver tempo): manter nome, e-mail e data de nascimento preenchidos;
- ajax
-->