
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        
        <title>Les Client(e)s du cabinet</title>
    </head>
    <body>
        
<%
       Connection con;
       String msg = "";
       String color = "";
       
       if(request.getMethod().compareToIgnoreCase("post")==0)
       {
            try{
                String nom = request.getParameter("nomPat");
                String prenom = request.getParameter("prenomPat");
                String dateNaiss = request.getParameter("DateNaiss");
                String CIN = request.getParameter("CIN");
                String adresse = request.getParameter("adressePat");
                String contact = request.getParameter("contactPat");
                String dateVenu = request.getParameter("dateVenu");
                String Motif = request.getParameter("Motif");
                
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/gestionpatient","root","");
                String query = "INSERT INTO patient(nomPat,prenomPat,DateNaiss,CIN,adressePat,contactPat,dateVenu,Motif) VALUES (?,?,?,?,?,?,?,?)";
                
                PreparedStatement pst = con.prepareStatement(query);
                
                pst.setString(1, nom);
                pst.setString(2, prenom);
                pst.setString(3, dateNaiss); 
                pst.setString(4, CIN);
                pst.setString(5, adresse);
                pst.setString(6, contact);
                pst.setString(7, dateVenu);
                pst.setString(8, Motif);
                
                pst.executeUpdate();
                
                color = "grey";
                msg = "Client ajouté avec succès";
                
               }catch(Exception ex){
                   ex.printStackTrace();
                   color = "red";
                   msg = "Erreur";
               
            }
       }
    %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <title>Les Client(e)s du cabinet</title>
    </head>
    <body>
        <div class="form-group col-12">
        <h4 style="color: <%= color %>"><%= msg %></h4>
    </div>
    
        <div class="form-group" align="center" >
            <div class="col-sm-4">
               
                <form  method="post" action="patient.jsp" class="form-horizontal">  
                    <h2 style="text-align: center">INSCRIPTIONS CLIENTS</h2>
                
                <div alight="left">
                    <label class =" form-label">Nom du Client</label> 
                    <input type="varchar" name="nomPat" class="form-control" id="nomPat">
                </div>
                <div alight="left">
                    <label class =" form-label">Prenom du client</label> 
                    <input type="varchar" name="prenomPat" class="form-control" id="prenomPat">
                </div>
                <div alight="left">
                    <label class =" form-label">Date de Naissance</label> 
                    <input type="date" name="DateNaiss" class="form-control" id="DateNaiss">
                </div>
                <div alight="left">
                    <label class =" form-label">CIN</label> 
                    <input type="decimal" name="CIN" class="form-control" id="CIN">
                </div>
                <div alight="left">
                    <label class =" form-label">Adresse</label> 
                    <input type="varchar" name="adressePat" class="form-control" id="adressePat">
                </div>
                <div alight="left">
                    <label class =" form-label">Contact</label> 
                    <input type="integer" name="contactPat" class="form-control" id="contactPat">
                </div>
                    <div alight="left">
                    <label class =" form-label">Date d'arrivée</label> 
                    <input type="date" name="dateVenu" class="form-control" id="dateVenu">
                </div>
               
                <div alight="left">
                    <label class =" form-label">Motif</label> 
                    <input type="text" name="Motif" class="form-control" id="Motif">
                </div>
               <br>
                <div alight="right">
                    <button class="btn btn-success" style="width: 80px;">Valider</button>
                    <button class="btn btn-warning" style="width: 80px;">Annuler</button>
                   
                    
                </div>
               <br>
               <div alight="right">
                   <a href="listePatient.jsp">Liste</a>
                   <a href="Accueil.jsp">Accueil</a>
                </div>
                </form>
            
          </div>
        </div>
        
    </body>
</html>
