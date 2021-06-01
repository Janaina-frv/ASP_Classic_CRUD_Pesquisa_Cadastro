<div class="col-sm-9" id="pesquisar">
  <form class="form-inline w-100 p-4" method="post" action="pgListagem.asp">
    <div class="form-group col-sm-4">
      <label>Nome</label>
      <input type="text" class="form-control m-2" name="nome">
    </div>
    <div class="form-group col-sm-4"">
      <label>Categoria</label>
      <select name="cat" class="form-control m-2">
         <option value="">Selecione</option>
        <%
        do until rsBusca.EOF
          response.write("<option value='"&rsBusca.fields("CategoryID")&"'")
          if rsBusca.fields("CategoryName")=CategoryName then
            response.write(" selected")
          end if                                                  
          response.write(">")
          response.write(rsBusca.fields("CategoryName"))
          response.write("</option>")
          rsBusca.MoveNext
        loop
        rsBusca.Close
        set rsBusca=Nothing 
        %>
      </select>
    </div>
    <button type="submit" value="Submit" class="btn btn-primary mb-2 col-sm-2">Pesquisar</button>
  </form>
 <table width="80%" align="center" cellspacing="0" cellpadding="2" border="1" >
   <tr>
     <th>ProductName</th>
     <th>CategoryName</th>
     <th>UnitPrice</th>
     <th>UnitsInStock</th>
   </tr>
   <%
   do until rsUsuario.EOF
     response.write("<tr>")
     response.write("<td>" & rsUsuario.fields("ProductName") & "</td>")
     response.write("<td>" & rsUsuario.fields("CategoryName") & "</td>")
     response.write("<td>" & rsUsuario.fields("UnitPrice") & "</td>")
     response.write("<td>" & rsUsuario.fields("UnitsInStock") & "</td>")
     response.write("</tr>")
     rsUsuario.MoveNext
   loop
   rsUsuario.close
   set rsUsuario=Nothing
   conexao.Close
   set conexao=Nothing
   %>
 </table>
</div>