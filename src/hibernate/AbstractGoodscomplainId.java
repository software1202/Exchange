package hibernate;

import java.util.Date;

/**
 * AbstractGoodscomplainId entity provides the base persistence definition of
 * the GoodscomplainId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractGoodscomplainId implements java.io.Serializable {

	// Fields

	private User user;
	private Goods goods;
	private Date comTime;

	// Constructors

	/** default constructor */
	public AbstractGoodscomplainId() {
	}

	/** full constructor */
	public AbstractGoodscomplainId(User user, Goods goods, Date comTime) {
		this.user = user;
		this.goods = goods;
		this.comTime = comTime;
	}

	// Property accessors

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Date getComTime() {
		return this.comTime;
	}

	public void setComTime(Date comTime) {
		this.comTime = comTime;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractGoodscomplainId))
			return false;
		AbstractGoodscomplainId castOther = (AbstractGoodscomplainId) other;

		return ((this.getUser() == castOther.getUser()) || (this.getUser() != null
				&& castOther.getUser() != null && this.getUser().equals(
				castOther.getUser())))
				&& ((this.getGoods() == castOther.getGoods()) || (this
						.getGoods() != null && castOther.getGoods() != null && this
						.getGoods().equals(castOther.getGoods())))
				&& ((this.getComTime() == castOther.getComTime()) || (this
						.getComTime() != null && castOther.getComTime() != null && this
						.getComTime().equals(castOther.getComTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result
				+ (getGoods() == null ? 0 : this.getGoods().hashCode());
		result = 37 * result
				+ (getComTime() == null ? 0 : this.getComTime().hashCode());
		return result;
	}

}