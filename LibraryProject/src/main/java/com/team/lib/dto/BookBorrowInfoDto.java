package com.team.lib.dto;

public class BookBorrowInfoDto {

	private int borrowId;
	private String organName; 
	private String referenceRoom;
	private String callNum;
	private String regiNum;
	private String bookPossible;
	private String booking;
	private int bookId;
	
	public BookBorrowInfoDto() {
		super();
	}

	public BookBorrowInfoDto(int borrowId, String organName, String referenceRoom, String callNum, String regiNum,
			String bookPossible, String booking, int bookId) {
		super();
		this.borrowId = borrowId;
		this.organName = organName;
		this.referenceRoom = referenceRoom;
		this.callNum = callNum;
		this.regiNum = regiNum;
		this.bookPossible = bookPossible;
		this.booking = booking;
		this.bookId = bookId;
	}
	
	public BookBorrowInfoDto(String organName, String referenceRoom, String callNum, String regiNum, String bookPossible,
			String booking, int bookId) {
		super();
		this.organName = organName;
		this.referenceRoom = referenceRoom;
		this.callNum = callNum;
		this.regiNum = regiNum;
		this.bookPossible = bookPossible;
		this.booking = booking;
		this.bookId = bookId;
	}

	public int getBorrowId() {
		return borrowId;
	}

	public void setBorrowId(int borrowId) {
		this.borrowId = borrowId;
	}

	public String getOrganName() {
		return organName;
	}

	public void setOrganName(String organName) {
		this.organName = organName;
	}

	public String getReferenceRoom() {
		return referenceRoom;
	}

	public void setReferenceRoom(String referenceRoom) {
		this.referenceRoom = referenceRoom;
	}

	public String getCallNum() {
		return callNum;
	}

	public void setCallNum(String callNum) {
		this.callNum = callNum;
	}

	public String getRegiNum() {
		return regiNum;
	}

	public void setRegiNum(String regiNum) {
		this.regiNum = regiNum;
	}

	public String getBookPossible() {
		return bookPossible;
	}

	public void setBookPossible(String bookPossible) {
		this.bookPossible = bookPossible;
	}

	public String getBooking() {
		return booking;
	}

	public void setBooking(String booking) {
		this.booking = booking;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public BookBorrowInfoDto(int borrowId) {
		super();
		this.borrowId = borrowId;
	}

}
