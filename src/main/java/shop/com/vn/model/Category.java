package shop.com.vn.model;

import java.io.Serializable;

public class Category implements Serializable {
    private int idCategory;
    private String nameC;

    public Category() {


    }

    public Category(int idCategory, String nameC) {
        this.idCategory = idCategory;
        this.nameC = nameC;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameC() {
        return nameC;
    }

    public void setNameC(String nameC) {
        this.nameC = nameC;
    }

    @Override
    public String toString() {
        return "Category{" +
                "idCategory=" + idCategory +
                ", nameC='" + nameC + '\'' +
                '}';
    }
}
