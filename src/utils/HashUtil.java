package utils;

public class HashUtil {
	public static String getHash(String normalString) {
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(normalString.getBytes());
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < array.length; ++i) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
			}
			return sb.toString();
		} catch (Exception e) {
			return null;
		}
	}

	public static boolean compareHash(String hash, String candidate) {
		if (hash != null) {
			if (hash.equals(getHash(candidate))) {
				return true;
			}
		}
		return false;
	}
}
