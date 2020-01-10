package edu.wandongli.car.typehandler;

import edu.wandongli.car.enums.RealEnum;
import edu.wandongli.car.enums.UserEnum;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(UserEnum.class)
@MappedJdbcTypes(JdbcType.INTEGER)
public class UserEnumTypeHandler extends BaseTypeHandler<UserEnum> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, UserEnum userEnum, JdbcType jdbcType) throws SQLException {
        preparedStatement.setInt(i, userEnum.getId());
    }

    @Override
    public UserEnum getNullableResult(ResultSet resultSet, String s) throws SQLException {
        int id = resultSet.getInt(s);
        return UserEnum.geStatus(id);
    }

    @Override
    public UserEnum getNullableResult(ResultSet resultSet, int i) throws SQLException {
        int id = resultSet.getInt(i);
        return UserEnum.geStatus(id);
    }

    @Override
    public UserEnum getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        int id = callableStatement.getInt(i);
        return UserEnum.geStatus(id);
    }
}
