package application;

import java.nio.file.Paths;

public class Main {

    public static void main(String[] args) {

        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/main/java/application/";

        String file[] = { rootPath + subPath + "scanner.lex" };

        jflex.Main.main(file);

        String file2[] = { rootPath + subPath + "scanner2.lex" };
        jflex.Main.main(file2);
    }

}