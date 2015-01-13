package hibernate;

import java.util.Date;

/**
 * AbstractInform entity provides the base persistence definition of the Inform
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractInform implements java.io.Serializable {

	// Fields

	private String iid;
	private String content;
	private Date time;
	private String type;

	// Constructors

	/** default constructor */
	public AbstractInform() {
	}

	/** full constructor */
	public AbstractInform(String iid, String content, Date time, String type) {
		this.iid = iid;
		this.content = content;
		this.time = time;
		this.type = type;
	}

	// Property accessors

	public String getIid() {
		return this.iid;
	}

	public void setIid(String iid) {
		this.iid = iid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}