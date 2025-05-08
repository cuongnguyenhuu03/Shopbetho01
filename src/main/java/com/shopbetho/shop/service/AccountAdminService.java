package com.shopbetho.shop.service;

import com.shopbetho.shop.entity.AccountAdmin;
import com.shopbetho.shop.repository.AccountAdminRepository;
import com.shopbetho.shop.repository.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountAdminService {
    @Autowired
    private AccountAdminRepository accountAdminRepository;
    public AccountAdmin findByEmail(String email) {
        return accountAdminRepository.findByEmail(email);
    }
}
