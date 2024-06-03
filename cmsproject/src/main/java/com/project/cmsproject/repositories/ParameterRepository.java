package com.project.cmsproject.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.cmsproject.entities.Parameter;

public interface ParameterRepository extends JpaRepository<Parameter, Long> {
    // You can add custom query methods if needed
	
	
}
