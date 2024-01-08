package com.tujuhsembilan.app.model;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // untuk otomatis membuat getter dan setter untuk seluruh atribut dibawah
@Builder // untuk membuat constructur dari entitas secara otomatis
@NoArgsConstructor // Anotasi ini membuat konstruktor tanpa argumen untuk kelas yang diannotasi
@AllArgsConstructor // Anotasi ini membuat konstruktor dengan parameter untuk setiap atribut dalam
                    // kelas yang diannotasi
@Table(name = "position") // untuk menentukan tabel mananya dalam database
@Entity // untuk menandakan bahwa model ini adalah sebuah entital SQL
@EntityListeners(AuditingEntityListener.class) // untuk otomatis menangani audit data (created and updated)
public class Position {
    @Id // initialize untuk ID
    @Column(name = "position_id") // nama kolom dalam database
    @GeneratedValue(strategy = GenerationType.AUTO) // otomatis generate value untuk kolom ID
    private UUID positionId; // Akses(modifier) ; tipe data ; nama variabel

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "talent_position", joinColumns = @JoinColumn(name = "position_id"), inverseJoinColumns = @JoinColumn(name = "talent_id"))
    private List<Talent> talents;

    @Column(name = "position_name", length = 50)
    private String positionName;

    @Column(name = "is_active")
    private Boolean isActive;

    @Column(name = "created_by")
    @CreatedBy
    private String createdBy;

    @Column(name = "created_time")
    @CreatedDate
    private LocalDateTime createdTime;

    @Column(name = "last_modified_by")
    @LastModifiedBy
    private String lastModifiedBy;

    @Column(name = "last_modified_time")
    @LastModifiedDate
    private LocalDateTime lastModifiedTime;

}
