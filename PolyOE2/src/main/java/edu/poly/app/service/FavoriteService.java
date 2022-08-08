package edu.poly.app.service;

import edu.poly.app.domain.FavoriteReport;
import edu.poly.app.domain.FavoriteUserReport;
import edu.poly.app.model.Favorite;
import edu.poly.app.model.Videos;
import edu.poly.app.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class FavoriteService extends BaseDAO<Favorite, Integer> {
    @Override
    public Class<Favorite> getEntityClass() {
        return Favorite.class;
    }

    @Override
    public String getHQuery(String action) {
        switch (action) {
            case "selectAll":
                return "From Favorite";
            case "selectFavoritesByVideo":
                return "SELECT new edu.poly.app.domain.FavoriteReport(f.video.title, count(f), min(f.likeDate), max(f.likeDate)) FROM Favorite f GROUP BY f.video.title";
            case "selectFavoritesUserByVideo":
                return "SELECT new edu.poly.app.domain.FavoriteUserReport(f.user.id, f.user.fullname, f.user.email, f.likeDate) FROM Favorite f WHERE f.video.id = :videoId";
            case "selectOne":
                return "FROM Users AS u WHERE u.id = ?0 AND u.password = ?1";
            default:
                return null;
        }
    }

    @Override
    public Object[] getParameters(String action, Favorite entity) {
        switch (action) {
            case "selectByName":
                return new Object[] {
                        "%" + "entity.getFullname()" + "%"
                };
            default:
                return null;
        }
    }
    public List<FavoriteReport> getFavoritesByVideo() {
        List<FavoriteReport> list = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<FavoriteReport> query = session.createQuery(this.getHQuery("selectFavoritesByVideo"), FavoriteReport.class);
            list = query.list();
        }
        return list;
    }
    public List<FavoriteUserReport> getFavoritesUserByVideo(String videoID) {
        List<FavoriteUserReport> list = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<FavoriteUserReport> query = session.createQuery(this.getHQuery("selectFavoritesUserByVideo"), FavoriteUserReport.class);
            query.setParameter("videoId", videoID);
            list = query.list();
        }
        return list;
    }

}
