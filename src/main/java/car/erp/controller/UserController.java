package car.erp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import car.erp.model.MaintainDetail;
import car.erp.model.User;
import car.erp.model.query.MaintainQuery;
import car.erp.model.query.UserQuery;
import car.erp.service.UserService;
import car.erp.utils.ResultMap;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "index")
    public String index(){
        return "/user/userIndex";
    }
    
    @RequestMapping(value = "selectUser")
    public String selectUser(){
        return "/user/selectUser";
    }
    
    @RequestMapping(value = "auditDetail")
    public String auditDetail(Integer id,Model model){
    	model.addAttribute("masterId", id);
        return "/user/userMaintain";
    }

    @RequestMapping(value = "/getMaintainList")
    @ResponseBody
    public Map<String, Object> getMaintainList(MaintainQuery query){
    	PageInfo<MaintainDetail> result = userService.getMaintainList(query);
        return ResultMap.RESULT(true,"查询成功",result);
    }
    
    @RequestMapping(value = "/getList")
    @ResponseBody
    public Map<String, Object> getUserList(UserQuery query){
    	PageInfo<User> result = null;
    	result = userService.getUserList(query);
        System.out.println("pagenumber:"+query.getPageNumber()+",pagesize:"+query.getPageSize());
        return ResultMap.RESULT(true,"查询成功",result);
    }
    
    @RequestMapping(value="/loadUserById")
    @ResponseBody
    public Map<String,Object> lodaUserById(Integer id){
    	User user = userService.loadUserById(id);
    	return ResultMap.RESULT(true, "查询成功", user);
    }
    
    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> saveUser(User user){
    	userService.saveUser(user);
        return ResultMap.RESULT(true,"保存成功");
    }
    
    @RequestMapping(value = "/addMaintain")
    @ResponseBody
    public Map<String, Object> addMaintain(@RequestParam Map<String,Object> maintain){
    	userService.addMaintain(maintain);
        return ResultMap.RESULT(true,"保存成功");
    }
    
        
    @RequestMapping(value = "/update")
    @ResponseBody
    public Map<String, Object> update(User user){
    	userService.update(user);
        return ResultMap.RESULT(true,"保存成功");
    }
    
    @RequestMapping(value = "/userMaintainDetail")
    public String userMaintainDetail(Integer masterId,Model model){
    	model.addAttribute("masterId", masterId);
    	return "/user/userMaintain";
    }
    
    @RequestMapping(value = "/addAudit")
    @ResponseBody
    public Map<String, Object> addAudit(Integer id){
    	userService.addAudit(id);
    	return ResultMap.RESULT(true,"添加成功");
    }
    
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map<String, Object> delete(Integer id){
    	userService.delete(id);
    	return ResultMap.RESULT(true,"删除成功");
    }
    
    @RequestMapping(value = "/deleteMaintain")
    @ResponseBody
    public Map<String, Object> deleteMaintain(Integer masterId,Integer id){
    	userService.deleteMaintain(masterId,id);
    	return ResultMap.RESULT(true,"删除成功");
    }
}
