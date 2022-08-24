package com.example.BillingSystem.controller;

import com.example.BillingSystem.repository.CheckoutRepo;
import com.example.BillingSystem.repository.CustomerRepo;
import com.example.BillingSystem.repository.ProductRepo;
import com.example.BillingSystem.service.CheckoutService;
import net.sf.jasperreports.engine.JRException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.PathResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import java.util.ArrayList;

@Controller
public class CheckoutController {

    @Autowired
    CheckoutRepo checkoutRepo;

    @Autowired
    ProductRepo productRepo;

    @Autowired
    CustomerRepo customerRepo;

    @Autowired
    CheckoutService checkoutService;

    @PostMapping("/checkout")
    public String checkout(Model model,@RequestParam String name,@RequestParam long contact, @RequestParam ArrayList<Long> id, @RequestParam ArrayList<String> productName , @RequestParam ArrayList<Integer> price, @RequestParam ArrayList<Integer> quantity, @RequestParam ArrayList<Integer> stock, @RequestParam ArrayList<Integer> total) throws JRException {
        checkoutService.checkout(model,name,contact,id,productName,price,quantity,stock,total);
        return "checkout";
    }

    @RequestMapping(value = "/generateBill",produces = MediaType.APPLICATION_PDF_VALUE,method = RequestMethod.GET)
    public ResponseEntity<InputStreamResource> generateBill() throws IOException {
        PathResource pdf = new PathResource("/Users/virti.vora/Desktop/BillingSystem/src/main/resources/pdf/Bill.pdf");
        return ResponseEntity.ok().body(new InputStreamResource(pdf.getInputStream()));
    }

    // @PostMapping("/checkout")
//    public String checkout(Model model,@RequestParam String name,@RequestParam long contact, @RequestParam ArrayList<Long> id, @RequestParam ArrayList<String> productName , @RequestParam ArrayList<Integer> price, @RequestParam ArrayList<Integer> quantity, @RequestParam ArrayList<Integer> stock, @RequestParam ArrayList<Integer> total) {
//
//        LocalDate date = LocalDate.now();
//        if(customerRepo.findByContact(contact) == null) {
//            Customer customer = new Customer(name, contact);
//            List<Checkout> checkouts = new ArrayList<>();
//
//            for (int i = 0; i < productName.size(); i++) {
//                if (quantity.get(i) > 0) {
//                    checkouts.add(new Checkout(productName.get(i), price.get(i), quantity.get(i),total.get(i), date));
//                    int finalStock = stock.get(i) - quantity.get(i);
//                    productRepo.updateStock(finalStock, id.get(i));
//                }
//            }
//            customer.setCheckout(checkouts);
//            customerRepo.save(customer);
//            model.addAttribute("checkout", checkoutRepo.findByDateAndId(LocalDate.now().toString(),customer.getId()));
//            return "addProduct";
//        }
//        else {
//                Customer customer = customerRepo.findByContact(contact);
//                List<Checkout> checkouts = customer.getCheckout();
//
//                for (int i = 0; i < productName.size(); i++) {
//                    if (quantity.get(i) > 0) {
//                        checkouts.add(new Checkout(productName.get(i), price.get(i), quantity.get(i), total.get(i), date));
//                        int finalStock = stock.get(i) - quantity.get(i);
//                        productRepo.updateStock(finalStock, id.get(i));
//                    }
//                }
//                customer.setCheckout(checkouts);
//                customerRepo.save(customer);
//            model.addAttribute("checkout", checkoutRepo.findByDateAndId(LocalDate.now().toString(),customer.getId()));
//            return "addProduct";
//        }
//    }

}


