package com.tujuhsembilan.app.model;

import java.time.LocalDateTime;
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
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "most_frequent_skillset")
@Entity
@EntityListeners(AuditingEntityListener.class)

public class MostFrequentSkillsetModel {

    @Id
    @Column(name = "most_frequent_skillset_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID mostFrequentSkillsetId;

    @ManyToOne
    @JoinColumn(name = "skillset_id", referencedColumnName = "skillset_id")
    private SkillsetModel skillset;

    @Column(name = "counter", columnDefinition = "INTEGER")
    private Integer counter;

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
