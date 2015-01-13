package hibernate;

import java.util.Date;

/**
 * Booking entity. @author MyEclipse Persistence Tools
 */
public class Booking extends AbstractBooking implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Booking() {
	}

	/** minimal constructor */
	public Booking(String bookingId, User userByBuserId, User userByAuserId,
			String astatus, String bstatus, Date atime) {
		super(bookingId, userByBuserId, userByAuserId, astatus, bstatus, atime);
	}

	/** full constructor */
	public Booking(String bookingId, Goods goodsByAgoods, User userByBuserId,
			User userByAuserId, Goods goodsByBgoods, String astatus,
			String bstatus, Integer deposit, Date atime, Date btime,
			Date stime, Date ftime, String exMethod, String exStatus,
			String comments, Integer comLevel) {
		super(bookingId, goodsByAgoods, userByBuserId, userByAuserId,
				goodsByBgoods, astatus, bstatus, deposit, atime, btime, stime,
				ftime, exMethod, exStatus, comments, comLevel);
	}

}
