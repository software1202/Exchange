package hibernate;

import java.util.Date;

/**
 * AbstractUsercomplainId entity provides the base persistence definition of the
 * UsercomplainId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUsercomplainId implements java.io.Serializable {

	// Fields

	private User user;
	private User user_1;
	private Date comTime;

	// Constructors

	/** default constructor */
	public AbstractUsercomplainId() {
	}

	/** full constructor */
	public AbstractUsercomplainId(User user, User user_1, Date comTime) {
		this.user = user;
		this.user_1 = user_1;
		this.comTime = comTime;
	}

	// Property accessors

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser_1() {
		return this.user_1;
	}

	public void setUser_1(User user_1) {
		this.user_1 = user_1;
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
		if (!(other instanceof AbstractUsercomplainId))
			return false;
		AbstractUsercomplainId castOther = (AbstractUsercomplainId) other;

		return ((this.getUser() == castOther.getUser()) || (this.getUser() != null
				&& castOther.getUser() != null && this.getUser().equals(
				castOther.getUser())))
				&& ((this.getUser_1() == castOther.getUser_1()) || (this
						.getUser_1() != null && castOther.getUser_1() != null && this
						.getUser_1().equals(castOther.getUser_1())))
				&& ((this.getComTime() == castOther.getComTime()) || (this
						.getComTime() != null && castOther.getComTime() != null && this
						.getComTime().equals(castOther.getComTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result
				+ (getUser_1() == null ? 0 : this.getUser_1().hashCode());
		result = 37 * result
				+ (getComTime() == null ? 0 : this.getComTime().hashCode());
		return result;
	}

}