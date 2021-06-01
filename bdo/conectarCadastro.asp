<!--#include file="conexao.asp"-->

<script type="text/javascript">

function funcao(){
    event.preventDefault();
    event.stopPropagation();
    var dtnasc = form.dtnasc.value;
    var senha = form.senha.value;
    var senha2 = form.senha2.value;
    var validacao = false;
    var patternData = /^(((0[1-9]|[12][0-9]|3[01])([-.\/])(0[13578]|10|12)([-.\/])(\d{4}))|(([0][1-9]|[12][0-9]|30)([-.\/])(0[469]|11)([-.\/])(\d{4}))|((0[1-9]|1[0-9]|2[0-8])([-.\/])(02)([-.\/])(\d{4}))|((29)(\.|-|\/)(02)([-.\/])([02468][048]00))|((29)([-.\/])(02)([-.\/])([13579][26]00))|((29)([-.\/])(02)([-.\/])([0-9][0-9][0][48]))|((29)([-.\/])(02)([-.\/])([0-9][0-9][2468][048]))|((29)([-.\/])(02)([-.\/])([0-9][0-9][13579][26])))$/;
    if(senha != senha2){
      alert("Senhas devem ser iguais!");
    }else if(!patternData.test(dtnasc)){
      alert("Digite a data no formato Dia/Mês/Ano");
    }else{
      document.getElementById("form").action ="pgCadastro.asp?gravar=C";
      form.submit()};
}
function mascara_data(campo, valor){
  var mydata = '';
  mydata = mydata + valor;
  if (mydata.length == 2){
    mydata = mydata + '/';
    campo.value = mydata;
  }
  if (mydata.length == 5){
    mydata = mydata + '/';
    campo.value = mydata;
  }
}
</script>
<%
If Session.Contents("name") = "" Then
   Response.Redirect("index.asp")
   Session.Contents("name") = ""
End If
Session.Timeout=5

CriaConexao()
sql = "SELECT * FROM ASP_USUARIO" 
Set rsUsuario = Server.CreateObject("ADODB.Recordset")
Set rsUsuario = conexao.execute(sql)

If request.QueryString("gravar") = "C" Then
  dim check
  check= request.form("check")
  if check = "" Then
    check="N"
  end if

  dim dtnasc, dia, mes, ano, dtnascfinal
  dtnasc= request.form("dtnasc")
  dia = Mid(dtnasc,1,2)
  mes = Mid(dtnasc,4,2)
  ano = Mid(dtnasc,7,4)
  dtnascfinal = ano&"-"&mes&"-"&dia

  dim email
  email= request.form("email")
  
  set rsUsuario = Server.CreateObject("ADODB.recordset")
  sql="Select DCEML from ASP_USUARIO WHERE 1=1 and DCEML ='"& email&"' "
  Set rsUsuario = conexao.execute(sql)
  
  if not rsUsuario.BOF and not rsUsuario.EOF then
    response.write "<script>"
    response.write "alert('Esse e-mail já existe!')"
    response.write "</script>"
  else 
    sql = "INSERT INTO ASP_USUARIO (NMUSU,DCEML,DTNSC,DCSENUSU,FLEML) VALUES ('"& request.form("nome") & "','"& request.form("email") & "','"&dtnascfinal&"','"& request.form("senha") &"','"& check &"')" 
    Set rsGravar = conexao.execute(sql)
    Response.Redirect "index.asp"
  end if
end if 

conexao.Close
Set rsGravar = Nothing
set rsUsuario=Nothing
set conexao=Nothing
%>