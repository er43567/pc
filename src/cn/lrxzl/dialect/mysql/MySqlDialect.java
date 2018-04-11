package cn.lrxzl.dialect.mysql;

import org.hibernate.dialect.function.SQLFunctionTemplate;
import org.hibernate.type.IntegerType;

public class MySqlDialect extends org.hibernate.dialect.MySQLDialect {
	public MySqlDialect() {
		super();
		this.registerFunction("dfs", new SQLFunctionTemplate(new IntegerType(), "dfs(?1)"));
	}
}
