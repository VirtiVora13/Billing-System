package com.example.BillingSystem.repository;

import com.example.BillingSystem.model.Checkout;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;


public interface CheckoutRepo extends JpaRepository<Checkout, Long> {

    @Query(value = "SELECT * from checkout where date = ?1 and fk_user_id = ?2", nativeQuery = true)
    List<Checkout> findByDateAndId(String now, long id);

    @Query(value = "SELECT sum(total) from checkout where date = ?1 and fk_user_id = ?2", nativeQuery = true)
    int getTotal(String toString, long id);

    ;
}
