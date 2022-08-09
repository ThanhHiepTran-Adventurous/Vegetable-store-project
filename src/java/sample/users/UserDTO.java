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
public class UserDTO {

    private String userID;
    private String fullName;
    private String roleID;
    private String address;
    private String password;
    private String birthday;
    private String phone;
    private String email;

    public UserDTO() {
        this.userID = "";
        this.fullName = "";
        this.roleID = "";
        this.address = "";
        this.password = "";
        this.birthday = "";
        this.phone = "";
        this.email = "";
    }

    public UserDTO(String userID, String fullName, String roleID, String address, String password, String birthday, String phone, String email) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.address = address;
        this.password = password;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
