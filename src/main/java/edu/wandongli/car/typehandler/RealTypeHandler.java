package edu.wandongli.car.typehandler;

import edu.wandongli.car.enums.RealEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(RealEnum.class)
@MappedJdbcTypes(JdbcType.INTEGER)
public class RealTypeHandler extends BaseTypeHandler<RealEnum> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, RealEnum RealEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, RealEnum.getId());
    }
 
    @Override
    public RealEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return RealEnum.getReal(id);
    }

    @Override
    public RealEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return  RealEnum.getReal(id);
    }

    @Override
    public RealEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return   RealEnum.getReal(id);
    }
}
