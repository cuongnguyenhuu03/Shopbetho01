package com.shopbetho.shop.controller;

import com.shopbetho.shop.entity.*;
import com.shopbetho.shop.service.BannerService;
import com.shopbetho.shop.service.BlogService;
import com.shopbetho.shop.service.CollectionService;
import com.shopbetho.shop.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HelloWorld {
    @Autowired
    private BannerService bannerService;
    @Autowired
    private CollectionService collectionService;
    @Autowired
    private BlogService blogService;
    @Autowired
    private ProductService productService;
    @GetMapping("/")
    public String helloWorld(Model model) {
        Banner banner = bannerService.findTopByOrderByCreatedAtDesc();
        Collection collection = collectionService.findTopByOrderByCreatedAtDesc();
        List<Blog> topThreeLogNew = blogService.findTop3ByOrderByCreatedAtDesc();
        List<Product> productsHighLight = productService.findByIsHighlightTrue();
        List<Product> productsNew = productService.findByIsNewTrue();
        model.addAttribute("banners", banner);
        model.addAttribute("collections", collection);
        model.addAttribute("blogs", topThreeLogNew);
        model.addAttribute("productsHighLight", productsHighLight);
        model.addAttribute("productsNew", productsNew);
        return "index";
    }

    @GetMapping("/about")
    public String aboutPage(Model model) {
        return "about";
    }

}
