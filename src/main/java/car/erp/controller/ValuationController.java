package car.erp.controller;

import java.math.BigDecimal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import car.erp.service.ValuationService;
import car.erp.utils.ResultMap;

@Service
@RequestMapping(value="valuation")
public class ValuationController {

	@Autowired
	private ValuationService valuationService;
	
	@RequestMapping(value = "index")
    public String index(){
        return "/valuation/valuationIndex";
    }
	
	@RequestMapping(value = "getCount")
	@ResponseBody
    public Map<String,Object> getCount(@RequestParam Map<String,Object> details){
		BigDecimal count = valuationService.getCount(details);
        return ResultMap.RESULT(true, "成功",count);
    }
}
