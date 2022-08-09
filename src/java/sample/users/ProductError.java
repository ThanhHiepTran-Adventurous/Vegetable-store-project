/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

/**
 *
 * @author ADMIN
 */
public class ProductError {

    private String productIDError;
    private String productNameError;
    private float priceError;
    private int quantityError;
    private String categoryIDError;
    private String importDateError;
    private String usingDateError;
    private String imageError;

    public ProductError() {
        this.productIDError = "";
        this.productNameError = "";
        this.priceError = 0;
        this.quantityError = 0;
        this.categoryIDError = "";
        this.importDateError = "";
        this.usingDateError = "";
        this.imageError = "";
    }

    public ProductError(String productIDError, String productNameError, float priceError, int quantityError, String categoryIDError, String importDateError, String usingDateError, String imageError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.categoryIDError = categoryIDError;
        this.importDateError = importDateError;
        this.usingDateError = usingDateError;
        this.imageError = imageError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public float getPriceError() {
        return priceError;
    }

    public void setPriceError(float priceError) {
        this.priceError = priceError;
    }

    public int getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(int quantityError) {
        this.quantityError = quantityError;
    }

    public String getCategoryIDError() {
        return categoryIDError;
    }

    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    public String getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(String importDateError) {
        this.importDateError = importDateError;
    }

    public String getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(String usingDateError) {
        this.usingDateError = usingDateError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

}
