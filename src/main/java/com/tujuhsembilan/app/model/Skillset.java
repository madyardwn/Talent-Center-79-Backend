package com.tujuhsembilan.app.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "skillset")
@Entity
@EntityListeners(AuditingEntityListener.class)

public class Skillset implements Serializable {

    @Id
    @Column(name = "skillset_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID skillsetId;

    @ManyToOne
    @JoinColumn(name = "skillset_type_id", referencedColumnName = "skillset_type_id")
    private SkillsetType skillsetType;

    @OneToMany(mappedBy = "skillset")
    private List<MostFrequentSkillset> mostFrequentSkillsets;

    @Column(name = "skillset_name", length = 50)
    private String skillsetName;

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
