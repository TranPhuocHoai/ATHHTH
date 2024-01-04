package shop.com.vn.model;

import java.io.Serializable;

public class Account implements Serializable {
    private  int id;
    private  String user;
    private  String email;
    private  String phone;
    private  String pass;
    private  String img;
    private  String address;
    private  String fullName;
    private int managerAccount, managerProduct, managerHome, managerBlog, assistant,managerOrder;

    public Account(int id, String user, String email, String phone, String pass, String img, String address, String fullName, int managerAccount, int managerProduct, int managerHome, int managerBlog, int assistant, int managerOrder) {
        this.id = id;
        this.user = user;
        this.email = email;
        this.phone = phone;
        this.pass = pass;
        this.img = img;
        this.address = address;
        this.fullName = fullName;
        this.managerAccount = managerAccount;
        this.managerProduct = managerProduct;
        this.managerHome = managerHome;
        this.managerBlog = managerBlog;
        this.assistant = assistant;
        this.managerOrder=managerOrder;
    }

    public Account() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getManagerAccount() {
        return managerAccount;
    }

    public void setManagerAccount(int managerAccount) {
        this.managerAccount = managerAccount;
    }

    public int getManagerProduct() {
        return managerProduct;
    }

    public void setManagerProduct(int managerProduct) {
        this.managerProduct = managerProduct;
    }

    public int getManagerHome() {
        return managerHome;
    }

    public void setManagerHome(int managerHome) {
        this.managerHome = managerHome;
    }

    public int getManagerBlog() {
        return managerBlog;
    }

    public void setManagerBlog(int managerBlog) {
        this.managerBlog = managerBlog;
    }

    public int getAssistant() {
        return assistant;
    }

    public void setAssistant(int assistant) {
        this.assistant = assistant;
    }

    public int getManagerOrder() {
        return managerOrder;
    }

    public void setManagerOrder(int managerOrder) {
        this.managerOrder = managerOrder;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", pass='" + pass + '\'' +
                ", img='" + img + '\'' +
                ", address='" + address + '\'' +
                ", fullName='" + fullName + '\'' +
                ", managerAccount=" + managerAccount +
                ", managerProduct=" + managerProduct +
                ", managerHome=" + managerHome +
                ", managerBlog=" + managerBlog +
                ", assistant=" + assistant +
                ", managerOrder=" + managerOrder +
                '}';
    }
}
