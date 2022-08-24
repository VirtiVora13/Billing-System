package com.example.BillingSystem.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private long contact;

    @OneToMany(targetEntity = Checkout.class , cascade = CascadeType.ALL)
    @JoinColumn(name = "fkUserId",referencedColumnName = "id")
    private List<Checkout> checkout;

    public Customer(String name, long contact) {
        this.name= name;
        this.contact= contact;
    }

}
