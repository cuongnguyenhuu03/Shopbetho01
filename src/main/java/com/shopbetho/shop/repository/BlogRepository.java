package com.shopbetho.shop.repository;

import com.shopbetho.shop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopbetho.shop.entity.Blog;

import java.util.List;

@Repository
public interface BlogRepository extends JpaRepository<Blog, Long> {
    List<Blog> findTop3ByOrderByCreatedAtDesc();
    List<Blog> findByTitleContainingIgnoreCase(String keyword);
}
