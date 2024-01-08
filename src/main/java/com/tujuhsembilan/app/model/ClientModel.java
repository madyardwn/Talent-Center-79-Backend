package com.tujuhsembilan.app.model;

import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

import java.time.LocalDateTime;
import java.util.List;
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

import com.tujuhsembilan.app.model.converters.GenderConverter;
import com.tujuhsembilan.app.model.enums.Gender;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "client")
@Entity
@EntityListeners(AuditingEntityListener.class)
public class ClientModel {

    @Id
    @Column(name = "client_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID clientId;

    @ManyToOne
    @JoinColumn(name = "client_position_id", referencedColumnName = "client_position_id")
    private ClientPositionModel clientPosition;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private UserModel user;

    @OneToMany(mappedBy = "client")
    private List<TalentWishlistModel> talentWishlishes;

    @Column(name = "client_name", length = 255)
    private String clientName;

    @Column(name = "gender")
    @Convert(converter = GenderConverter.class)
    private Gender gender;

    @Column(name = "birth_date", columnDefinition = "DATE")
    private LocalDateTime birthDate;

    @Column(name = "email", length = 100)
    private String email;

    @Column(name = "agency_name", length = 100)
    private String agencyName;

    @Column(name = "agency_address", length = 255)
    private String agencyAddress;

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
