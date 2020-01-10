package edu.wandongli.car.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

//发布记录表
@JsonIgnoreProperties(value = { "handler" })
@Data
@EqualsAndHashCode
public class IssuePrint {
    private Long id;
    private Long issueId;
    private int priority;//显示图片的优先级
    private String cover;
    private Date createTime;
    @TableField(exist = false)
    private Issue issue;

}
