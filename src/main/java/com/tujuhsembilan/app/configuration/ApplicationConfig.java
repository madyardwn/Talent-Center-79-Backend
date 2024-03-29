package com.tujuhsembilan.app.configuration;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import org.apache.commons.codec.digest.DigestUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalTimeSerializer;
import com.toedter.spring.hateoas.jsonapi.JsonApiConfiguration;
import com.tujuhsembilan.app.model.Sample;
import com.tujuhsembilan.app.repository.SampleRepository;

import lib.i18n.utility.MessageUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class ApplicationConfig {

	private final MessageUtil msg;

	@Bean
	public ApplicationRunner init(SampleRepository sampleRepo) {
		return args -> {
			log.info(msg.get("application.init"));

			if (sampleRepo.count() <= 0) {
				for (int i = 0; i < 100; i++) {
					sampleRepo.save(Sample.builder()
							.code(String.format("%08d", i) + DigestUtils.sha256Hex(String.valueOf(i)).substring(0, 24))
							.description("Blabla")
							.date(LocalDateTime.now().minus(i, ChronoUnit.DAYS))
							.build());
				}
			}

			log.info(msg.get("application.done"));
		};
	}

	@Bean
	public ModelMapper modelMapper() {
		return new ModelMapper();
	}

	@Bean
	public Jackson2ObjectMapperBuilderCustomizer jsonCustomizer() {
		return builder -> {
			builder.deserializers(new LocalDateDeserializer(DateTimeFormatter.ISO_LOCAL_DATE));
			builder.serializers(new LocalDateSerializer(DateTimeFormatter.ISO_DATE));

			builder.deserializers(new LocalTimeDeserializer(DateTimeFormatter.ISO_TIME));
			builder.serializers(new LocalTimeSerializer(DateTimeFormatter.ISO_TIME));

			builder.deserializers(new LocalDateTimeDeserializer(DateTimeFormatter.ISO_DATE_TIME));
			builder.serializers(new LocalDateTimeSerializer(DateTimeFormatter.ISO_DATE_TIME));
		};
	}

	@Bean
	public JsonApiConfiguration jsonApiConfiguration() {
		return new JsonApiConfiguration()
				.withObjectMapperCustomizer(
						objectMapper -> {
							objectMapper.findAndRegisterModules();

							SimpleModule localDateTimeModule = new SimpleModule();

							localDateTimeModule.addDeserializer(LocalDate.class,
									new LocalDateDeserializer(DateTimeFormatter.ISO_LOCAL_DATE));
							localDateTimeModule.addSerializer(LocalDate.class,
									new LocalDateSerializer(DateTimeFormatter.ISO_DATE));

							localDateTimeModule.addDeserializer(LocalTime.class,
									new LocalTimeDeserializer(DateTimeFormatter.ISO_TIME));
							localDateTimeModule.addSerializer(LocalTime.class,
									new LocalTimeSerializer(DateTimeFormatter.ISO_TIME));

							localDateTimeModule.addDeserializer(LocalDateTime.class,
									new LocalDateTimeDeserializer(DateTimeFormatter.ISO_DATE_TIME));
							localDateTimeModule.addSerializer(LocalDateTime.class,
									new LocalDateTimeSerializer(DateTimeFormatter.ISO_DATE_TIME));

							objectMapper.registerModule(localDateTimeModule);
						});
	}

}
