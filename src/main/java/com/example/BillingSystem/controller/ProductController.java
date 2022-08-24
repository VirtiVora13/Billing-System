package com.example.BillingSystem.controller;
import com.example.BillingSystem.model.Products;
import com.example.BillingSystem.repository.ProductRepo;
import com.example.BillingSystem.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


@Controller
public class ProductController {

    @Autowired
    ProductRepo productRepo;

    @Autowired
    ProductService productService;


    @GetMapping("/showProducts")
    public String showProducts(Model model) {
        productService.showProducts(model);
        return "product";
    }

    @GetMapping("/addProducts")
    public String addProducts() {
        return "addProducts";
    }

    @PostMapping("/saveProducts")
    public String saveProducts(@ModelAttribute("product") Products product,Model model) {
        productRepo.save(product);
        productService.showProducts(model);
        return "product";
    }

    @GetMapping("/removeProducts/{id}" )
    public RedirectView deleteProducts(@PathVariable Long id, Model model) {
       productService.deleteProducts(id,model);
       RedirectView redirectView = new RedirectView();
       redirectView.setUrl("http://localhost:8080/showProducts");
       return redirectView;
    }

    @GetMapping("/searchProducts")
    public String searchProducts(@RequestParam(name = "search") String search,Model model) {
       productService.searchProducts(search,model);
        return "product";
    }
}
