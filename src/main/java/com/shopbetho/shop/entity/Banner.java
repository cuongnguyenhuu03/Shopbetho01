package com.shopbetho.shop.entity;

import jakarta.persistence.Entity;

@Entity
public class Banner extends BaseEntity {
    private String firstBanner;
    private String secondBanner;

    public String getFirstBanner() {
        return firstBanner;
    }
    public void setFirstBanner(String firstBanner) {
        this.firstBanner = firstBanner;
    }
    public String getSecondBanner() {
        return secondBanner;
    }
    public void setSecondBanner(String secondBanner) {
        this.secondBanner = secondBanner;
    }
    @Override
    public String toString() {
        return "Banner [firstBanner=" + firstBanner + ", secondBanner=" + secondBanner + "]";
    }
}
