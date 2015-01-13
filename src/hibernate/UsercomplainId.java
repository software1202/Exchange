package hibernate;

import java.util.Date;

/**
 * UsercomplainId entity. @author MyEclipse Persistence Tools
 */
public class UsercomplainId extends AbstractUsercomplainId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UsercomplainId() {
	}

	/** full constructor */
	public UsercomplainId(User user, User user_1, Date comTime) {
		super(user, user_1, comTime);
	}

}
