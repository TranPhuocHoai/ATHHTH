package shop.com.vn.model;

import java.io.Serializable;

public class Status implements Serializable {
    int idsta;
    String namesta;

    public Status(int idsta, String namesta) {
        this.idsta = idsta;
        this.namesta = namesta;
    }

    public Status() {
    }

    public int getidsta() {
        return idsta;
    }

    public void setidsta(int idsta) {
        this.idsta = idsta;
    }

    public String getnamesta() {
        return namesta;
    }

    public void setnamesta(String namesta) {
        this.namesta = namesta;
    }

    @Override
    public String toString() {
        return "Status{" +
                "idsta='" + idsta + '\'' +
                ", namesta='" + namesta + '\'' +
                '}';
    }
}
