package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Footer;
import shop.com.vn.model.Slider;

import java.util.List;
import java.util.stream.Collectors;

public class FooterService {
    public static Footer getFooter() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from footer ").mapToBean(Footer.class)
                    .stream().collect(Collectors.toList()).get(0);
        });
    }
}
