package com.tujuhsembilan.app.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tujuhsembilan.app.model.PositionModel; // panggil Model dari Repository yang akan di panggil

// Menggunakan anotasi @Repository untuk mendeklarasikan bahwa ini adalah bean repository Spring.
@Repository
public interface PositionRepository extends JpaRepository<PositionModel, UUID> {
    
    // Mendeklarasikan metode query JPA untuk mencari posisi berdasarkan ID posisi.
    PositionModel findByPositionId(UUID positionId);

    // Mendeklarasikan metode query JPA untuk mencari beberapa posisi berdasarkan daftar ID posisi.
    List<PositionModel> findByPositionIdIn(List<UUID> filterPosition);
}
