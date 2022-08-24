package com.example.BillingSystem.service;

import com.example.BillingSystem.model.Checkout;
import com.example.BillingSystem.model.Customer;
import com.example.BillingSystem.repository.CheckoutRepo;
import com.example.BillingSystem.repository.CustomerRepo;
import com.example.BillingSystem.repository.ProductRepo;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CheckoutService {

    @Autowired
    CheckoutRepo checkoutRepo;
    @Autowired
    CustomerRepo customerRepo;
    @Autowired
    ProductRepo productRepo;

    public void checkout(Model model, String name, long contact, ArrayList<Long> id, ArrayList<String> productName, ArrayList<Integer> price, ArrayList<Integer> quantity, ArrayList<Integer> stock, ArrayList<Integer> total) throws JRException {

        LocalDate date = LocalDate.now();
        if(customerRepo.findByContact(contact) == null) {
            Customer customer = new Customer(name, contact);
            List<Checkout> checkouts = new ArrayList<>();

            for (int i = 0; i < productName.size(); i++) {
                if (quantity.get(i) > 0) {
                    checkouts.add(new Checkout(productName.get(i), price.get(i), quantity.get(i),total.get(i), date));
                    int finalStock = stock.get(i) - quantity.get(i);
                    productRepo.updateStock(finalStock, id.get(i));
                }
            }
            generatePdf(checkouts,customer,model);
        }
        else {
            Customer customer = customerRepo.findByContact(contact);
            List<Checkout> checkouts = customer.getCheckout();

            for (int i = 0; i < productName.size(); i++) {
                if (quantity.get(i) > 0) {
                    checkouts.add(new Checkout(productName.get(i), price.get(i), quantity.get(i), total.get(i), date));
                    int finalStock = stock.get(i) - quantity.get(i);
                    productRepo.updateStock(finalStock, id.get(i));
                }
            }
            generatePdf(checkouts,customer,model);
        }
    }

    public void generatePdf(List<Checkout> checkouts, Customer customer, Model model) throws JRException {
        customer.setCheckout(checkouts);
        customerRepo.save(customer);
        List<Checkout> finalCheckout = checkoutRepo.findByDateAndId(LocalDate.now().toString(), customer.getId());
        String filePath = "/Users/virti.vora/Desktop/BillingSystem/src/main/resources/Bill.jrxml";
        int total1 = checkoutRepo.getTotal(LocalDate.now().toString(),customer.getId());
        Map<String,Object> parameters = new HashMap<>();
        parameters.put("total",total1);
        JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(finalCheckout);
        JasperReport jasperReport = JasperCompileManager.compileReport(filePath);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,parameters,dataSource);
        JasperExportManager.exportReportToPdfFile(jasperPrint,"/Users/virti.vora/Desktop/BillingSystem/src/main/resources/pdf/Bill.pdf");
        model.addAttribute("checkout", finalCheckout);
    }
}
