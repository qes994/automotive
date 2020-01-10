package edu.wandongli.car.pojo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

//意见反馈
@Data
@EqualsAndHashCode
public class Opinion {
    private Long id;
    private Long userId;
    private String content;
    private Date createTime;
    private Date updateTime;
}
