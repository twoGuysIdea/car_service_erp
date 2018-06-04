package car.erp.model;


import java.util.Date;

import car.erp.utils.jdbcUtils.annotation.ClassPro;
import car.erp.utils.jdbcUtils.annotation.FieldPro;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@ClassPro(tableName="car_owner")
public class User {


    @FieldPro(JDBCName = "id")
    private Integer id;

    /**
     * 用户名
     */
    @FieldPro(JDBCName = "user_name")
    private String userName;

    /**
     * 车牌号
     */
    @FieldPro(JDBCName = "car_num")
    private String carNum;

    /**
     * 手机号码
     */
    @FieldPro(JDBCName = "phone")
    private Long phone;
    
    /**
     * 保养次数
     */
    private Integer maintainCount;
    
    /**
     * 购车时间
     */
    @FieldPro(JDBCName = "buy_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
    private Date buyDate;

    /**
     * 年审时间
     */
    @FieldPro(JDBCName = "safe_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
    private Date safeDate;

    /**
     * 保险时间
     */
    @FieldPro(JDBCName = "audit_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
    private Date auditDate;

    /**
     * 生日
     */
    @FieldPro(JDBCName = "birthday")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
    private Date birthday;
    
    /**
     * 保养时间
     */
    @FieldPro(JDBCName = "maintain_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
    private Date maintainDate;

    /**
     * 是否购保
     */
    @FieldPro(JDBCName = "is_audit")
    private Integer isAudit;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCarNum() {
        return carNum;
    }

    public void setCarNum(String carNum) {
        this.carNum = carNum;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public Date getSafeDate() {
        return safeDate;
    }

    public void setSafeDate(Date safeDate) {
        this.safeDate = safeDate;
    }

    public Date getAuditDate() {
        return auditDate;
    }

    public void setAuditDate(Date auditDate) {
        this.auditDate = auditDate;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

	public Date getMaintainDate() {
		return maintainDate;
	}

	public void setMaintainDate(Date maintainDate) {
		this.maintainDate = maintainDate;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public Integer getMaintainCount() {
		return maintainCount;
	}

	public void setMaintainCount(Integer maintainCount) {
		this.maintainCount = maintainCount;
	}

	public Integer getIsAudit() {
		return isAudit;
	}

	public void setIsAudit(Integer isAudit) {
		this.isAudit = isAudit;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", carNum=" + carNum + ", phone=" + phone
				+ ", maintainCount=" + maintainCount + ", buyDate=" + buyDate + ", safeDate=" + safeDate
				+ ", auditDate=" + auditDate + ", birthday=" + birthday + ", maintainDate=" + maintainDate
				+ ", isAudit=" + isAudit + "]";
	}

	
}
