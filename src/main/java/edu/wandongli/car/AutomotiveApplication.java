package edu.wandongli.car;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Repository;

@SpringBootApplication
@MapperScan(
        basePackages = {"edu.wandongli.car.dao"},
        annotationClass = Repository.class
)
public class AutomotiveApplication {

    public static void main(String[] args) {
        SpringApplication.run(AutomotiveApplication.class, args);
    }

}
