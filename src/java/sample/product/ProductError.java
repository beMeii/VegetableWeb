/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Mai
 */
public class ProductError {
    private String productIDError;
    private String productNameError;
    private String productPriceError;
    private String quantiryError;
    private String statusError;
    private String imageError;
    private String productMessage;

    public ProductError() {
    }

    public ProductError(String productIDError, String productNameError, String productPriceError, String quantiryError, String statusError, String imageError, String productMessage) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.productPriceError = productPriceError;
        this.quantiryError = quantiryError;
        this.statusError = statusError;
        this.imageError = imageError;
        this.productMessage = productMessage;
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

    public String getProductPriceError() {
        return productPriceError;
    }

    public void setProductPriceError(String productPriceError) {
        this.productPriceError = productPriceError;
    }

    public String getQuantiryError() {
        return quantiryError;
    }

    public void setQuantiryError(String quantiryError) {
        this.quantiryError = quantiryError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getProductMessage() {
        return productMessage;
    }

    public void setProductMessage(String productMessage) {
        this.productMessage = productMessage;
    }
    
    
}
