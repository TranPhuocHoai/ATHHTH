package shop.com.vn.model;

import java.io.Serializable;

public class Footer implements Serializable {
    private int idFooter;
    private  String introduce;
    private  String certify;
    private  String pay;
    private  String promotion;
    private  String phone;
    private  String address;
    private  String email;

    public Footer() {
    }

    public Footer(int idFooter, String introduce, String certify, String pay, String promotion, String phone, String address, String email) {
        this.idFooter = idFooter;
        this.introduce = introduce;
        this.certify = certify;
        this.pay = pay;
        this.promotion = promotion;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public int getIdFooter() {
        return idFooter;
    }

    public void setIdFooter(int idFooter) {
        this.idFooter = idFooter;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getCertify() {
        return certify;
    }

    public void setCertify(String certify) {
        this.certify = certify;
    }

    public String getPay() {
        return pay;
    }

    public void setPay(String pay) {
        this.pay = pay;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Footer{" +
                "idFooter=" + idFooter +
                ", introduce='" + introduce + '\'' +
                ", certify='" + certify + '\'' +
                ", pay='" + pay + '\'' +
                ", promotion='" + promotion + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
