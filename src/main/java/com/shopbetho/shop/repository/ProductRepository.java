package com.shopbetho.shop.repository;

import com.shopbetho.shop.contant.TypeCatalogueDetailEnum;
import com.shopbetho.shop.contant.catalogueEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopbetho.shop.entity.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findAll();
    List<Product> findTop4ByIsHighlightTrueOrderByCreatedAtDesc();
    List<Product> findTop8ByIsNewTrueOrderByCreatedAtDesc();
    List<Product> findByIsActiveTrue();
    List<Product> findByIsHighlightTrueOrderByCreatedAtDesc();
    List<Product> findByCatalogueAndCatalogueDetailEnum(catalogueEnum catalogue, TypeCatalogueDetailEnum typeCatalogueDetailEnum);
    List<Product> findByNameContainingIgnoreCase(String keyword);
    long countByIsHighlightTrue();
    long countByIsHighlightTrueAndIdNot(Long excludedId);
}
