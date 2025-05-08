package com.shopbetho.shop.repository;

import com.shopbetho.shop.entity.Banner;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BannerRepository extends JpaRepository<Banner, Long> {
    Banner findTopByOrderByCreatedAtDesc();
}