package car.erp.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;

import car.erp.model.MaintainDetail;
import car.erp.model.User;
import car.erp.model.query.MaintainQuery;
import car.erp.model.query.UserQuery;

public interface UserService {

    public PageInfo<User> getUserList(UserQuery query);

	public void saveUser(User user);

	public void delete(Integer id);

	public User loadUserById(Integer id);

	public void update(User user);

	public PageInfo<MaintainDetail> getMaintainList(MaintainQuery query);

	public void addMaintain(Map<String, Object> maintain);

	public void deleteMaintain(Integer masterId, Integer id);

	public void addAudit(Integer id);
}
