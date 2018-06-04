package car.erp.dao;

import java.util.List;

import car.erp.model.Goods;
import car.erp.model.query.GoodsQuery;

public interface GoodsMapper {

	public List<Goods> getGoodsList(GoodsQuery query);

	public void saveGoods(Goods goods);
	
	public Goods getOne(Integer id);

	public void delete(Integer id);

	public void updateGoods(Goods goods);

	public List<Goods> loadGoodsByCategory(String goodsCategory);
}
