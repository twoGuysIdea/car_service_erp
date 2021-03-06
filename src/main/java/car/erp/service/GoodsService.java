package car.erp.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import car.erp.model.Goods;
import car.erp.model.query.GoodsQuery;

public interface GoodsService {

	public PageInfo<Goods> getGoodsList(GoodsQuery query);

	public void saveGoods(Goods goods);

	public Goods getOne(Integer id);

	public void delete(Integer id);

	public void update(Goods goods);

	public List<Goods> loadGoodsByCategory(String goodsCategory);

	public PageInfo<Goods> loadPageGoodsByCategory(GoodsQuery query);
}
