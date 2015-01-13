package hibernate;

import java.util.Date;

/**
 * IndeitemId entity. @author MyEclipse Persistence Tools
 */
public class IndeitemId extends AbstractIndeitemId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public IndeitemId() {
	}

	/** full constructor */
	public IndeitemId(User user, Date time) {
		super(user, time);
	}

}
