package downloader;


import java.io.*;
import java.nio.file.*;
import java.net.*;
import java.util.stream.Stream;

class Downloader {

    public static void downloadList(String path, String fileName) {
        try (Stream<String> lines = Files.lines(Paths.get(path + fileName))) {
            lines.forEach(file -> download(path, file));
        } catch(IOException e) {
			System.out.println("Error: " + fileName);
        }
    }

    public static void download(String path, String imageUrl) {
        System.out.println("Downloading: " + imageUrl);
		
        String[] parts = imageUrl.split("/");
        String imagePath = path + parts[parts.length - 1];

        try(InputStream in = new URL(imageUrl).openStream()){
            Files.copy(in, Paths.get(imagePath));
        } catch (IOException e) {
			System.out.println("Error: " + imageUrl);
        }
    }
}


public class App
{
    public static void main( String[] args )
    {
        Downloader.downloadList("input/", "urls.txt");
    }
}

/* POM SHOULD CONTAIN:

  <properties>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
  </properties>
*/


/* TO RUN:

    java -cp target/*.jar downloader.App
*/