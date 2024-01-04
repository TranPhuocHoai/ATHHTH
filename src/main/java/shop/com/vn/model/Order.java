package shop.com.vn.model;

import java.io.Serializable;

public class Order implements Serializable {
    private int idorder;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String address;
    private int payment;
    private int idAcc, status;
    private String hashInfOrder, create_date;
    public Order() {
    }

    public Order(int idorder, String firstName, String lastName, String email, String phone, String address, int payment, int idAcc, int status, String hashInfOrder, String create_date) {
        this.idorder = idorder;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.payment = payment;
        this.idAcc = idAcc;
        this.status = status;
        this.hashInfOrder = hashInfOrder;
        this.create_date = create_date;
    }

    @Override
    public String toString() {
        return "Order{" +
                "idorder=" + idorder +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", payment=" + payment +
                ", idAcc=" + idAcc +
                ", status=" + status +
                ", hashInfOrder='" + hashInfOrder + '\'' +
                ", create_date='" + create_date + '\'' +
                '}';
    }

    public int getIdorder() {
        return idorder;
    }

    public void setIdorder(int idorder) {
        this.idorder = idorder;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public int getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(int idAcc) {
        this.idAcc = idAcc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getHashInfOrder() {
        return hashInfOrder;
    }

    public void setHashInfOrder(String hashInfOrder) {
        this.hashInfOrder = hashInfOrder;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }
}