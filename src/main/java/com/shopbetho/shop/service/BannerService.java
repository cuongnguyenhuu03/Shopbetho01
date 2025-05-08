package com.shopbetho.shop.service;

import com.shopbetho.shop.entity.Banner;
import com.shopbetho.shop.repository.BannerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BannerService {
    @Autowired
    private BannerRepository bannerRepository;
    //create banner
    public Banner save(Banner banner) {
        return bannerRepository.save(banner);
    }

    //find all
    public List<Banner> findAll() {
        return bannerRepository.findAll();
    }

    public Banner findTopByOrderByCreatedAtDesc() {
        return bannerRepository.findTopByOrderByCreatedAtDesc();
    }
}
