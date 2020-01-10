package edu.wandongli.car.params;

import edu.wandongli.car.enums.RealEnum;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
public class UserAuthParams {

    @NotBlank(message = "不能为空")
    @NotNull(message = "不能为空")
    private String name;
    @NotBlank(message = "不能为空")
    @NotNull(message = "不能为空")
    private String frontImage;//正面照片
    @NotBlank(message = "不能为空")
    @NotNull(message = "不能为空")
    private String backImage;//反面照片
    @NotBlank(message = "不能为空")
    @Pattern(regexp = "^\\d{15}|\\d{18}$",message = "身份证格式有误")
    private String idCard;




}
