package com.project.cmsproject.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.cmsproject.entities.Quotation;

@Repository
public interface QuotationRepository extends JpaRepository<Quotation, Long> {
}
