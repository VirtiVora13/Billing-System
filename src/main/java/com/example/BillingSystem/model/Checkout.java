package com.example.BillingSystem.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Checkout {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String productName;
    private int price;
    private int quantity;
    private int total;
    @DateTimeFormat
    private LocalDate date;

    public Checkout(String productName, int price, int quantity, int total, LocalDate date) {
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
        this.date = date;
    }
}
