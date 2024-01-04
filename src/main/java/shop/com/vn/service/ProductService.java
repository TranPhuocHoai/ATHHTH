package shop.com.vn.service;


import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Category;
import shop.com.vn.model.ListCategoryItem;
import shop.com.vn.model.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {
    // lấy tất cả sp mới
    public static List<Product> getAllProduct() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product").mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static List<Product> getAllProductI() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product where id =?").mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static Product getProductByOrder(int orderId) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from detailorder where idProduct =?")
                    .bind(0, orderId)
                    .mapToBean(Product.class)
                    .stream()
                    .collect(Collectors.toList()).get(0);
        });
    }
    //    lấy sản phẩm mới
    public static List<Product> getListProduct() {
//        xử DB ...
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product where isNew =true").mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }
    // lấy 8 sp hiển thị home
    public static List<Product> get8Product() {
//        xử DB ...
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product LIMIT 8").mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }
    // lấy các danh mục menu
    public static List<Category> getListCategories() {
//        xử DB ...
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from category").mapToBean(Category.class)
                    .stream().collect(Collectors.toList());
        });
    }

    //lấy tất cả các loại của danh mục menu
    public static List<ListCategoryItem> getListC() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from categoryItem").mapToBean(ListCategoryItem.class)
                    .stream().collect(Collectors.toList());
        });
    }

//    lấy danh sách sản phẩm theo cat
    public static List<Product> getListCById(String cid) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select p.id,p.img,p.name, p.price, p.information from product p join categoryItem c on p.ciditem =c.id  where c.idc = ?")
                    .bind(0,cid)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

//    lấy ra từng cat theo id
    public static Category getNameC(int cid){
        for (Category c: getListCategories() ) {
            if(cid==(c.getIdCategory())){
                return  c;
            }

        }
        return null;
    }

//    lấy ra danh sách sản phẩm theo phân loại trong cat theo id của phân loại
    public static List<Product> getListItemCatById(String idI) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product  where ciditem = ?")
                    .bind(0,idI)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

//  lấy phân loại trong menu để lấy tên của phân loại đó để hiển thị lên đường dẫn
   public static ListCategoryItem getItemName(int idI ){
       for (ListCategoryItem ci: getListC() ) {
           if(idI == ci.getId()){
               return  ci;
           }

       }
        return null;
   }

   //phân trang
    public static List<Product> getListProductByPage(List<Product> arr, int start, int end) {
    List<Product> list = new ArrayList<Product>();
    for(int i = start; i < end;i++){
        list.add(arr.get(i));
    }
    return list;
    }

    //searrch
    public static  List<Product> getListByKeyWord(String keyWord){
        return JDBiConnector.me().withHandle(handle ->{
            return handle.createQuery("select * from product where name like \"%" + keyWord + "%\" ")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        } );
    }

    public static Product getProductById(String id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product  where id = ?")
                    .bind(0,id)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
    public static List<Product> getListProductByPrice(String price1,String price2) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product  where price > ? and price<?")
                    .bind(0,price1)
                    .bind(1,price2)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Product> getListProductByName(String name) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product WHERE name LIKE ?")
                    .bind(0,"%"+ name+"%")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void editProductById(String idProduct, String name,
                                             String price, String introduce, String  inventory) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update product set name =?," +
                                "price = ?,information =? , inventory =? where id = ?")
                        .bind(0, name)
                        .bind(1, price)
                        .bind(2, introduce)
                        .bind(3, inventory)
                        .bind(4, idProduct)
                        .execute()
        );
    }
    // hiện thị thêm 8 sp thi chọn sem thêm
    public static List<Product> getNextTop12Product(int amount) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product LIMIT ?,8")
                    .bind(0, amount)
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static void addProductAdmin( String name, String img,String  price, String promotion, String isNew, String introduce,String idC, String quatity) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO product(name,img, price,isPromo, isNew,information,ciditem,inventory) " +
                                "VALUES (?,?,?,?,?,?,?,?)")
                        .bind(0, name)
                        .bind(1, img)
                        .bind(2, price)
                        .bind(3, promotion)
                        .bind(4, isNew)
                        .bind(5, introduce)
                        .bind(6, idC)
                        .bind(7, quatity)
                        .execute()
        );

    }
    //XÓA SẢN PHẨM
    public static void deleteProduct( String idP) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete   from product where id= ?")
                        .bind(0, idP)
                        .execute()
        );
    }
    public static void main(String[] args) {
        System.out.println(getListByKeyWord("kinh"));
        //System.out.println(getListItemCatById("1"));
    }

}