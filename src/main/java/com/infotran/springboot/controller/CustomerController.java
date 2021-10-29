package com.infotran.springboot.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.request.WebRequest;

import com.infotran.springboot.model.CustomerBean;
import com.infotran.springboot.service.CustomerService;
import com.infotran.springboot.validate.CustomerValidator;

@Controller
public class CustomerController {

	CustomerService customerService;

	@Autowired
	public CustomerController(CustomerService customerService) {
		this.customerService = customerService;
	}

	@GetMapping("/_01_customer/customers")
	public String showCustomer(Model model) {
		List<CustomerBean> bean = customerService.getCustomers();
		model.addAttribute(bean);
		return "_01_customer/ShowCustomers";
	}
    // int   n;        -2147483648 ~+2147483647
	// long  l         
	@PostMapping("/_01_customer/customers")
	public String save(@ModelAttribute CustomerBean bean, BindingResult result) {
//		System.out.println("---------------------------");
//		System.out.println(result.getAllErrors());
//		System.out.println("---------------------------");
		new CustomerValidator().validate(bean, result);
		if (result.hasErrors()) {
			return "_01_customer/InsertCustomerForm";
		}
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		bean.setRegisterTime(ts);
		customerService.save(bean);
		return "redirect:/_01_customer/customers";
	}

	//
	@GetMapping("/_01_customer/customers/{id}")
	public String sendCustomerForm(Model model, @PathVariable(required=false) Integer id) {
		if (id == null) {
			throw new RuntimeException("請求未提供客戶Id");
		}
		Optional<CustomerBean> optional = customerService.getCustomerById(id);
		if (optional.isPresent()) {
			System.out.println("lee");
			CustomerBean bean = optional.get();
			bean.setPassword1(bean.getPassword());
			model.addAttribute(bean);
		} else {
			
		}
		return "_01_customer/EditCustomerForm";
	}
	
	
	@DeleteMapping("/_01_customer/customers/{id}")
	public String deleteCustomerForm(Model model, @PathVariable(required=false) Integer id) {
		if (id == null) {
			throw new RuntimeException("請求未提供客戶Id");
		}
		Optional<CustomerBean> optional = customerService.getCustomerById(id);
		if (optional.isPresent()) {
			CustomerBean bean = optional.get();
			customerService.deleteCustomerByPrimaryKey(bean.getCustomerId());
		} else {
			throw new RuntimeException("客戶Id不存在");
		}
		
		return "redirect:/_01_customer/customers";
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
