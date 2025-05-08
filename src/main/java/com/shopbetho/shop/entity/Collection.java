package com.shopbetho.shop.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Collection extends  BaseEntity {

    @ElementCollection
    @CollectionTable(name = "collection_images", joinColumns = @JoinColumn(name = "collection_id"))
    @Column(name = "image_url")
    private List<String> imageUrls;

    public Collection() {
    }

    public List<String> getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(List<String> imageUrls) {
        this.imageUrls = imageUrls;
    }
}
