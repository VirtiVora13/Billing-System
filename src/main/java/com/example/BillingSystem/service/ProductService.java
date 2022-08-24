package com.example.BillingSystem.service;

import com.example.BillingSystem.repository.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ProductService {

    @Autowired
    ProductRepo productRepo;

    public void showProducts(Model model) {
        model.addAttribute("products",productRepo.findAll());
    }

    public void deleteProducts(Long id, Model model) {
        productRepo.deleteById(id);
    }

    public void searchProducts(String search, Model model) {
        model.addAttribute("products",productRepo.findByproductName(search));
    }
}

