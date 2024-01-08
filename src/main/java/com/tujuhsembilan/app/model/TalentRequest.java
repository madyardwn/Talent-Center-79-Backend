package com.tujuhsembilan.app.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import java.time.LocalDateTime;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "talent_request")
@Entity
@EntityListeners(AuditingEntityListener.class)
public class TalentRequest {

    @Id
    @Column(name = "talent_request_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID talentRequestStatusId;

    @ManyToOne
    @JoinColumn(name = "talent_wishlist_id", referencedColumnName = "talent_wishlist_id")
    private TalentWishlist talentWishlist;

    @ManyToOne
    @JoinColumn(name = "talent_request_status_id", referencedColumnName = "talent_request_status_id")
    private TalentRequestStatus talentRequestStatus;

    @Column(name = "request_reject_reason", length = 255)
    private String requestRejectReason;

    @Column(name = "request_date", columnDefinition = "DATE")
    private LocalDateTime requestDate;

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
