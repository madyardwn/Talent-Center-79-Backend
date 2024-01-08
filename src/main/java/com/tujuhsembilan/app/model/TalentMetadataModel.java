package com.tujuhsembilan.app.model;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "talent_metadata")
@Entity
@EntityListeners(AuditingEntityListener.class)
public class TalentMetadataModel {

    @Id
    @OneToOne
    @JoinColumn(name = "talent_id", referencedColumnName = "talent_id")
    private TalentModel talent;

    @Column(name = "cv_counter", columnDefinition = "INTEGER")
    private Integer cvCounter;

    @Column(name = "profile_counter", columnDefinition = "INTEGER")
    private Integer profileCounter;

    @Column(name = "total_project_completed", columnDefinition = "SMALLINT")
    private Short totalProjectCompleted;

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
