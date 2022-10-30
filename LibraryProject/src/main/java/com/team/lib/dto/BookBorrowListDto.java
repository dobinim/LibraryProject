package com.team.lib.dto;

import java.sql.Timestamp;

public class BookBorrowListDto {

	private String pid;
	private int bookId;
	private String bookTitle;
	private String writer;
	private Timestamp borrowDate;
	private Timestamp dueDate;
	private int borrowId;
	private int borrowNo;
	private String rendre;

	private String type;
	private String keyword;
	
	public BookBorrowListDto() {
		super();
	}

	public BookBorrowListDto(String pid, int bookId, String bookTitle, String writer, Timestamp borrowDate,
			Timestamp dueDate, int borrowId, int borrowNo, String rendre) {
		super();
		this.pid = pid;
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.writer = writer;
		this.borrowDate = borrowDate;
		this.dueDate = dueDate;
		this.borrowId = borrowId;
		this.borrowNo = borrowNo;
		this.rendre = rendre;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getBorrowDate() {
		return borrowDate;
	}

	public void setBorrowDate(Timestamp borrowDate) {
		this.borrowDate = borrowDate;
	}

	public Timestamp getDueDate() {
		return dueDate;
	}

	public void setDueDate(Timestamp dueDate) {
		this.dueDate = dueDate;
	}

	public int getBorrowId() {
		return borrowId;
	}

	public void setBorrowId(int borrowId) {
		this.borrowId = borrowId;
	}

	public int getBorrowNo() {
		return borrowNo;
	}

	public void setBorrowNo(int borrowNo) {
		this.borrowNo = borrowNo;
	}

	public BookBorrowListDto(String pid, int bookId, String bookTitle, String writer, int borrowId) {
		super();
		this.pid = pid;
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.writer = writer;
		this.borrowId = borrowId;
	}

	public String getRendre() {
		return rendre;
	}

	public void setRendre(String rendre) {
		this.rendre = rendre;
	}

	public BookBorrowListDto(int borrowId) {
		super();
		this.borrowId = borrowId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
