package hibernate;

import java.util.Set;

/**
 * Admini entity. @author MyEclipse Persistence Tools
 */
public class Admini extends AbstractAdmini implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Admini() {
	}

	/** minimal constructor */
	public Admini(String adId, String adName, String adPassword) {
		super(adId, adName, adPassword);
	}

	/** full constructor */
	public Admini(String adId, String adName, String adPassword,
			Set goodscomplains, Set usercomplains) {
		super(adId, adName, adPassword, goodscomplains, usercomplains);
	}

}
