package login;

import org.mindrot.jbcrypt.BCrypt;

public class Encryption {
	public static String hash(String plain) {
        return BCrypt.hashpw(plain, BCrypt.gensalt(12));
    }
    public static boolean check(String plain, String hashed) {
        return BCrypt.checkpw(plain, hashed);
    }
}
