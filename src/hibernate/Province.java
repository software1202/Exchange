package hibernate;

import java.util.Set;

/**
 * Province entity. @author MyEclipse Persistence Tools
 */
public class Province extends AbstractProvince implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Province() {
	}

	/** minimal constructor */
	public Province(String proId, String proName) {
		super(proId, proName);
	}

	/** full constructor */
	public Province(String proId, String proName, Set cities) {
		super(proId, proName, cities);
	}

}
