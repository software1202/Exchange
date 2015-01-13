package hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractProvince entity provides the base persistence definition of the
 * Province entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractProvince implements java.io.Serializable {

	// Fields

	private String proId;
	private String proName;
	private Set cities = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractProvince() {
	}

	/** minimal constructor */
	public AbstractProvince(String proId, String proName) {
		this.proId = proId;
		this.proName = proName;
	}

	/** full constructor */
	public AbstractProvince(String proId, String proName, Set cities) {
		this.proId = proId;
		this.proName = proName;
		this.cities = cities;
	}

	// Property accessors

	public String getProId() {
		return this.proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getProName() {
		return this.proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public Set getCities() {
		return this.cities;
	}

	public void setCities(Set cities) {
		this.cities = cities;
	}

}