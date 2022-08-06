package edu.poly.app.service;

import edu.poly.app.model.Share;

public class ShareService extends BaseDAO<Share, Integer>{
    @Override
    public Class<Share> getEntityClass() {
        return null;
    }

    @Override
    public String getHQuery(String action) {
        return null;
    }

    @Override
    public Object[] getParameters(String action, Share entity) {
        return new Object[0];
    }
}
