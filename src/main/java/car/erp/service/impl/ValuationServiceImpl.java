package car.erp.service.impl;

import java.math.BigDecimal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import car.erp.model.User;
import car.erp.service.UserService;
import car.erp.service.ValuationService;

@Service
public class ValuationServiceImpl implements ValuationService {

	@Autowired
	private UserService userService;
	
	@Override
	public BigDecimal getCount(Map<String, Object> details) {
		Integer userId = Integer.valueOf(details.get("userId").toString());
		details.get("");
		User user = userService.loadUserById(userId);
		if(user.getIsAudit() == 1) {
			
		}else {
			
		}
		return null;
	}

	
}
