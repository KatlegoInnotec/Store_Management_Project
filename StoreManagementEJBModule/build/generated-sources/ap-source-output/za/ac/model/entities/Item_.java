package za.ac.model.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-08T14:23:34")
@StaticMetamodel(Item.class)
public class Item_ { 

    public static volatile SingularAttribute<Item, Date> date;
    public static volatile SingularAttribute<Item, Long> itemId;
    public static volatile SingularAttribute<Item, String> itemName;
    public static volatile SingularAttribute<Item, String> itemBrand;
    public static volatile SingularAttribute<Item, Integer> quantity;
    public static volatile SingularAttribute<Item, Double> ItemPrice;
    public static volatile SingularAttribute<Item, Long> empno;

}