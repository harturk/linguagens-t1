package application;

import java.nio.file.Paths;

public class Main {

    public static void main(String[] args) {

        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/main/java/application/";

        String file[] = { rootPath + subPath + "scanner.lex" };

        jflex.Main.main(file);

    }

}