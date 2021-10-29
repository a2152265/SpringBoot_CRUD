package com.infotran.springboot.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import com.infotran.springboot.model.CustomerBean;
import com.infotran.springboot.service.CustomerService;
import com.infotran.springboot.validate.CustomerValidator;

@Controller
public class CustomerSaveUpdateController {

	CustomerService customerService;
	@Autowired
	public CustomerSaveUpdateController(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	@GetMapping("/_01_customer/insertCustomer")
	public String sendEmptyForm(Model model) {
		return "_01_customer/InsertCustomerForm";
	}
	
	@PutMapping("/_01_customer/customers/{id}")
	public String save(@ModelAttribute CustomerBean bean, 
			BindingResult result, 
			@PathVariable Integer id
			) {
		System.out.println("in @PutMapping, bean=" + bean);
		new CustomerValidator().validate(bean, result);
		if (result.hasErrors()) {
			//
			return "_01_customer/EditCustomerForm";
		}
		customerService.save(bean);
		return "redirect:/_01_customer/customers";
	}
	
	@ModelAttribute
	public CustomerBean  m1(
			@RequestParam(required = false) Integer customerId
			) {
		CustomerBean bean = null;
		if (customerId == null) {
			bean = new CustomerBean();
		} else {
			Optional<CustomerBean> optional = customerService.getCustomerById(customerId);
			if (optional.isPresent()) {
				bean = optional.get();
				System.out.println("in @ModelAttribute, bean=" + bean);
			}
		}
			
		return bean;
	} 
	
	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// java.util.Date
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		CustomDateEditor ce = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, ce);
		// java.sql.Date
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat2.setLenient(false);
		CustomDateEditor ce2 = new CustomDateEditor(dateFormat2, true);
		binder.registerCustomEditor(java.sql.Date.class, ce2);
	}
}
