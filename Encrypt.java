import java.util.Base64;

public class Encrypt {
    private static final String ENCRYPT = "encrypt";
    private static final String DECRYPT = "decrypt";

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Insufficient arguments. Expects: <string:input> <int:times>");
            System.exit(1);
        }

        String input = args[0];
        int times = 0;

        try {
            times = Integer.parseInt(args[1]);
        } catch (java.lang.NumberFormatException e) {
            System.out.println("Times must be an integer value.");
            System.exit(1);
        }

        String encryptResult = crypto(input, times, ENCRYPT);

        System.out.println("\"encrypted\" " + encryptResult);
        System.out.println("\"decrypted\" " + crypto(encryptResult, times, DECRYPT));
    }

    private static String crypto(String input, int times, String method) {
        if (input.length() == 0) return input;

        String output = input;
        for (int i = 0; i < times; i++) {
            if (ENCRYPT.equalsIgnoreCase(method)) {
                output = Base64.getEncoder().encodeToString(output.getBytes());
            } else if (DECRYPT.equalsIgnoreCase(method)) {
                output = new String(Base64.getDecoder().decode(output));
            } else {
                System.out.println("Unsupported method entered");
                System.exit(1);
            }
        }
        return output;
    }

}