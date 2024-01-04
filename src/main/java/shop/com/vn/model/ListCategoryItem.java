package shop.com.vn.model;

import java.io.Serializable;

public class ListCategoryItem implements Serializable {
    private int id;
    private String name;

    private int idc;

    public ListCategoryItem() {
    }

    public ListCategoryItem(int id, String name, int idc) {
        this.id = id;
        this.name = name;
        this.idc = idc;
    }

    public int getIdc() {
        return idc;
    }

    public void setIdc(int idc) {
        this.idc = idc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getname() {
        return name;
    }

    public void setname(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "ListC{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", idc=" + idc +
                '}';
    }
}
