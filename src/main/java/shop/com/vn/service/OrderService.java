package shop.com.vn.service;

import org.jdbi.v3.core.Handle;
import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.*;

import java.util.List;
import java.util.stream.Collectors;

public class OrderService {
    public static void insertOrderByIdAcc(String lastName, String firstName, String phone, String email
            , String address, String payment, String idAcc, String hashInf, String date) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO `order` (firstname, lastname, phone,email,address,payment,idacc,status,create_date, hashInfOrder)" +
                                "VALUES (?,?,?,?,?,?,?,?,?,?)")
                        .bind(0, firstName)
                        .bind(1, lastName)
                        .bind(2, phone)
                        .bind(3, email)
                        .bind(4, address)
                        .bind(5, payment)
                        .bind(6, idAcc)
                        .bind(7, 0)
                        .bind(8, date)
                        .bind(9, hashInf)
                        .execute()
        );

    }
    public static void insertOrderDetailIdAcc(int idOrder, int idProduct,int price, int quantity) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO `detailorder` (idOrder, idProduct,price, quantity)" +
                                "VALUES (?,?,?, ?)")
                        .bind(0, idOrder)
                        .bind(1, idProduct)
                        .bind(2, price)
                        .bind(3, quantity)
                        .execute()
        );

    }
    public static List<Cart> getListProductCartByIdAcc(int idAcc) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from cart  where idAccount = ?")
                    .bind(0,idAcc)
                    .mapToBean(Cart.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Order> getListOrderByIdAcc(String idAcc) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from order  where idAcc = ?")
                    .bind(0,idAcc)
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Payment> getAllPayment() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from pay ")

                    .mapToBean(Payment.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static Payment getPaymentByIdPm(String idPm) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from pay  where idPm = ?")
                    .bind(0,idPm)
                    .mapToBean(Payment.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
    public static void deleteProductByIdCart(String idac) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from cart where idAccount = ?")
                        .bind(0, idac)
                        .execute()
        );
    }
    public static List<Order> getAllOrder() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM `order`")
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Order> getAllOrderById(String idAc) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM `order` where idAcc=? ")
                    .bind(0, idAc)
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static Order getOrderById(String id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM `order` where idorder=? ")
                    .bind(0, id)
                    .mapToBean(Order.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
    public static List<DetailOrder> getAllOrderDetailById(int idOrder) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM `detailorder` where idOrder=? ")
                    .bind(0, idOrder)
                    .mapToBean(DetailOrder.class)
                    .stream().collect(Collectors.toList());
        });
    }
    // lấy tất cả các ttangj thái
    public static List<Status> getAllStatus() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from  status ")
                    .mapToBean(Status.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static List<Key> getAllKeyByIDA(int idA) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from `key` WHERE expirate_date IS NOT NULL AND idA = ?")
                    .bind(0, idA)
                    .mapToBean(Key.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void main(String[] args) {
        System.out.println(getKeyByIdAStillValid(7));
    }
    public static String getKeyByIdAStillValid(int id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT `key_text` FROM `key` WHERE idA = ? AND expirate_date IS NULL")
                    .bind(0, id)
                    .mapToBean(Key.class)
                    .stream().collect(Collectors.toList()).get(0).getKey_text();
        });

    }
    public static void canceOderByid(int id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update `order` set status=? where idorder = ?")
                        .bind(0, "3")
                        .bind(1, id)
                        .execute()
        );
    }
//    public static void main(String[] args) {
//        insertOrderByIdAcc("aa","xx","756574","email","dadaaa","1","3");
//    }
}
