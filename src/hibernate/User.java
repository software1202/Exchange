package hibernate;

import java.util.Date;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userId, District district, String userNickName,
			String userPassword, Integer integration, Date regisDate,
			String address) {
		super(userId, district, userNickName, userPassword, integration,
				regisDate, address);
	}

	/** full constructor */
	public User(String userId, District district, String userNickName,
			String userPassword, Integer integration, Date regisDate,
			String address, String userName, String userSex, Date userBirthday,
			String phoneNumber, String idNum, String status,
			Set chattingsForChatTo, Set relationshipsForOthers,
			Set goodscomplains, Set bookingsForAuserId, Set indeitems,
			Set chattingsForChatFrom, Set relationshipsForMe,
			Set usercomplainsForComedId, Set bookingsForBuserId,
			Set usercomplainsForComId, Set goodses) {
		super(userId, district, userNickName, userPassword, integration,
				regisDate, address, userName, userSex, userBirthday,
				phoneNumber, idNum, status, chattingsForChatTo,
				relationshipsForOthers, goodscomplains, bookingsForAuserId,
				indeitems, chattingsForChatFrom, relationshipsForMe,
				usercomplainsForComedId, bookingsForBuserId,
				usercomplainsForComId, goodses);
	}

}
