
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        
        <title>Liste des Clients</title>
    </head>
    <body>
        <h2 style="text-align: center">LISTES DES CLIENTS</h2>
        <div class="form-group" align="left" >
            <div align="left">
                <a href="Accueil.jsp"><button class="btn-success" style="width: 80px;">Accueil</button></a>
            </div>
            <div class="col-sm-4">
                <div class="panel-body">
                    
                    <table class="table table-hover" width="100%">
                        <thead>
                            <tr>
                                <th>Id Client</th>
                                <th>Nom Client</th>
                                <th>Prenom Client</th>
                                <th>Date de Naissance</th>
                                <th>CIN</th>
                                <th>Adresse</th>
                                <th>Contact</th>
                                <th>Date d'arrivée</th>
                                <th>Motif</th>
                                
                            </tr>
                        </thead>    
                        <tbody>
                            <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
       
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/gestionpatient","root","");   
                            
                            String query = "select * from patient";
                            pst = con.prepareStatement(query);
                            rs = pst.executeQuery();
                            
                            while(rs.next()){
                                String IdPat = rs.getString("IdPat");
                            %>
                            
                            <tr>
                                <th scope="row"><%=rs.getString("IdPat") %></th>    
                                    <td><%=rs.getString("nomPat") %></td>
                                    <td><%=rs.getString("prenomPat") %></td>
                                    <td><%=rs.getString("DateNaiss") %></td>
                                    <td><%=rs.getString("CIN") %></td>
                                    <td><%=rs.getString("adressePat") %></td>
                                    <td><%=rs.getString("contactPat") %></td>
                                    <td><%=rs.getString("dateVenu") %></td>
                                    <td><%=rs.getString("Motif") %></td>
                                    <td><a class="btn btn-success" href="updateCli.jsp?IdPat=<%= rs.getString("IdPat") %>" role="button">Modifier</a></td>
                                    <td><a class="btn btn-danger" href="deleteCli.jsp?IdPat=<%= rs.getString("IdPat") %>" role="button">Supprimer</a></td>
                                    
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                           
                    </table>
                        
                </div>
                
            </div>
        </div>
        
    </body>
</html>
