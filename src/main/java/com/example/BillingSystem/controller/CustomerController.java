package com.example.BillingSystem.controller;

import com.example.BillingSystem.model.Customer;
import com.example.BillingSystem.repository.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CustomerController {

        @Autowired
        CustomerRepo customerRepo;

        @PostMapping("/saveCustomer")
        public void saveCustomer(@RequestParam String name, @RequestParam long contact){
            customerRepo.save(new Customer(name,contact));
        }
}
