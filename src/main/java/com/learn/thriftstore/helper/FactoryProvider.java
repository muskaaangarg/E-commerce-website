
package com.learn.thriftstore.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getfactory(){
        try{
            if (factory==null){
                factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return factory;
    }
}
