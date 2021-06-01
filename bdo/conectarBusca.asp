<!--#include file="conexao.asp"-->

<%
If Session.Contents("name") = "" or Session.Contents("name")="novo" Then
   Response.Redirect("index.asp")
   Session.Contents("name") = ""
End If
Session.Timeout=5

Response.ContentType = "text/html"
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"

CriaConexao()

Set rsBusca = Server.CreateObject("ADODB.Recordset")
sql = "SELECT CategoryID, CategoryName FROM Categories  " 
rsBusca.Open sql, conexao

nome=Request.Form("nome")
categoria=Request.Form("cat")

sql="SELECT p.ProductName,c.CategoryID, p.UnitPrice, p.UnitsInStock, c.CategoryName FROM Products p,  Categories c where p.CategoryID=c.CategoryID "

If nome<>""  then
sql= sql & " and p.ProductName LIKE '%" & nome & "%'"
End if
If categoria<>""  then
sql= sql & " and p.CategoryID='" & categoria & "'"
End if

set rsUsuario=Server.CreateObject("ADODB.Recordset")
rsUsuario.Open sql,conexao
%>