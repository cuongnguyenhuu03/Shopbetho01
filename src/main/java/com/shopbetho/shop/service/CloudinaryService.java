package com.shopbetho.shop.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
public class CloudinaryService {
    private Cloudinary cloudinary;

    public CloudinaryService() {
        cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dnxwz0gj0",
                "api_key", "886878881334389",
                "api_secret", "g_7Z_Vh2663D0rfST7gygup_CbY"
        ));
    }

    public String upLoadImage(MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            Map uploadResult = cloudinary.uploader().upload(file.getBytes(), ObjectUtils.emptyMap());
            String imageUrl = uploadResult.get("secure_url").toString();
            return imageUrl;
        }
        return "";
    }
}
