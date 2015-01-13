package hibernate;

import java.util.Date;

/**
 * Inform entity. @author MyEclipse Persistence Tools
 */
public class Inform extends AbstractInform implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Inform() {
	}

	/** full constructor */
	public Inform(String iid, String content, Date time, String type) {
		super(iid, content, time, type);
	}

}
