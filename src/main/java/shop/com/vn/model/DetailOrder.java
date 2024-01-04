package shop.com.vn.model;

import java.io.Serializable;

public class DetailOrder implements Serializable {
    private  int idOrder;
    private int idProduct;
    private  int price;
    private  int quantity;

    public DetailOrder() {
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "DetailOrder{" +
                "idOrder=" + idOrder +
                ", idProduct=" + idProduct +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}
