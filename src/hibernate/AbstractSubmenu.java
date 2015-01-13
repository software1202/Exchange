package hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractSubmenu entity provides the base persistence definition of the
 * Submenu entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSubmenu implements java.io.Serializable {

	// Fields

	private String subMenuId;
	private Menu menu;
	private String subMenuName;
	private Set goodses = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractSubmenu() {
	}

	/** minimal constructor */
	public AbstractSubmenu(String subMenuId, Menu menu, String subMenuName) {
		this.subMenuId = subMenuId;
		this.menu = menu;
		this.subMenuName = subMenuName;
	}

	/** full constructor */
	public AbstractSubmenu(String subMenuId, Menu menu, String subMenuName,
			Set goodses) {
		this.subMenuId = subMenuId;
		this.menu = menu;
		this.subMenuName = subMenuName;
		this.goodses = goodses;
	}

	// Property accessors

	public String getSubMenuId() {
		return this.subMenuId;
	}

	public void setSubMenuId(String subMenuId) {
		this.subMenuId = subMenuId;
	}

	public Menu getMenu() {
		return this.menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getSubMenuName() {
		return this.subMenuName;
	}

	public void setSubMenuName(String subMenuName) {
		this.subMenuName = subMenuName;
	}

	public Set getGoodses() {
		return this.goodses;
	}

	public void setGoodses(Set goodses) {
		this.goodses = goodses;
	}

}