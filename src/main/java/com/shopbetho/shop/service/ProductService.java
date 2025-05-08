package com.shopbetho.shop.service;

import com.shopbetho.shop.contant.TypeCatalogueDetailEnum;
import com.shopbetho.shop.contant.catalogueEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.shopbetho.shop.entity.Product;
import com.shopbetho.shop.repository.ProductRepository;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product createProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Product updateProduct(Product product) {
        Product updateProduct = this.productRepository.findById(product.getId()).get();
        updateProduct.setCode(product.getCode());
        updateProduct.setName(product.getName());
        updateProduct.setDescription(product.getDescription());
        updateProduct.setCatalogue(product.getCatalogue());
        updateProduct.setHighlight(product.isHighlight());
        updateProduct.setNew(product.isNew());
        updateProduct.setActive(product.isActive());
        updateProduct.setPrice(product.getPrice());
        updateProduct.setSizes(product.getSizes());
        product.setColors(product.getColors());

        return this.productRepository.save(updateProduct);
    }

    public Product fetchById(Long id) {
        return this.productRepository.findById(id).get();
    }

    public List<Product> fetchAll() {
        return this.productRepository.findAll();
    }

    void deleteProduct(Long id) {
        this.productRepository.deleteById(id);
    }
    public List<Product> findByIsHighlightTrue() {
        return this.productRepository.findTop4ByIsHighlightTrueOrderByCreatedAtDesc();
    }
    public List<Product> findByIsNewTrue() {
        return this.productRepository.findTop8ByIsNewTrueOrderByCreatedAtDesc();
    }
    public List<Product> findAllIsHighLightTrue(){
        return this.productRepository.findByIsHighlightTrueOrderByCreatedAtDesc();
    }
    public List<Product> getByCatalogueAndDetail(catalogueEnum catalogue, TypeCatalogueDetailEnum typeCatalogueDetailEnum) {
        return productRepository.findByCatalogueAndCatalogueDetailEnum(catalogue, typeCatalogueDetailEnum);
    }
    public List<Product> searchByName(String keyword) {
        return productRepository.findByNameContainingIgnoreCase(keyword);
    }
    public void deleteProductById(Long id) {
        if (!productRepository.existsById(id)) {
            throw new RuntimeException("Product not found with id: " + id);
        }
        productRepository.deleteById(id);
    }
    public long countProductHighLight() {
        return productRepository.countByIsHighlightTrue();
    }
    public long countByIsHighlightTrueAndIdNot(Long excludedId) {
        return productRepository.countByIsHighlightTrueAndIdNot(excludedId);
    }
}
