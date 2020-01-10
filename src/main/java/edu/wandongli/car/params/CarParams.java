package edu.wandongli.car.params;

import com.fasterxml.jackson.annotation.JsonProperty;
import edu.wandongli.car.enums.ShopEnum;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class CarParams {
    @NotNull(message = "请选择发布类型")
    private String shop;
    @NotBlank(message = "请填写发布标题")
    @NotNull(message = "请填写发布标题")
    private String title;
    @NotNull(message = "请输入价格")
    private int price;
    @NotBlank(message = "请填写品牌")
    @NotNull(message = "请填写品牌")
    private String brand;
    @NotBlank(message = "请填写车型")
    @NotNull(message = "请填写车型")
    private String arctic;
    @NotNull(message = "请填写详细描述")
    @NotBlank(message = "请填写详细描述")
    private String details;
    private String image;
}
