package mybatis.service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
 private static SqlSessionFactory factory;
 
 static {
	 //static 초기화
	 try {
//		 Reader r = Resources.getResourceAsReader("mybatis/config/config.xml");
//		 factory = new SqlSessionFactoryBuilder().build(r);
//		 r.close();
		 Reader r = Resources.getResourceAsReader("mybatis/config/config.xml");
		 factory = new SqlSessionFactoryBuilder().build(r);
		 r.close();
	 } catch(Exception e) {
		 e.printStackTrace();
	 }
	 
 }
 // 생성하지 않고 사용할 수 있도록 만듬
 public static SqlSessionFactory getssf() {
	 return factory;
 }
}
