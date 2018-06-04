package car.erp.model.query;

import car.erp.model.Page;

public class GoodsQuery extends Page{

	private String queryStr;
	
	private String category;

	public String getQueryStr() {
		return queryStr;
	}

	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
