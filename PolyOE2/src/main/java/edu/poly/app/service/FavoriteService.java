package edu.poly.app.service;

import edu.poly.app.model.Favorite;

public class FavoriteService extends BaseDAO<Favorite, Integer> {
    @Override
    public Class<Favorite> getEntityClass() {
        return Favorite.class;
    }

    @Override
    public String getHQuery(String action) {
        return null;
    }

    @Override
    public Object[] getParameters(String action, Favorite entity) {
        return new Object[0];
    }
}
