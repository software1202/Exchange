package hibernate;

import java.util.Date;

/**
 * Chatting entity. @author MyEclipse Persistence Tools
 */
public class Chatting extends AbstractChatting implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Chatting() {
	}

	/** full constructor */
	public Chatting(String chatId, User userByChatFrom, User userByChatTo,
			String chatContent, Date chatTime) {
		super(chatId, userByChatFrom, userByChatTo, chatContent, chatTime);
	}

}
