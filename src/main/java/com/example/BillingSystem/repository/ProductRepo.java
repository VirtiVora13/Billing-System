package com.example.BillingSystem.repository;

import com.example.BillingSystem.model.Products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ProductRepo extends JpaRepository<Products,Long> {

    @Modifying
    @Transactional
    @Query(value = "UPDATE products SET stock = ?1 WHERE id = ?2",nativeQuery = true)
    int updateStock(int i, long id);

    List<Products> findByproductName(String search);
}
