package car.erp.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;

public class ResultMap {
	
	
	public static  Map<String,Object> RESULT(boolean status,String msg,PageInfo<?> page) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", status);
		map.put("msg", msg);
		map.put("total", page.getTotal());
		map.put("rows", page.getList());
		map.put("pageSize", page.getPageSize());
		map.put("pageNum", page.getPageNum());
		return map;
	}
	
	public static  Map<String,Object> RESULT(boolean status,String msg) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", status);
		map.put("msg", msg);
		return map;
	}
	
	public static  Map<String,Object> RESULT(boolean status,String msg,List<?> list) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", status);
		map.put("msg", msg);
		map.put("rows", list);
		return map;
	}
	
	public static  Map<String,Object> RESULT(boolean status,String msg,Object object) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", status);
		map.put("msg", msg);
		map.put("object", object);
		return map;
	}
	
}
