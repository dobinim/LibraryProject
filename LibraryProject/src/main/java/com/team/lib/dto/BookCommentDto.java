package com.team.lib.dto;

import java.sql.Timestamp;

public class BookCommentDto {
	private int commentNo;
	private String commentWriter;
	private String commentContent;
	private Timestamp commentDate;
	private int bookId;
	
	public BookCommentDto() {
		super();
	}

	public BookCommentDto(int commentNo, String commentWriter, String commentContent, Timestamp commentDate,
			int bookId) {
		super();
		this.commentNo = commentNo;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.bookId = bookId;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public BookCommentDto(String commentWriter, String commentContent, int bookId) {
		super();
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.bookId = bookId;
	}

	public BookCommentDto(int commentNo) {
		super();
		this.commentNo = commentNo;
	}

	public BookCommentDto(int commentNo, int bookId) {
		super();
		this.commentNo = commentNo;
		this.bookId = bookId;
	}
}
