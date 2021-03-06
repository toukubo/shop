// license-header java merge-point
//
// Attention: Generated code! Do not modify by hand!
// Generated by: HibernateSearchProperties.vsl in andromda-spring-cartridge.
//
package net.malta;

/**
 * Stores the embedded values and asssociations of all entities in the system by type.  
 * Is used to determine the appropriate parameter name when an embedded value's property 
 * is referenced as the attribute to search by (as opposed to an association).
 * 
 * @author Chad Brandon
 */
 public class CriteriaSearchProperties
{
    private static final java.util.Map embeddedValuesByType = new java.util.HashMap();
    private static final java.util.Map navigableAssociationEndsByType = new java.util.HashMap();
    
    static
    {
        initialize1();
        initialize2();
        initialize3();
        initialize4();
        initialize5();
        initialize6();
        initialize7();
        initialize8();
        initialize9();
        initialize10();
        initialize11();
        initialize12();
        initialize13();
        initialize14();
        initialize15();
    }
    
    private static final void initialize1()
    {
        embeddedValuesByType.put(
            net.malta.model.DbFileImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.DbFileImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {

                }
            )
        );
    }
    
    private static final void initialize2()
    {
        embeddedValuesByType.put(
            net.malta.model.AttachmentImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.AttachmentImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("dbFile", net.malta.model.DbFileImpl.class), 
                    new AssociationType("aszoom", net.malta.model.ItemImpl.class), 
                    new AssociationType("asdetailed", net.malta.model.ItemImpl.class), 
                    new AssociationType("asdefault", net.malta.model.ItemImpl.class)
                }
            )
        );
    }
    
    private static final void initialize3()
    {
        embeddedValuesByType.put(
            net.malta.model.PublicUserImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.PublicUserImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("purchases", net.malta.model.PurchaseImpl.class), 
                    new AssociationType("deliveryAddresses", net.malta.model.DeliveryAddressImpl.class), 
                    new AssociationType("prefecture", net.malta.model.PrefectureImpl.class)
                }
            )
        );
    }
    
    private static final void initialize4()
    {
        embeddedValuesByType.put(
            net.malta.model.ItemImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.ItemImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("product", net.malta.model.ProductImpl.class), 
                    new AssociationType("choises", net.malta.model.ChoiseImpl.class), 
                    new AssociationType("carriage", net.malta.model.CarriageImpl.class), 
                    new AssociationType("zoom", net.malta.model.AttachmentImpl.class), 
                    new AssociationType("detailed", net.malta.model.AttachmentImpl.class), 
                    new AssociationType("defaultattachment", net.malta.model.AttachmentImpl.class)
                }
            )
        );
    }
    
    private static final void initialize5()
    {
        embeddedValuesByType.put(
            net.malta.model.PurchaseImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.PurchaseImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("publicUser", net.malta.model.PublicUserImpl.class), 
                    new AssociationType("choises", net.malta.model.ChoiseImpl.class), 
                    new AssociationType("paymentMethod", net.malta.model.PaymentMethodImpl.class)
                }
            )
        );
    }
    
    private static final void initialize6()
    {
        embeddedValuesByType.put(
            net.malta.model.ProductImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.ProductImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("items", net.malta.model.ItemImpl.class), 
                    new AssociationType("category", net.malta.model.CategoryImpl.class), 
                    new AssociationType("thumnail", net.malta.model.AttachmentImpl.class), 
                    new AssociationType("slideshow", net.malta.model.AttachmentImpl.class)
                }
            )
        );
    }
    
    private static final void initialize7()
    {
        embeddedValuesByType.put(
            net.malta.model.ChoiseImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.ChoiseImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("purchase", net.malta.model.PurchaseImpl.class), 
                    new AssociationType("item", net.malta.model.ItemImpl.class), 
                    new AssociationType("deliveryAddressChoises", net.malta.model.DeliveryAddressChoiseImpl.class)
                }
            )
        );
    }
    
    private static final void initialize8()
    {
        embeddedValuesByType.put(
            net.malta.model.CategoryImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.CategoryImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("products", net.malta.model.ProductImpl.class)
                }
            )
        );
    }
    
    private static final void initialize9()
    {
        embeddedValuesByType.put(
            net.malta.model.DeliveryAddressImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.DeliveryAddressImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("deliveryAddressChoises", net.malta.model.DeliveryAddressChoiseImpl.class), 
                    new AssociationType("publicUser", net.malta.model.PublicUserImpl.class), 
                    new AssociationType("giftCard", net.malta.model.GiftCardImpl.class), 
                    new AssociationType("prefecture", net.malta.model.PrefectureImpl.class)
                }
            )
        );
    }
    
    private static final void initialize10()
    {
        embeddedValuesByType.put(
            net.malta.model.DeliveryAddressChoiseImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.DeliveryAddressChoiseImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("deliveryAddress", net.malta.model.DeliveryAddressImpl.class), 
                    new AssociationType("choise", net.malta.model.ChoiseImpl.class), 
                    new AssociationType("giftCard", net.malta.model.GiftCardImpl.class)
                }
            )
        );
    }
    
    private static final void initialize11()
    {
        embeddedValuesByType.put(
            net.malta.model.GiftCardImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.GiftCardImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("deliveryAddresses", net.malta.model.DeliveryAddressImpl.class), 
                    new AssociationType("deliveryAddressChoises", net.malta.model.DeliveryAddressChoiseImpl.class)
                }
            )
        );
    }
    
    private static final void initialize12()
    {
        embeddedValuesByType.put(
            net.malta.model.StaticDataImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.StaticDataImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {

                }
            )
        );
    }
    
    private static final void initialize13()
    {
        embeddedValuesByType.put(
            net.malta.model.CarriageImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.CarriageImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("items", net.malta.model.ItemImpl.class)
                }
            )
        );
    }
    
    private static final void initialize14()
    {
        embeddedValuesByType.put(
            net.malta.model.PaymentMethodImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.PaymentMethodImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("purchases", net.malta.model.PurchaseImpl.class)
                }
            )
        );
    }
    
    private static final void initialize15()
    {
        embeddedValuesByType.put(
            net.malta.model.PrefectureImpl.class,
            null);
        navigableAssociationEndsByType.put(
            net.malta.model.PrefectureImpl.class,
            java.util.Arrays.asList(
                new AssociationType[] 
                {
                    new AssociationType("publicUsers", net.malta.model.PublicUserImpl.class), 
                    new AssociationType("deliveryAddresses", net.malta.model.DeliveryAddressImpl.class)
                }
            )
        );
    }
    
    /**
     * Attempts to get the embedded value list for the given type (or returns null
     * if one doesn't exist).
     * 
     * @param type the type of which to retrieve the value.
     * @return the collection of embedded value names.
     */
    public static java.util.Collection getEmbeddedValues(final Class type)
    {
        return (java.util.Collection)embeddedValuesByType.get(type);
    }
    
    /**
     * Gets the type of the navigable association end given the <code>ownerType</code>
     * and <code>name</code>
     *
     * @param ownerType the owner of the association.
     * @param name the name of the association end to find.
     * @return the type of the association end.
     */
    public static Class getNavigableAssociationEndType(final Class ownerType, final String name)
    {
        final java.util.Collection ends = (java.util.Collection)navigableAssociationEndsByType.get(ownerType);
        final AssociationType type = (AssociationType)org.apache.commons.collections.CollectionUtils.find(
            ends,
            new org.apache.commons.collections.Predicate()
            {
                public boolean evaluate(final Object object)
                {
                    return ((AssociationType)object).name.equals(name);
                }
            });
        return type != null ? type.type : null;
    }

    /**
     * A private class storing the association name and type.
     */    
    protected static final class AssociationType
    {
        protected AssociationType(final String name, final Class type)
        {
            this.name = name;
            this.type = type;
        }
        protected String name;
        protected Class type;
    }
}