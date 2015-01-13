package hibernate;

import java.util.Date;

/**
 * AbstractChatting entity provides the base persistence definition of the
 * Chatting entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractChatting implements java.io.Serializable {

	// Fields

	private String chatId;
	private User userByChatFrom;
	private User userByChatTo;
	private String chatContent;
	private Date chatTime;

	// Constructors

	/** default constructor */
	public AbstractChatting() {
	}

	/** full constructor */
	public AbstractChatting(String chatId, User userByChatFrom,
			User userByChatTo, String chatContent, Date chatTime) {
		this.chatId = chatId;
		this.userByChatFrom = userByChatFrom;
		this.userByChatTo = userByChatTo;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}

	// Property accessors

	public String getChatId() {
		return this.chatId;
	}

	public void setChatId(String chatId) {
		this.chatId = chatId;
	}

	public User getUserByChatFrom() {
		return this.userByChatFrom;
	}

	public void setUserByChatFrom(User userByChatFrom) {
		this.userByChatFrom = userByChatFrom;
	}

	public User getUserByChatTo() {
		return this.userByChatTo;
	}

	public void setUserByChatTo(User userByChatTo) {
		this.userByChatTo = userByChatTo;
	}

	public String getChatContent() {
		return this.chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Date getChatTime() {
		return this.chatTime;
	}

	public void setChatTime(Date chatTime) {
		this.chatTime = chatTime;
	}

}