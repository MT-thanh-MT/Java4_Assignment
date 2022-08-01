package edu.poly.app.service;

import edu.poly.app.model.Users;
import java.util.List;

public class UserService extends BaseDAO<Users, String>{
    @Override
    public Class<Users> getEntityClass() {
        return Users.class;
    }
    @Override
    public String getHQuery(String action) {
        switch (action) {
            case "selectAll":
                return "From Users";
            case "selectByName":
                return "FROM Users AS u WHERE u.fullname like ?0";
            case "selectByRole":
                return "FROM Users AS u WHERE u.admin = ?0";
            case "selectOne":
                return "FROM Users AS u WHERE u.id = ?0 AND u.password = ?1";
            default:
                return null;
        }
    }
    @Override
    public Object[] getParameters(String action, Users users) {
        switch (action) {
            case "selectByName":
                return new Object[] {
                        "%" + users.getFullname() + "%"
                };
            case "selectByRole":
                return new Object[] {
                        users.isAdmin()
                };
            case "selectOne":
                return new Object[] {
                        users.getId(),
                        users.getPassword()
                };
            default:
                return null;
        }
    }
    public List<Users> findByName(Users users) {
        return this.getListByQuery(this.getHQuery("selectByName"), this.getParameters("selectByName", users));
    }
    public List<Users> findByRole(Users users) {
        return this.getListByQuery(this.getHQuery("selectByRole"), this.getParameters("selectByRole", users));
    }
    public Users findOneUser(Users users) {
        return this.getListByQuery(this.getHQuery("selectOne"), this.getParameters("selectOne", users)).get(0);
    }
}
