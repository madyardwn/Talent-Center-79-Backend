package com.tujuhsembilan.app.model;

import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
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
@Table(name = "talent")
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Talent {

    @Id
    @Column(name = "talent_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID talentId;

    @ManyToOne
    @JoinColumn(name = "talent_level_id", referencedColumnName = "talent_level_id")
    private TalentLevel talentLevel;

    @ManyToOne
    @JoinColumn(name = "talent_status_id", referencedColumnName = "talent_status_id")
    private TalentStatus talentStatus;

    @ManyToOne
    @JoinColumn(name = "employee_status_id", referencedColumnName = "employee_status_id")
    private EmployeeStatus employeeStatus;

    @OneToOne(mappedBy = "talent")
    private TalentMetadata talentMetadata;

    @OneToMany(mappedBy = "talent")
    private List<TalentWishlist> talentWishlist;

    @ManyToMany(mappedBy = "talents")
    private List<Position> positions;

    @Column(name = "talent_name", length = 255)
    private String talentName;

    @Column(name = "email", length = 100)
    private String email;

    @Column(name = "talent_photo_filename", length = 255)
    private String talentPhotoFilename;

    @Column(name = "employee_number", length = 50)
    private String employeeNumber;

    @Column(name = "gender")
    @Convert(converter = GenderConverter.class)
    private Gender gender;

    @Column(name = "birth_date", columnDefinition = "DATE")
    private LocalDateTime birthDate;

    @Column(name = "talent_description", columnDefinition = "TEXT")
    private String talentDescription;

    @Column(name = "talent_cv_filename", length = 255)
    private String talentCvFilename;

    @Column(name = "experience", columnDefinition = "SMALLINT")
    private Short experience;

    @Column(name = "cellphone", length = 20)
    private String cellphone;

    @Column(name = "biography_video_url", length = 255)
    private String biographyVideoUrl;

    @Column(name = "is_add_to_list_enable")
    private Boolean isAddToListEnable;

    @Column(name = "talent_availability")
    private Boolean talentAvailability;

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
