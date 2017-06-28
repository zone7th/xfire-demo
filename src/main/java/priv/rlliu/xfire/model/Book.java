/**
 * <p>
 * Copyright(c) @2016 TIANPING AUTO INSURANCE CO.,LTD.
 * </p>
 */
package priv.rlliu.xfire.model;

/**
 * <p>
 * description:书本实体
 * </p>
 * 
 * @author ex_liuruili
 * @since 2016年9月23日
 * @see
 */
public class Book {
    private String name;
    private String author;
    private double price;
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return the author
     */
    public String getAuthor() {
        return author;
    }
    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
        this.author = author;
    }
    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }
    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }
    
}
