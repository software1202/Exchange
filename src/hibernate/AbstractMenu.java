package hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractMenu entity provides the base persistence definition of the Menu
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMenu implements java.io.Serializable {

	// Fields

	private String menuId;
	private String menuName;
	private Set submenus = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractMenu() {
	}

	/** minimal constructor */
	public AbstractMenu(String menuId, String menuName) {
		this.menuId = menuId;
		this.menuName = menuName;
	}

	/** full constructor */
	public AbstractMenu(String menuId, String menuName, Set submenus) {
		this.menuId = menuId;
		this.menuName = menuName;
		this.submenus = submenus;
	}

	// Property accessors

	public String getMenuId() {
		return this.menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Set getSubmenus() {
		return this.submenus;
	}

	public void setSubmenus(Set submenus) {
		this.submenus = submenus;
	}

}