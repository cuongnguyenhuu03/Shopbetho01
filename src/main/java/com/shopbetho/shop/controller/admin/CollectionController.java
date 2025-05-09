package com.shopbetho.shop.controller.admin;

import com.shopbetho.shop.entity.AccountAdmin;
import com.shopbetho.shop.entity.Banner;
import com.shopbetho.shop.entity.Collection;

import com.shopbetho.shop.service.CollectionService;
import com.shopbetho.shop.service.UploadService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CollectionController {

    @Autowired
    private UploadService uploadService;

    @Autowired
    private CollectionService collectionService;

    @GetMapping("/admin/collection/create")
    public String getCreateCollectionPage(HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        return "admin/collection/createPage";
    }

    @PostMapping("admin/collection/create")
    public String createCollection(@RequestParam("image") List<MultipartFile> image, Model model,
            HttpServletRequest request) throws IOException {

        Collection collection = new Collection();
        if (image.size() != 6) {
            model.addAttribute("error", "Please upload 6 images.");
            return "redirect:" + request.getHeader("Referer");
        }

        if (!image.isEmpty()) {
            for (MultipartFile file : image) {
                if (collection.getImageUrls() == null) {
                    collection.setImageUrls(new ArrayList<>());
                }
                String imageUrl = uploadService.store(file, "file");
                collection.getImageUrls().add(imageUrl);
            }
        }

        collectionService.save(collection);

        return "redirect:/";
    }
}
