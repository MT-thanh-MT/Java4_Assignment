package edu.poly.app.service;

import edu.poly.app.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public abstract class BaseDAO<T, Key> {
    public abstract Class<T> getEntityClass();
    public abstract String getHQuery(String action);
    public abstract Object[] getParameters(String action, T entity);
    public void create(T entity) {
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            session.getTransaction().begin();
            session.save(entity);
            session.getTransaction().commit();
        }
    }
    public void update(T entity) {
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            session.getTransaction().begin();
            session.update(entity);
            session.getTransaction().commit();
        }
    }
    public void delete(T entity) {
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            session.getTransaction().begin();
            session.delete(entity);
            session.getTransaction().commit();
        }
    }
    public List<T> findAll() {
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            List<T> list  = session.createQuery(this.getHQuery("selectAll")).list();
            return list;
        }
    }
    public T findByID(Key key) {
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {
            T entity = session.find(this.getEntityClass(), key);
            return entity;
        }
    }
    public List<T> findPage(int page, int size) {
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            Query<T> query = session.createQuery(this.getHQuery("selectAll"));
            query.setFirstResult(page * size);
            query.setMaxResults(size);
            List<T> list = query.list();
            return list;
        }
    }
    public List<T> getListByQuery(String HQuery, Object... Parameters) {
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<T> query = session.createQuery(HQuery);
            if (Parameters != null) {
                for (int i = 0; i < Parameters.length; i++) {
                    query.setParameter(i, Parameters[i]);
                }
            }
            return query.list();
        }
    }
}
