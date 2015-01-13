package hibernate;

import java.util.Set;

/**
 * District entity. @author MyEclipse Persistence Tools
 */
public class District extends AbstractDistrict implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public District() {
	}

	/** minimal constructor */
	public District(String disId, City city, String disName) {
		super(disId, city, disName);
	}

	/** full constructor */
	public District(String disId, City city, String disName, Set users) {
		super(disId, city, disName, users);
	}

}
