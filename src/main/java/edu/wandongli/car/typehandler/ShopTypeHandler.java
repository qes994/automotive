package edu.wandongli.car.typehandler;

import edu.wandongli.car.enums.ShopEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(ShopEnum.class)
@MappedJdbcTypes(JdbcType.INTEGER)
public class ShopTypeHandler extends BaseTypeHandler<ShopEnum> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, ShopEnum ShopEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, ShopEnum.getId());
    }
 
    @Override
    public ShopEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return ShopEnum.geStatus(id);
    }

    @Override
    public ShopEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return  ShopEnum.geStatus(id);
    }

    @Override
    public ShopEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return   ShopEnum.geStatus(id);
    }
}
