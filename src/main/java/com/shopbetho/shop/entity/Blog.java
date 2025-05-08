package com.shopbetho.shop.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

@Entity
public class Blog extends BaseEntity {

    private String title;

    private String imageUrl;
    @Column(columnDefinition = "LONGTEXT")
    private String content;

    @Column(columnDefinition = "MEDIUMTEXT")
    private String description;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
