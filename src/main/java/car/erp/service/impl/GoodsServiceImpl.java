package car.erp.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import car.erp.dao.GoodsMapper;
import car.erp.model.Goods;
import car.erp.model.query.GoodsQuery;
import car.erp.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public PageInfo<Goods> getGoodsList(GoodsQuery query) {
		PageHelper.startPage(query.getPageNumber(), query.getPageSize());
		return new PageInfo<Goods>(goodsMapper.getGoodsList(query));
	}

	@Override
	public void saveGoods(Goods goods) {
		goodsMapper.saveGoods(goods);
	}

	@Override
	public Goods getOne(Integer id) {
		return goodsMapper.getOne(id);
	}

	@Override
	public void delete(Integer id) {
		goodsMapper.delete(id);
	}

	@Override
	public void update(Goods goods) {
		goodsMapper.updateGoods(goods);
	}

	@Override
	public List<Goods> loadGoodsByCategory(String goodsCategory) {
		return goodsMapper.loadGoodsByCategory(goodsCategory);
	}

	@Override
	public PageInfo<Goods> loadPageGoodsByCategory(GoodsQuery query) {
		PageHelper.startPage(query.getPageNumber(), query.getPageSize());
		List<Goods> list = new ArrayList<>();
		if(StringUtils.isEmpty(query.getCategory())) {
			list = goodsMapper.getGoodsList(query);
		}else {
			list = goodsMapper.loadGoodsByCategory(query.getCategory());
		}
		return new PageInfo<Goods>(list);
	}

}
