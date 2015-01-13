package hibernate;

import java.util.Date;

/**
 * AbstractIndeitemId entity provides the base persistence definition of the
 * IndeitemId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractIndeitemId implements java.io.Serializable {

	// Fields

	private User user;
	private Date time;

	// Constructors

	/** default constructor */
	public AbstractIndeitemId() {
	}

	/** full constructor */
	public AbstractIndeitemId(User user, Date time) {
		this.user = user;
		this.time = time;
	}

	// Property accessors

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractIndeitemId))
			return false;
		AbstractIndeitemId castOther = (AbstractIndeitemId) other;

		return ((this.getUser() == castOther.getUser()) || (this.getUser() != null
				&& castOther.getUser() != null && this.getUser().equals(
				castOther.getUser())))
				&& ((this.getTime() == castOther.getTime()) || (this.getTime() != null
						&& castOther.getTime() != null && this.getTime()
						.equals(castOther.getTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result
				+ (getTime() == null ? 0 : this.getTime().hashCode());
		return result;
	}

}