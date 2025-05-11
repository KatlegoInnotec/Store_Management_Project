package za.ac.model.entities;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.model.entities.OrderItem;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-11T21:21:49")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, Long> custId;
    public static volatile SingularAttribute<Customer, String> name;
    public static volatile ListAttribute<Customer, OrderItem> orderList;

}