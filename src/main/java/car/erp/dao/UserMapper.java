package car.erp.dao;


import car.erp.model.MaintainDetail;
import car.erp.model.User;
import car.erp.model.query.MaintainQuery;
import car.erp.model.query.UserQuery;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    public List<User> getUserList(UserQuery query);

	public void saveUser(User user);

	public void delete(Integer id);

	public User loadUserById(Integer id);

	public void updateUser(User user);

	public List<MaintainDetail> getMaintainList(MaintainQuery query);

	public void addMaintain(Map<String, Object> maintain);

	public MaintainDetail getMaintainOne(Integer id);

	public void deleteMaintain(Integer id);
}
