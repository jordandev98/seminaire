package cal.seminaire.service;

import cal.seminaire.model.Produit;

public class ProduitService {

    private final double TVQ = 1.10;

    public void ajouteTvq (Produit produit) {
       produit.setPrix(produit.getPrix() * TVQ);
    }

}
