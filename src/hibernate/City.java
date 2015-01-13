package hibernate;

import java.util.Set;

/**
 * City entity. @author MyEclipse Persistence Tools
 */
public class City extends AbstractCity implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public City() {
	}

	/** minimal constructor */
	public City(String cityId, Province province, String cityName) {
		super(cityId, province, cityName);
	}

	/** full constructor */
	public City(String cityId, Province province, String cityName, Set districts) {
		super(cityId, province, cityName, districts);
	}

}
