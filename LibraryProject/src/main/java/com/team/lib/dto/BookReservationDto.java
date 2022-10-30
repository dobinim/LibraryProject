package com.team.lib.dto;

import java.sql.Timestamp;

public class BookReservationDto {

	private int reservationNo;
	private String reservationTitle;
	private String reservationUser;
	private int bookId;
	private int borrowId;
	private Timestamp reservationDate;
	private String callNum;
	private String bookPossible;
	private String writer;
	
	private String user_id;
	
	public BookReservationDto() {
		super();
	}

	public BookReservationDto(int reservationNo, String reservationTitle, String reservationUser, int bookId,
			int borrowId, Timestamp reservationDate, String callNum, String bookPossible, String writer) {
		super();
		this.reservationNo = reservationNo;
		this.reservationTitle = reservationTitle;
		this.reservationUser = reservationUser;
		this.bookId = bookId;
		this.borrowId = borrowId;
		this.reservationDate = reservationDate;
		this.callNum = callNum;
		this.bookPossible = bookPossible;
		this.writer = writer;
	}

	public BookReservationDto(String reservationTitle, String reservationUser, int bookId, int borrowId, String callNum,
			String bookPossible, String writer) {
		super();
		this.reservationTitle = reservationTitle;
		this.reservationUser = reservationUser;
		this.bookId = bookId;
		this.borrowId = borrowId;
		this.callNum = callNum;
		this.bookPossible = bookPossible;
		this.writer = writer;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public String getReservationTitle() {
		return reservationTitle;
	}

	public void setReservationTitle(String reservationTitle) {
		this.reservationTitle = reservationTitle;
	}

	public String getReservationUser() {
		return reservationUser;
	}

	public void setReservationUser(String reservationUser) {
		this.reservationUser = reservationUser;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getBorrowId() {
		return borrowId;
	}

	public void setBorrowId(int borrowId) {
		this.borrowId = borrowId;
	}

	public Timestamp getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Timestamp reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getCallNum() {
		return callNum;
	}

	public void setCallNum(String callNum) {
		this.callNum = callNum;
	}

	public String getBookPossible() {
		return bookPossible;
	}

	public void setBookPossible(String bookPossible) {
		this.bookPossible = bookPossible;
	}

	public BookReservationDto(int borrowId) {
		super();
		this.borrowId = borrowId;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public BookReservationDto(String user_id) {
		super();
		this.user_id = user_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

}
