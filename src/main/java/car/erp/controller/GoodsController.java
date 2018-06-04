package car.erp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import car.erp.model.Goods;
import car.erp.model.query.GoodsQuery;
import car.erp.service.GoodsService;
import car.erp.utils.ResultMap;

@Controller
@RequestMapping(value="goods")
public class GoodsController {

	@ Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = "index")
    public String index(){
        return "/goods/goodsIndex";
    }
	
	@RequestMapping(value = "addGoodsIndex")
    public String addGoodsIndex(){
        return "/goods/selectGoods";
    }
	
	@RequestMapping(value = "/getList")
    @ResponseBody
    public Map<String, Object> getGoodsList(GoodsQuery query){
    	PageInfo<Goods> result = null;
    	result = goodsService.getGoodsList(query);
        return ResultMap.RESULT(true,"查询成功",result);
    }
	
	@RequestMapping(value = "/getOne")
    @ResponseBody
    public Map<String, Object> getOne(Integer id){
		Goods result = null;
    	result = goodsService.getOne(id);
        return ResultMap.RESULT(true,"查询成功",result);
    }
	
	@RequestMapping(value = "/loadGoodsByCategory")
    @ResponseBody
    public Map<String, Object> loadGoodsByCategory(String goodsCategory){
    	List<Goods> result = goodsService.loadGoodsByCategory(goodsCategory);
        return ResultMap.RESULT(true,"查询成功",result);
    }
	
	@RequestMapping(value = "/loadPageGoodsByCategory")
    @ResponseBody
    public Map<String, Object> loadPageGoodsByCategory(GoodsQuery query){
    	PageInfo<Goods> result = goodsService.loadPageGoodsByCategory(query);
        return ResultMap.RESULT(true,"查询成功",result);
    }
    
    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> saveGoods(Goods goods){
    	goodsService.saveGoods(goods);
        return ResultMap.RESULT(true,"保存成功");
    }
    
    @RequestMapping(value = "/update")
    @ResponseBody
    public Map<String, Object> update(Goods goods){
    	goodsService.update(goods);
        return ResultMap.RESULT(true,"修改成功");
    }
    
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map<String, Object> delete(Integer id){
    	goodsService.delete(id);
        return ResultMap.RESULT(true,"删除成功");
    }
}
