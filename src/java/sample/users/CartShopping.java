/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public class CartShopping {

    private Map<String, ProductDTO> cart;

    public CartShopping() {
    }

    public CartShopping(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(product.getProductID())) {
            int currentQuantity = this.cart.get(product.getProductID()).getQuantity();
            product.setQuantity(currentQuantity + product.getQuantity());
        }
        this.cart.put(product.getProductID(), product);
        check = true;
        return check;
    }
       
    public boolean remove(String productID) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(productID)) {
                this.cart.remove(productID);
            }
        }
        return check;
    }

    public boolean edit(String productID, ProductDTO product) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(productID)) {
                this.cart.replace(productID, product);
                check = true;
            }
        }
        return check;
    }
}
