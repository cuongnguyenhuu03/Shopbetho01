package com.shopbetho.shop.repository;

import com.shopbetho.shop.entity.AccountAdmin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountAdminRepository extends JpaRepository<AccountAdmin, Long> {
    AccountAdmin findByEmail(String email);
}
