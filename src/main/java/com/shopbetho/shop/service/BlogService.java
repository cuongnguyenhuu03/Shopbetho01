package com.shopbetho.shop.service;

import com.shopbetho.shop.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shopbetho.shop.entity.Blog;
import com.shopbetho.shop.repository.BlogRepository;

import java.util.List;

@Service
public class BlogService {

    private final BlogRepository blogRepository;

    public BlogService(BlogRepository blogRepository) {
        this.blogRepository = blogRepository;
    }

    public Blog createBlog(Blog blog) {
        return this.blogRepository.save(blog);
    }

    public Blog updateBlog(Blog blog) {
        Blog updateBlog = this.blogRepository.findById(blog.getId()).get();
        updateBlog.setTitle(blog.getTitle());
        updateBlog.setImageUrl(blog.getImageUrl());
        updateBlog.setDescription(blog.getDescription());

        return this.blogRepository.save(updateBlog);
    }

    public Blog fetchById(Long id) {
        return this.blogRepository.findById(id).get();
    }

    public List<Blog> fetchAll() {
        return this.blogRepository.findAll();
    }

    public List<Blog> searchByTitle(String keyword) {
        return blogRepository.findByTitleContainingIgnoreCase(keyword);
    }

    void deleteBlog(Long id) {
        this.blogRepository.deleteById(id);
    }
    public List<Blog> findTop3ByOrderByCreatedAtDesc() {
        return this.blogRepository.findTop3ByOrderByCreatedAtDesc();
    }

    public void deleteBlogById(Long id) {
        if (!blogRepository.existsById(id)) {
            throw new RuntimeException("Blog not found with id: " + id);
        }
        blogRepository.deleteById(id);
    }

}
