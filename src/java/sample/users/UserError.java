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
public class UserError {
    private String userIDError;
    private String fullNameError;
    private String roleIDError;
    private String addressError;
    private String birthDayError;
    private String phoneError;
    private String emailError;
    private String passwordError;
    private String confirmError;

    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.roleIDError = "";
        this.addressError = "";
        this.birthDayError = "";
        this.phoneError = "";
        this.emailError = "";
        this.passwordError = "";
        this.confirmError = "";
        
    }

    public UserError(String userIDError, String fullNameError, String roleIDError, String addressError, String birthDayError, String phoneError, String emailError, String passwordError, String confirmError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
        this.addressError = addressError;
        this.birthDayError = birthDayError;
        this.phoneError = phoneError;
        this.emailError = emailError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getBirthDayError() {
        return birthDayError;
    }

    public void setBirthDayError(String birthDayError) {
        this.birthDayError = birthDayError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }
    
    
}
