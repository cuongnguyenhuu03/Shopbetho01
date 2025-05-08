package com.shopbetho.shop.config;

import org.springframework.stereotype.Service;

import com.shopbetho.shop.entity.AccountAdmin;
import com.shopbetho.shop.repository.AccountAdminRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;

@Service
public class DataConfig implements CommandLineRunner {

    @Autowired
    private AccountAdminRepository accountAdminRepository;

    @Override
    public void run(String... args) throws Exception {

        long count = this.accountAdminRepository.count();

        if (count == 0) {
            AccountAdmin accountAdmin = new AccountAdmin();
            accountAdmin.setEmail("shopbetho62@gmail.com");

            accountAdminRepository.save(accountAdmin);
        }
    }
}