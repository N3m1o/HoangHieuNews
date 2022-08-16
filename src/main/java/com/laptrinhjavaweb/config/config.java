package com.laptrinhjavaweb.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

public class config extends WebMvcConfigurerAdapter{
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {  
    registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
   }
}
