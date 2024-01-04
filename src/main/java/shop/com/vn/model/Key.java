package shop.com.vn.model;

import shop.com.vn.service.OrderService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Key {
    int id, idA;
    String key_text;
    String create_date, expirate_date;

    public Key() {
    }

    public Key(int id, int idA, String key_text, String create_date, String expirate_date) {
        this.id = id;
        this.idA = idA;
        this.key_text = key_text;
        this.create_date = create_date;
        this.expirate_date = expirate_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public String getKey_text() {
        return key_text;
    }

    public void setKey_text(String key_text) {
        this.key_text = key_text;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getExpirate_date() {
        return expirate_date;
    }

    public void setExpirate_date(String expirate_date) {
        this.expirate_date = expirate_date;
    }

    @Override
    public String toString() {
        return "Key{" +
                "id=" + id +
                ", idA=" + idA +
                ", key_text='" + key_text + '\'' +
                ", create_date='" + create_date + '\'' +
                ", expirate_date='" + expirate_date + '\'' +
                '}';
    }
}
