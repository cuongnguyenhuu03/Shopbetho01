package com.shopbetho.shop.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
public class AccountAdmin extends BaseEntity {
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
