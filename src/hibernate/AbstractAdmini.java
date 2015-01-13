package hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractAdmini entity provides the base persistence definition of the Admini
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAdmini implements java.io.Serializable {

	// Fields

	private String adId;
	private String adName;
	private String adPassword;
	private Set goodscomplains = new HashSet(0);
	private Set usercomplains = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractAdmini() {
	}

	/** minimal constructor */
	public AbstractAdmini(String adId, String adName, String adPassword) {
		this.adId = adId;
		this.adName = adName;
		this.adPassword = adPassword;
	}

	/** full constructor */
	public AbstractAdmini(String adId, String adName, String adPassword,
			Set goodscomplains, Set usercomplains) {
		this.adId = adId;
		this.adName = adName;
		this.adPassword = adPassword;
		this.goodscomplains = goodscomplains;
		this.usercomplains = usercomplains;
	}

	// Property accessors

	public String getAdId() {
		return this.adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
	}

	public String getAdName() {
		return this.adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public String getAdPassword() {
		return this.adPassword;
	}

	public void setAdPassword(String adPassword) {
		this.adPassword = adPassword;
	}

	public Set getGoodscomplains() {
		return this.goodscomplains;
	}

	public void setGoodscomplains(Set goodscomplains) {
		this.goodscomplains = goodscomplains;
	}

	public Set getUsercomplains() {
		return this.usercomplains;
	}

	public void setUsercomplains(Set usercomplains) {
		this.usercomplains = usercomplains;
	}

}