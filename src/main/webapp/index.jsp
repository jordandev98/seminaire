<%@ page import ="cal.seminaire.model.Produit" %>
<%@ page import ="cal.seminaire.service.ProduitService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Seminaire</title>
  </head>
  <body>

  <%
    Produit banane = new Produit("banane", "une banane jaune" , 1.0);
    ProduitService service = new ProduitService();
    service.ajouteTvq(banane);

  %>

  <h1><%banane.getNom();%></h1>
  <p><%banane.getDescription();%></p>
  <p><%banane.getPrix();%></p>
  </body>
</html>
