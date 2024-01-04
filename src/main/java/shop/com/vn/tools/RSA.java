package shop.com.vn.tools;

import javax.crypto.Cipher;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;


public class RSA {

    public KeyPair generateKeyPair(int keySize) throws Exception {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(keySize);
        return keyPairGenerator.generateKeyPair();

    }

    public PublicKey importPublicKey(String publicKeyBase64) {
        try {
            byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyBase64);
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            return keyFactory.generatePublic(keySpec);
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid Public Key");
        }
    }

    public PrivateKey importPrivateKey(String privateKeyBase64) {
        try {
            byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyBase64);
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            return keyFactory.generatePrivate(keySpec);

        } catch (Exception e) {

            throw new IllegalArgumentException("Invalid Private Key");
        }
    }

    public String exportPublicKey(PublicKey publicKey) {
        byte[] publicKeyBytes = publicKey.getEncoded();
        return Base64.getEncoder().encodeToString(publicKeyBytes);
    }

    public String exportPrivateKey(PrivateKey privateKey) {
        byte[] privateKeyBytes = privateKey.getEncoded();
        return Base64.getEncoder().encodeToString(privateKeyBytes);
    }

    public String encrypt(String data, String key) throws Exception {

        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, importPrivateKey(key));
        byte[] output = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(output);

    }

    public String decrypt(String data, String key) throws Exception {

        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, importPublicKey(key));
        byte[] output = cipher.doFinal(Base64.getDecoder().decode(data));
        return new String(output, StandardCharsets.UTF_8);

    }

    public boolean checkKeyLength(String publicKey, String privateKey) {
        // Lấy khóa công khai và riêng tư từ cặp khóa
        java.security.interfaces.RSAPublicKey publicKeyCheck = (java.security.interfaces.RSAPublicKey) importPublicKey(publicKey);
        java.security.interfaces.RSAPrivateKey privateKeyCheck = (java.security.interfaces.RSAPrivateKey) importPrivateKey(privateKey);

        // Kiểm tra độ dài của khóa công khai và khóa riêng tư
        int publicKeyLength = publicKeyCheck.getModulus().bitLength();
        int privateKeyLength = privateKeyCheck.getModulus().bitLength();

        // Kiểm tra xem độ dài có lớn hơn hoặc bằng 2024 bit không
        if (publicKeyLength >= 2024 && privateKeyLength >= 2024)
            return true;

        return false;
    }

}