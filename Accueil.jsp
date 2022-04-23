
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Accueil</title>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li class="menu-accueil">
                        <a href="Accueil.jsp" title="Accueil">Accueil</a>
                    </li>
                    <li class="menu-patient">
                        <a href="#" title="Les Clients">Les Clients</a>
                        <ul class="submenu">
                            <li>
                                <a href="patient.jsp" title="">Inscription des Clients</a>
                            </li><li>
                                <a href="listePatient.jsp" title="">Liste des clients</a>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-avocat">
                        <a href="#" title="Les Avocats">Les Avocats</a>
                        <ul class="submenu">
                            <li>
                                <a href="InscriAvocat.jsp" title="">Insertion des Avocats</a>
                            </li>
                            <li>
                                <a href="avocatDispo.jsp" title="">Fiche de présence</a>
                            </li>
                            <li>
                                <a href="listePresent.jsp" title="">Liste des avocats</a>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-deconnexion">
                        <a href="" title="Deconnexion">Deconnexion</a>
                    </li>
                </ul>
            </nav>
        </header>
    </body>
</html>
