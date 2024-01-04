package shop.com.vn.service;

import shop.com.vn.db.JDBiConnector;
import shop.com.vn.model.Product;
import shop.com.vn.model.Slider;

import java.util.List;
import java.util.stream.Collectors;

public class SliderService {
    //lấy ds slider home

    public static List<Slider> getListSlider() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from slider ").mapToBean(Slider.class)
                    .stream().collect(Collectors.toList());
        });
    }
}
