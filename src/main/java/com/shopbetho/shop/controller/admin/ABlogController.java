package com.shopbetho.shop.controller.admin;

import com.shopbetho.shop.entity.AccountAdmin;
import com.shopbetho.shop.entity.Blog;
import com.shopbetho.shop.entity.Product;
import com.shopbetho.shop.service.BlogService;
import com.shopbetho.shop.service.UploadService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class ABlogController {

@Autowired
    private UploadService uploadService;

    @Autowired
    private BlogService blogService;

    @GetMapping("/admin/blog/dashboard")
    public String showDashboardBlogPage(Model model, @RequestParam(defaultValue = "1") int page, HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        Pageable pageable = PageRequest.of(page - 1, 2);
        List<Blog> products = this.blogService.fetchAll();
        model.addAttribute("blogs", products);
        return "admin/dashboard/dashboardBlog";
    }

    @GetMapping("/admin/blog/filterDashboardBlog")
    public String filterDashboardProduct(Model model, @RequestParam(name = "title") String title, HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }

        List<Blog> blogs = this.blogService.searchByTitle(title);
        model.addAttribute("blogs", blogs);
        return "admin/dashboard/dashboardBlog";
    }

    @GetMapping("/admin/blog/create")
    public String showCreateBlogPage(HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        return "admin/blog/createPage";
    }
    @GetMapping("/admin/blog/update/{id}")
    public String showUpdateBlogPage(
            @PathVariable("id") Long id,
            Model model, HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        model.addAttribute("blog", blogService.fetchById(id));
        return "admin/blog/updatePage";
    }

    // Example method to handle blog creation
    @PostMapping("/admin/blog/create")
    public String createBlog(@RequestParam("title") String title,
                             @RequestParam("content") String content,
                             @RequestParam("description") String description,
                             @RequestParam("image") MultipartFile image,
                             Model model) throws IOException {
        if(title.isEmpty() || content.isEmpty() || description.isEmpty()) {
            model.addAttribute("error", "Please fill in all fields.");
            return "redirect:/admin/blog/create";
        }
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setDescription(description);
        // Handle file upload and set the image URL
        if (!image.isEmpty()) {
            String imageUrl = uploadService.store(image, "file");
            blog.setImageUrl(imageUrl);
        }
        blogService.createBlog(blog);
        System.out.println(1);
        return "redirect:/admin/blog/dashboard";
    }
    @PostMapping("/admin/blog/update")
    public String updateBlog(
                             @RequestParam("id") Long id,
                             @RequestParam("title") String title,
                             @RequestParam("content") String content,
                             @RequestParam("description") String description,
                             @RequestParam("image") MultipartFile image,
                             Model model) throws IOException {
        if( id == null || title.isEmpty() || content.isEmpty() || description.isEmpty()) {
            model.addAttribute("error", "Please fill in all fields.");
            return "redirect:/admin/blog/update";
        }
        //Blog blogFind = blogService.fetchById(id);
        Blog blog = blogService.fetchById(id);
        blog.setId(id);
        blog.setTitle(title);
        blog.setContent(content);
        blog.setDescription(description);
        // Handle file upload and set the image URL
        if (!image.isEmpty()) {
            String imageUrl = uploadService.store(image, "file");
            blog.setImageUrl(imageUrl);
        } else {
            blog.setImageUrl(blog.getImageUrl());
        }
        blogService.updateBlog(blog);
        return "redirect:/admin/blog/dashboard";
    }


    @PostMapping("/admin/blog/delete")
    public String deleteBlogByPost(@RequestParam("id") Long id, Model model) {
        try {
            blogService.deleteBlogById(id);
            return "redirect:/admin/blog/dashboard";
        } catch (RuntimeException e) {
            model.addAttribute("Err", "Blog not found");
            return "redirect:/admin/blog/dashboard";
        }
    }
}
