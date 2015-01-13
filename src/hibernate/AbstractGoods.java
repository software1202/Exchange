package hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractGoods entity provides the base persistence definition of the Goods
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractGoods implements java.io.Serializable {

	// Fields

	private String goodsId;
	private User user;
	private Submenu submenu;
	private String goodsName;
	private String brand;
	private String newDegree;
	private String describe;
	private String image;
	private Set goodscomplains = new HashSet(0);
	private Set bookingsForBgoods = new HashSet(0);
	private Set bookingsForAgoods = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractGoods() {
	}

	/** minimal constructor */
	public AbstractGoods(String goodsId, User user, Submenu submenu,
			String goodsName) {
		this.goodsId = goodsId;
		this.user = user;
		this.submenu = submenu;
		this.goodsName = goodsName;
	}

	/** full constructor */
	public AbstractGoods(String goodsId, User user, Submenu submenu,
			String goodsName, String brand, String newDegree, String describe,
			String image, Set goodscomplains, Set bookingsForBgoods,
			Set bookingsForAgoods) {
		this.goodsId = goodsId;
		this.user = user;
		this.submenu = submenu;
		this.goodsName = goodsName;
		this.brand = brand;
		this.newDegree = newDegree;
		this.describe = describe;
		this.image = image;
		this.goodscomplains = goodscomplains;
		this.bookingsForBgoods = bookingsForBgoods;
		this.bookingsForAgoods = bookingsForAgoods;
	}

	// Property accessors

	public String getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Submenu getSubmenu() {
		return this.submenu;
	}

	public void setSubmenu(Submenu submenu) {
		this.submenu = submenu;
	}

	public String getGoodsName() {
		return this.goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getNewDegree() {
		return this.newDegree;
	}

	public void setNewDegree(String newDegree) {
		this.newDegree = newDegree;
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Set getGoodscomplains() {
		return this.goodscomplains;
	}

	public void setGoodscomplains(Set goodscomplains) {
		this.goodscomplains = goodscomplains;
	}

	public Set getBookingsForBgoods() {
		return this.bookingsForBgoods;
	}

	public void setBookingsForBgoods(Set bookingsForBgoods) {
		this.bookingsForBgoods = bookingsForBgoods;
	}

	public Set getBookingsForAgoods() {
		return this.bookingsForAgoods;
	}

	public void setBookingsForAgoods(Set bookingsForAgoods) {
		this.bookingsForAgoods = bookingsForAgoods;
	}

}