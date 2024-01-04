package shop.com.vn.model;

import java.io.Serializable;

public class Payment implements Serializable {
    private int idPm;
    private  String namePm;

    public Payment() {
    }

    public Payment(int idPm, String namePm) {
        this.idPm = idPm;
        this.namePm = namePm;
    }

    public int getIdPm() {
        return idPm;
    }

    public void setIdPm(int idPm) {
        this.idPm = idPm;
    }

    public String getNamePm() {
        return namePm;
    }

    public void setNamePm(String namePm) {
        this.namePm = namePm;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "idPm=" + idPm +
                ", namePm='" + namePm + '\'' +
                '}';
    }
}
