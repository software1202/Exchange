package hibernate;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable {

	// Fields

	private String userId;
	private District district;
	private String userNickName;
	private String userPassword;
	private Integer integration;
	private Date regisDate;
	private String address;
	private String userName;
	private String userSex;
	private Date userBirthday;
	private String phoneNumber;
	private String idNum;
	private Set chattingsForChatTo = new HashSet(0);
	private Set relationshipsForOthers = new HashSet(0);
	private Set goodscomplains = new HashSet(0);
	private Set bookingsForAuserId = new HashSet(0);
	private Set indeitems = new HashSet(0);
	private Set chattingsForChatFrom = new HashSet(0);
	private Set relationshipsForMe = new HashSet(0);
	private Set usercomplainsForComedId = new HashSet(0);
	private Set bookingsForBuserId = new HashSet(0);
	private Set usercomplainsForComId = new HashSet(0);
	private Set goodses = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractUser() {
	}

	/** minimal constructor */
	public AbstractUser(String userId, District district, String userNickName,
			String userPassword, Integer integration, Date regisDate,
			String address) {
		this.userId = userId;
		this.district = district;
		this.userNickName = userNickName;
		this.userPassword = userPassword;
		this.integration = integration;
		this.regisDate = regisDate;
		this.address = address;
	}

	/** full constructor */
	public AbstractUser(String userId, District district, String userNickName,
			String userPassword, Integer integration, Date regisDate,
			String address, String userName, String userSex, Date userBirthday,
			String phoneNumber, String idNum, Set chattingsForChatTo,
			Set relationshipsForOthers, Set goodscomplains,
			Set bookingsForAuserId, Set indeitems, Set chattingsForChatFrom,
			Set relationshipsForMe, Set usercomplainsForComedId,
			Set bookingsForBuserId, Set usercomplainsForComId, Set goodses) {
		this.userId = userId;
		this.district = district;
		this.userNickName = userNickName;
		this.userPassword = userPassword;
		this.integration = integration;
		this.regisDate = regisDate;
		this.address = address;
		this.userName = userName;
		this.userSex = userSex;
		this.userBirthday = userBirthday;
		this.phoneNumber = phoneNumber;
		this.idNum = idNum;
		this.chattingsForChatTo = chattingsForChatTo;
		this.relationshipsForOthers = relationshipsForOthers;
		this.goodscomplains = goodscomplains;
		this.bookingsForAuserId = bookingsForAuserId;
		this.indeitems = indeitems;
		this.chattingsForChatFrom = chattingsForChatFrom;
		this.relationshipsForMe = relationshipsForMe;
		this.usercomplainsForComedId = usercomplainsForComedId;
		this.bookingsForBuserId = bookingsForBuserId;
		this.usercomplainsForComId = usercomplainsForComId;
		this.goodses = goodses;
	}

	// Property accessors

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public District getDistrict() {
		return this.district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getUserNickName() {
		return this.userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Integer getIntegration() {
		return this.integration;
	}

	public void setIntegration(Integer integration) {
		this.integration = integration;
	}

	public Date getRegisDate() {
		return this.regisDate;
	}

	public void setRegisDate(Date regisDate) {
		this.regisDate = regisDate;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSex() {
		return this.userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public Date getUserBirthday() {
		return this.userBirthday;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getIdNum() {
		return this.idNum;
	}

	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}

	public Set getChattingsForChatTo() {
		return this.chattingsForChatTo;
	}

	public void setChattingsForChatTo(Set chattingsForChatTo) {
		this.chattingsForChatTo = chattingsForChatTo;
	}

	public Set getRelationshipsForOthers() {
		return this.relationshipsForOthers;
	}

	public void setRelationshipsForOthers(Set relationshipsForOthers) {
		this.relationshipsForOthers = relationshipsForOthers;
	}

	public Set getGoodscomplains() {
		return this.goodscomplains;
	}

	public void setGoodscomplains(Set goodscomplains) {
		this.goodscomplains = goodscomplains;
	}

	public Set getBookingsForAuserId() {
		return this.bookingsForAuserId;
	}

	public void setBookingsForAuserId(Set bookingsForAuserId) {
		this.bookingsForAuserId = bookingsForAuserId;
	}

	public Set getIndeitems() {
		return this.indeitems;
	}

	public void setIndeitems(Set indeitems) {
		this.indeitems = indeitems;
	}

	public Set getChattingsForChatFrom() {
		return this.chattingsForChatFrom;
	}

	public void setChattingsForChatFrom(Set chattingsForChatFrom) {
		this.chattingsForChatFrom = chattingsForChatFrom;
	}

	public Set getRelationshipsForMe() {
		return this.relationshipsForMe;
	}

	public void setRelationshipsForMe(Set relationshipsForMe) {
		this.relationshipsForMe = relationshipsForMe;
	}

	public Set getUsercomplainsForComedId() {
		return this.usercomplainsForComedId;
	}

	public void setUsercomplainsForComedId(Set usercomplainsForComedId) {
		this.usercomplainsForComedId = usercomplainsForComedId;
	}

	public Set getBookingsForBuserId() {
		return this.bookingsForBuserId;
	}

	public void setBookingsForBuserId(Set bookingsForBuserId) {
		this.bookingsForBuserId = bookingsForBuserId;
	}

	public Set getUsercomplainsForComId() {
		return this.usercomplainsForComId;
	}

	public void setUsercomplainsForComId(Set usercomplainsForComId) {
		this.usercomplainsForComId = usercomplainsForComId;
	}

	public Set getGoodses() {
		return this.goodses;
	}

	public void setGoodses(Set goodses) {
		this.goodses = goodses;
	}

}