package com.shopbetho.shop.service;

import com.shopbetho.shop.entity.Collection;
import com.shopbetho.shop.repository.CollectionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CollectionService {
    @Autowired
    private CollectionRepository collectionRepository;
    // save
    public Collection save(Collection collection) {
        return collectionRepository.save(collection);
    }
    public Collection findTopByOrderByCreatedAtDesc() {
        return collectionRepository.findTopByOrderByCreatedAtDesc();
    }
}
