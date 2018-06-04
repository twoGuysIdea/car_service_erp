package car.erp.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import car.erp.model.Goods;
import car.erp.utils.jdbcUtils.business.ModelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import car.erp.dao.UserMapper;
import car.erp.model.MaintainDetail;
import car.erp.model.User;
import car.erp.model.query.MaintainQuery;
import car.erp.model.query.UserQuery;
import car.erp.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /** 
     * 构造方法执行后，初始化， 
     */  
    @PostConstruct
    @Transactional
    public void init() {
    	UserQuery query = new UserQuery();
    	List<User> userList = userMapper.getUserList(query);
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    	for (User user : userList) {
    		if(user.getAuditDate() != null) {
    			Integer auditDate = Integer.valueOf(sdf.format(user.getAuditDate()));
        		Integer currenDate = Integer.valueOf(sdf.format(new Date()));
        		if(currenDate - auditDate >= 10000) {
        			user.setIsAudit(1);
        			userMapper.updateUser(user);
        		}
        		
    		}
		}
    }  

    public PageInfo<User> getUserList(UserQuery query){
        User user = new User();
        ModelUtils.update(user);
		PageHelper.startPage(query.getPageNumber(), query.getPageSize());
    	List<User> userList = userMapper.getUserList(query);
    	PageInfo<User> list = new PageInfo<User>(userList);
        return list;
    }

	@Override
	public void saveUser(User user) {
		user.setSafeDate(getSafeDate(user.getBuyDate()));
		userMapper.saveUser(user);
	}

	@Override
	public void delete(Integer id) {
		
		userMapper.delete(id);
	}

	@Override
	public User loadUserById(Integer id) {
		return userMapper.loadUserById(id);
	}

	@Override
	public void update(User user) {
		user.setSafeDate(getSafeDate(user.getBuyDate()));
		userMapper.updateUser(user);
	}

	public Date getSafeDate(Date buyDate){
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(buyDate.getTime());
		calendar.setTime(date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		long currenTime = new Date().getTime();
		long buyTime = buyDate.getTime();
		Long year = (currenTime - buyTime)/(1000 * 60 * 60 * 24)/365;
		Integer differNum = Integer.valueOf(year.toString());
		if(differNum < 6) {//当该车小于六年，那么就是隔年审
			if (differNum % 2 == 0){
				calendar.add(Calendar.YEAR, (2+differNum));
			}else{
				calendar.add(Calendar.YEAR, (1+differNum));
			}
			return calendar.getTime();
		}else {
			calendar.add(Calendar.YEAR, (1+differNum));
			return calendar.getTime();
		}
	}

	@Override
	public PageInfo<MaintainDetail> getMaintainList(MaintainQuery query) {
		PageHelper.startPage(query.getPageNumber(), query.getPageSize());
		return new PageInfo<MaintainDetail>(userMapper.getMaintainList(query));
	}

	@Override
	@Transactional
	public void addMaintain(Map<String, Object> maintain) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			User user = userMapper.loadUserById(Integer.valueOf(maintain.get("masterId").toString().trim()));
			user.setMaintainDate(sdf.parse(maintain.get("maintainDate").toString()));
			userMapper.updateUser(user);
			userMapper.addMaintain(maintain);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	@Override
	@Transactional
	public void deleteMaintain(Integer masterId,Integer id) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			User user = userMapper.loadUserById(masterId);
			MaintainQuery query = new MaintainQuery();
			query.setMasterId(masterId);
			List<MaintainDetail> maintainList = userMapper.getMaintainList(query);
			if(maintainList.size() == 1) {
				user.setMaintainDate(null);
			}else {
				user.setMaintainDate(sdf.parse(sdf.format(maintainList.get(1).getMaintainDate())));
			}
			userMapper.updateUser(user);
			userMapper.deleteMaintain(id);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addAudit(Integer id) {
		User user = userMapper.loadUserById(id);
		user.setAuditDate(new Date());
		user.setIsAudit(2);
		userMapper.updateUser(user);
	}
}
