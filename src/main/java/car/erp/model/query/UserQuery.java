package car.erp.model.query;

import car.erp.model.Page;

public class UserQuery extends Page{

	private String ownerName;
	
	private String carNum;
	
	private String startBirthday;
	
	private String endBirthday;
	
	private Integer changeQuery;
	
	private String startSafeDate;
	
	private String endSafeDate;
	
	private String startAuditDate;
	
	private String endAuditDate;

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getStartBirthday() {
		return startBirthday;
	}

	public void setStartBirthday(String startBirthday) {
		this.startBirthday = startBirthday;
	}

	public String getEndBirthday() {
		return endBirthday;
	}

	public void setEndBirthday(String endBirthday) {
		this.endBirthday = endBirthday;
	}

	public Integer getChangeQuery() {
		return changeQuery;
	}

	public void setChangeQuery(Integer changeQuery) {
		this.changeQuery = changeQuery;
	}

	public String getStartSafeDate() {
		return startSafeDate;
	}

	public void setStartSafeDate(String startSafeDate) {
		this.startSafeDate = startSafeDate;
	}

	public String getEndSafeDate() {
		return endSafeDate;
	}

	public void setEndSafeDate(String endSafeDate) {
		this.endSafeDate = endSafeDate;
	}

	public String getStartAuditDate() {
		return startAuditDate;
	}

	public void setStartAuditDate(String startAuditDate) {
		this.startAuditDate = startAuditDate;
	}

	public String getEndAuditDate() {
		return endAuditDate;
	}

	public void setEndAuditDate(String endAuditDate) {
		this.endAuditDate = endAuditDate;
	}
	
}
