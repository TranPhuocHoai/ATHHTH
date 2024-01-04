package shop.com.vn.controller;

import org.json.simple.JSONObject;
import shop.com.vn.model.Account;
import shop.com.vn.service.LoginService;
import shop.com.vn.tools.RSA;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.FileWriter;
import java.io.IOException;
import java.security.KeyPair;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "KeyController", value = "/KeyController")
public class KeyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command != null && command.equals("createKey")) {
            RSA rsa = new RSA();
            KeyPair key = null;
            try {
                key = rsa.generateKeyPair(2048);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            String publicKey = rsa.exportPublicKey(key.getPublic());
            String privateKey = rsa.exportPrivateKey(key.getPrivate());
            JSONObject jsonKey = new JSONObject();
            jsonKey.put("publicKey", publicKey);
            jsonKey.put("privateKey", privateKey);
            String jsonFileName = "your-key.key";
            try (FileWriter fileWriter = new FileWriter(jsonFileName)) {
                fileWriter.write(jsonKey.toJSONString());
            }
            response.setContentType("application/json");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + jsonFileName + "\"");
            response.getWriter().write(jsonKey.toJSONString());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
