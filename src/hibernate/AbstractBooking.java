package hibernate;

import java.util.Date;

/**
 * AbstractBooking entity provides the base persistence definition of the
 * Booking entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractBooking implements java.io.Serializable {

	// Fields

	private String bookingId;
	private Goods goodsByAgoods;
	private User userByBuserId;
	private User userByAuserId;
	private Goods goodsByBgoods;
	private String astatus;
	private String bstatus;
	private Integer deposit;
	private Date atime;
	private Date btime;
	private Date stime;
	private Date ftime;
	private String exMethod;
	private String exStatus;
	private String comments;
	private Integer comLevel;

	// Constructors

	/** default constructor */
	public AbstractBooking() {
	}

	/** minimal constructor */
	public AbstractBooking(String bookingId, User userByBuserId,
			User userByAuserId, String astatus, String bstatus, Date atime) {
		this.bookingId = bookingId;
		this.userByBuserId = userByBuserId;
		this.userByAuserId = userByAuserId;
		this.astatus = astatus;
		this.bstatus = bstatus;
		this.atime = atime;
	}

	/** full constructor */
	public AbstractBooking(String bookingId, Goods goodsByAgoods,
			User userByBuserId, User userByAuserId, Goods goodsByBgoods,
			String astatus, String bstatus, Integer deposit, Date atime,
			Date btime, Date stime, Date ftime, String exMethod,
			String exStatus, String comments, Integer comLevel) {
		this.bookingId = bookingId;
		this.goodsByAgoods = goodsByAgoods;
		this.userByBuserId = userByBuserId;
		this.userByAuserId = userByAuserId;
		this.goodsByBgoods = goodsByBgoods;
		this.astatus = astatus;
		this.bstatus = bstatus;
		this.deposit = deposit;
		this.atime = atime;
		this.btime = btime;
		this.stime = stime;
		this.ftime = ftime;
		this.exMethod = exMethod;
		this.exStatus = exStatus;
		this.comments = comments;
		this.comLevel = comLevel;
	}

	// Property accessors

	public String getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public Goods getGoodsByAgoods() {
		return this.goodsByAgoods;
	}

	public void setGoodsByAgoods(Goods goodsByAgoods) {
		this.goodsByAgoods = goodsByAgoods;
	}

	public User getUserByBuserId() {
		return this.userByBuserId;
	}

	public void setUserByBuserId(User userByBuserId) {
		this.userByBuserId = userByBuserId;
	}

	public User getUserByAuserId() {
		return this.userByAuserId;
	}

	public void setUserByAuserId(User userByAuserId) {
		this.userByAuserId = userByAuserId;
	}

	public Goods getGoodsByBgoods() {
		return this.goodsByBgoods;
	}

	public void setGoodsByBgoods(Goods goodsByBgoods) {
		this.goodsByBgoods = goodsByBgoods;
	}

	public String getAstatus() {
		return this.astatus;
	}

	public void setAstatus(String astatus) {
		this.astatus = astatus;
	}

	public String getBstatus() {
		return this.bstatus;
	}

	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}

	public Integer getDeposit() {
		return this.deposit;
	}

	public void setDeposit(Integer deposit) {
		this.deposit = deposit;
	}

	public Date getAtime() {
		return this.atime;
	}

	public void setAtime(Date atime) {
		this.atime = atime;
	}

	public Date getBtime() {
		return this.btime;
	}

	public void setBtime(Date btime) {
		this.btime = btime;
	}

	public Date getStime() {
		return this.stime;
	}

	public void setStime(Date stime) {
		this.stime = stime;
	}

	public Date getFtime() {
		return this.ftime;
	}

	public void setFtime(Date ftime) {
		this.ftime = ftime;
	}

	public String getExMethod() {
		return this.exMethod;
	}

	public void setExMethod(String exMethod) {
		this.exMethod = exMethod;
	}

	public String getExStatus() {
		return this.exStatus;
	}

	public void setExStatus(String exStatus) {
		this.exStatus = exStatus;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Integer getComLevel() {
		return this.comLevel;
	}

	public void setComLevel(Integer comLevel) {
		this.comLevel = comLevel;
	}

}