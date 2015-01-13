package hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractCity entity provides the base persistence definition of the City
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCity implements java.io.Serializable {

	// Fields

	private String cityId;
	private Province province;
	private String cityName;
	private Set districts = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractCity() {
	}

	/** minimal constructor */
	public AbstractCity(String cityId, Province province, String cityName) {
		this.cityId = cityId;
		this.province = province;
		this.cityName = cityName;
	}

	/** full constructor */
	public AbstractCity(String cityId, Province province, String cityName,
			Set districts) {
		this.cityId = cityId;
		this.province = province;
		this.cityName = cityName;
		this.districts = districts;
	}

	// Property accessors

	public String getCityId() {
		return this.cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public Province getProvince() {
		return this.province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Set getDistricts() {
		return this.districts;
	}

	public void setDistricts(Set districts) {
		this.districts = districts;
	}

}