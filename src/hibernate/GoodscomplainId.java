package hibernate;

import java.util.Date;

/**
 * GoodscomplainId entity. @author MyEclipse Persistence Tools
 */
public class GoodscomplainId extends AbstractGoodscomplainId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public GoodscomplainId() {
	}

	/** full constructor */
	public GoodscomplainId(User user, Goods goods, Date comTime) {
		super(user, goods, comTime);
	}

}
