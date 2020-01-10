package edu.wandongli.car.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import edu.wandongli.car.enums.ShopEnum;
import edu.wandongli.car.enums.StatusEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import java.util.List;

//发布表
@JsonIgnoreProperties(value = { "handler" })
@Data
@EqualsAndHashCode
public class Issue {
    private Long id;
    private Long userId;
    private String brand;
    private String arctic;
    private String title;
    private String digest;
    private String details;
    private int priority;
    private int price;
    private StatusEnum status;
    private Date createTime;
    private Date updateTime;
    private ShopEnum shop;//1售卖 2求购
    private int ceilingPrice;
    private int floorPrice;
    @TableField(exist = false)
    private List<IssuePrint> issuePrints;
    @TableField(exist = false)
    private User user;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getArctic() {
        return arctic;
    }

    public void setArctic(String arctic) {
        this.arctic = arctic;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public StatusEnum getStatus() {
        return status;
    }

    public void setStatus(StatusEnum status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public ShopEnum getShop() {
        return shop;
    }

    public void setShop(ShopEnum shop) {
        this.shop = shop;
    }

    public int getCeilingPrice() {
        return ceilingPrice;
    }

    public void setCeilingPrice(int ceilingPrice) {
        this.ceilingPrice = ceilingPrice;
    }

    public int getFloorPrice() {
        return floorPrice;
    }

    public void setFloorPrice(int floorPrice) {
        this.floorPrice = floorPrice;
    }

    public List<IssuePrint> getIssuePrints() {
        return issuePrints;
    }

    public void setIssuePrints(List<IssuePrint> issuePrints) {
        this.issuePrints = issuePrints;
    }
}
