package com.shopbetho.shop.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopbetho.shop.entity.Blog;
import com.shopbetho.shop.entity.Product;
import com.shopbetho.shop.service.BlogService;

import java.util.List;

@Controller
public class BlogController {

    private final BlogService blogService;

    public BlogController(BlogService blogService) {
        this.blogService = blogService;
    }

    @GetMapping("/blogs")
    public String fetchAllBlogs(Model model,
            @RequestParam(defaultValue = "1", name = "page") int page) {

        Pageable pageable = PageRequest.of(page - 1, 2);

        List<Blog> blogs = this.blogService.fetchAll();
        model.addAttribute("blogs", blogs);
        return "client/blog/showPage";
    }

    @GetMapping("/blogs/{id}")
    public String getBlogById(@PathVariable("id") Long id, Model model) {
        Blog blog = this.blogService.fetchById(id);
        model.addAttribute("blog", blog);
        return "client/blog/detailPage";
    }
}
