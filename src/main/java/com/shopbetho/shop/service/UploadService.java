package com.shopbetho.shop.service;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadService {

    // trong này trước mắt dùng mỗi hàm lưu thôi

    // public String handleSaveFile(MultipartFile file, String targetFolder) {
    // if (file.isEmpty()) {
    // return "";
    // }
    // String finalName = "";
    // try {
    // byte[] bytes = file.getBytes();

    // String rootPath = this.servletContext.getRealPath("/resources/images");
    // File dir = new File(rootPath + File.separator + targetFolder);
    // if (!dir.exists())
    // dir.mkdirs();

    // // Create the file on server

    // finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
    // File serverFile = new File(dir.getAbsolutePath() + File.separator +
    // finalName);
    // BufferedOutputStream stream = new BufferedOutputStream(
    // new FileOutputStream(serverFile));
    // stream.write(bytes);
    // stream.close();
    // } catch (IOException e) {
    // e.printStackTrace();
    // }
    // return finalName;
    // }

    // đã khai báo trong file properties
    @Value("${shop.upload-file.base-uri}")
    private String baseUri;

    // lấy đường dẫn động
    private Path resolveAbsolutePath(String folder, String fileName) {
        return Paths.get(System.getProperty("user.dir")) // vd: CareerNest_Server/CareerNest
                .resolve(baseUri)
                .resolve(folder)
                .resolve(fileName)
                .normalize()
                .toAbsolutePath();
    }

    // lấy đường dẫn động
    private Path resolveFolderPath(String folder) {
        return Paths.get(System.getProperty("user.dir"))
                .resolve(baseUri)
                .resolve(folder)
                .normalize()
                .toAbsolutePath();
    }

    // hàm validate file, do không kịp nên có thể chưa dùng, kịp thì dùng nha B

    public void validateFile(MultipartFile file) throws Exception {
        if (file == null || file.isEmpty()) {
            throw new Exception("file không hợp lệ");
        }

        String fileName = file.getOriginalFilename();
        List<String> allowedExtensions = Arrays.asList("pdf", "jpg", "jpeg", "png", "doc", "docx"); // muốn bổ sung thì
                                                                                                    // cho vô dây

        boolean isValid = allowedExtensions.stream().anyMatch(item -> fileName.toLowerCase().endsWith(item));
        if (!isValid) {
            throw new Exception("file không hợp lệ");
        }
    }

    // tạo thư mục và đường đẫn của thư muc trên server để lưu hình
    public void createDirectory(String folder) {
        Path path = resolveFolderPath(folder);
        if (!Files.exists(path)) {
            try {
                Files.createDirectories(path);
                System.out.println(">>> CREATE NEW DIRECTORY SUCCESSFUL, PATH = " + path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println(">>> SKIP MAKING DIRECTORY, ALREADY EXISTS");
        }
    }

    public String store(MultipartFile file, String folder) throws IOException {

        String finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
        Path targetPath = resolveAbsolutePath(folder, finalName);

        Files.createDirectories(targetPath.getParent()); // Đảm bảo folder tồn tại
        try (InputStream inputStream = file.getInputStream()) {
            Files.copy(inputStream, targetPath, StandardCopyOption.REPLACE_EXISTING);
        }

        return finalName;
    }

}
