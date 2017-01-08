package home;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;

import com.sun.mail.util.BASE64EncoderStream;
public class Encrypt {
	private static Cipher ecipher;

	
	String encrypted = "";
	private static final int iterationCount = 10;

	// 8-byte Salt
	private static byte[] salt = {

	(byte) 0xB2, (byte) 0x12, (byte) 0xD5, (byte) 0xB2,

	(byte) 0x44, (byte) 0x21, (byte) 0xC3, (byte) 0xC3 };
	
public String encryptfile(String msg){
	try {

		String passPhrase = "asdf23@#$%()768769HIUK";

		KeySpec keySpec = new PBEKeySpec(passPhrase.toCharArray(), salt,iterationCount);

		SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES")
				.generateSecret(keySpec);

		AlgorithmParameterSpec paramSpec = new PBEParameterSpec(salt,
				iterationCount);

		ecipher = Cipher.getInstance(key.getAlgorithm());
		

		ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);

	

		encrypted = encrypt(msg);
	
	

		

	} catch (InvalidAlgorithmParameterException e) {
		System.out
				.println("Invalid Alogorithm Parameter:" + e.getMessage());
		
	} catch (InvalidKeySpecException e) {
		System.out.println("Invalid Key Spec:" + e.getMessage());
		
	} catch (NoSuchAlgorithmException e) {
		System.out.println("No Such Algorithm:" + e.getMessage());
		
	} catch (NoSuchPaddingException e) {
		System.out.println("No Such Padding:" + e.getMessage());
		
	} catch (InvalidKeyException e) {
		System.out.println("Invalid Key:" + e.getMessage());
		
	}
	return encrypted;
}
public static String encrypt(String str) {

	try {

	

		byte[] utf8 = str.getBytes("UTF8");

		byte[] enc = ecipher.doFinal(utf8);

	
		enc = BASE64EncoderStream.encode(enc);

		return new String(enc);

	}

	catch (Exception e) {

		e.printStackTrace();

	}

	return null;

}

}
