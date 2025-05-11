/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.model.bl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import za.ac.model.entities.Item;

/**
 *
 * @author Kgothatso Moyo
 */
@Stateless
public class ItemFacade extends AbstractFacade<Item> implements ItemFacadeLocal {

    @PersistenceContext(unitName = "StoreManagementEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ItemFacade() {
        super(Item.class);
    }

    @Override
    public List<Item> searchFunction(String input) {
        
       String queryStr = "SELECT i FROM Item i WHERE LOWER(i.itemName) LIKE LOWER(?1) OR LOWER(i.itemBrand) LIKE LOWER(?1)";
       String pTerm = "%"+input+"%";
       Query query = em.createQuery(queryStr);
       query.setParameter(1, pTerm);
       
       
       
       List<Item> searchResults = query.getResultList();
       
       
       return searchResults;
    }
    
}
