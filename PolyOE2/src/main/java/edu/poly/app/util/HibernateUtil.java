package edu.poly.app.util;

import edu.poly.app.model.Favorite;
import edu.poly.app.model.Share;
import edu.poly.app.model.Users;
import edu.poly.app.model.Videos;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;
import java.util.List;
import java.util.Properties;
public class HibernateUtil {
    private final static SessionFactory FACTORY;

    static {
        Configuration conf = new Configuration();
        Properties pros = new Properties();
        pros.put(Environment.DIALECT, "org.hibernate.dialect.MySQLDialect");
        pros.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
        pros.put(Environment.URL, "jdbc:mysql://localhost:3306/polyoe");
        pros.put(Environment.USER, "root");
        pros.put(Environment.PASS, "123456");
        pros.put(Environment.SHOW_SQL, "true");

        conf.setProperties(pros);
        conf.addAnnotatedClass(Users.class);
        conf.addAnnotatedClass(Videos.class);
        conf.addAnnotatedClass(Favorite.class);
        conf.addAnnotatedClass(Share.class);

        ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();

        FACTORY = conf.buildSessionFactory(registry);
    }
    public static SessionFactory getSessionFactory() {
        return FACTORY;
    }
}
