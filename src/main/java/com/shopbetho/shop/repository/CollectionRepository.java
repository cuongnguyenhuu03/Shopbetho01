package com.shopbetho.shop.repository;

import com.shopbetho.shop.entity.Banner;
import com.shopbetho.shop.entity.Collection;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CollectionRepository extends JpaRepository<Collection, Long> {
    Collection findTopByOrderByCreatedAtDesc();
}