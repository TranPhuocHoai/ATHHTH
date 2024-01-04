package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Account;


import java.util.List;
import java.util.stream.Collectors;

public class AccountService {
    // lấy tài khoản theo id
    public static Account getAccount(String idA) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from account a where a.id=?")
                    .bind(0,idA)
                    .mapToBean(Account.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
    // lấy ds tất cả tài khoản
    public static List<Account> getAllAccount() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from account")
                    .mapToBean(Account.class)
                    .stream().collect(Collectors.toList());
        });
    }
    public static void editProfileAcountById(String pass, String email,
                                             String phone, String fullName, String address, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set pass =?," +
                                "email = ?,phone =?,img=null,fullName=?,address =? where id = ?")
                        .bind(0, pass)
                        .bind(1, email)
                        .bind(2, phone)
                        .bind(3, fullName)
                        .bind(4, address)
                        .bind(5, id)
                        .execute()
        );
    }

// cấp lại mật khẩu cho người dùng
    public static void resetPassword(String pass, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set pass =? where id = ?")
                        .bind(0, pass)
                        .bind(1, id)
                        .execute()
        );
    }
    // chỉnh sửa cập nhật lại tài khoản
    public static void editAcountById(String email,  String phone, String fullName, String address, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set " +
                                "email = ?,phone =?,img=null,fullName=?,address =? where id = ?")
                        .bind(0, email)
                        .bind(1, phone)
                        .bind(2, fullName)
                        .bind(3, address)
                        .bind(4, id)
                        .execute()
        );
    }
    // chỉnh sửa phân quyền quản lí
    public static void editManagerAssistant(String managerAssistan, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set assistant = ? where id= ?")
                        .bind(0, managerAssistan)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void editManaProduct(String manaProduct, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set managerProduct = ? where id= ?")
                        .bind(0, manaProduct)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void editManaHome(String manaHome, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set managerHome = ? where id= ?")
                        .bind(0, manaHome)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void editManaBlog(String manaBlog, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set managerBog = ? where id= ?")
                        .bind(0, manaBlog)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void editManaAccount(String managerAccount, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set managerAccount = ? where id= ?")
                        .bind(0, managerAccount)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void editManagerOrder(String maanagerOrder, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set assistant = ? where id= ?")
                        .bind(0, maanagerOrder)
                        .bind(1, idA)
                        .execute()
        );
    }
    // xóa tài khoản
    public static void deleteAccount( String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete   from account where id= ?")
                        .bind(0, idA)
                        .execute()
        );
    }


}
