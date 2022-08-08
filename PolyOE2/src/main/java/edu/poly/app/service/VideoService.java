package edu.poly.app.service;

import edu.poly.app.model.Videos;

public class VideoService extends BaseDAO<Videos, String>{
    @Override
    public Class<Videos> getEntityClass() {
        return Videos.class;
    }

    @Override
    public String getHQuery(String action) {
        switch (action) {
            case "selectAll":
                return "From Videos";
            case "selectByName":
                return "";
            default:
                return null;
        }
    }

    @Override
    public Object[] getParameters(String action, Videos entity) {
        switch (action) {
            case "selectByName":
                return new Object[] {
                        "%" + "" + "%"
                };
            case "selectByRole":
                return new Object[] {

                };
            case "selectOne":
                return new Object[] {

                };
            default:
                return null;
        }
    }


}
