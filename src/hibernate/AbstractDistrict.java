package hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractDistrict entity provides the base persistence definition of the
 * District entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDistrict implements java.io.Serializable {

	// Fields

	private String disId;
	private City city;
	private String disName;
	private Set users = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractDistrict() {
	}

	/** minimal constructor */
	public AbstractDistrict(String disId, City city, String disName) {
		this.disId = disId;
		this.city = city;
		this.disName = disName;
	}

	/** full constructor */
	public AbstractDistrict(String disId, City city, String disName, Set users) {
		this.disId = disId;
		this.city = city;
		this.disName = disName;
		this.users = users;
	}

	// Property accessors

	public String getDisId() {
		return this.disId;
	}

	public void setDisId(String disId) {
		this.disId = disId;
	}

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public String getDisName() {
		return this.disName;
	}

	public void setDisName(String disName) {
		this.disName = disName;
	}

	public Set getUsers() {
		return this.users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

}