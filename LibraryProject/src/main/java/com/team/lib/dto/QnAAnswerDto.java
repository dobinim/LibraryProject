package com.team.lib.dto;

import java.sql.Timestamp;

public class QnAAnswerDto {
	
	private int answerNo;
	private String answerWriter;
	private String answerContent;
	private Timestamp answerDate;
	private int qnaNo;
	
	public QnAAnswerDto() {
		super();
	}
	
	public QnAAnswerDto(int answerNo, String answerWriter, String answerContent, Timestamp answerDate, int qnaNo) {
		super();
		this.answerNo = answerNo;
		this.answerWriter = answerWriter;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
		this.qnaNo = qnaNo;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public String getAnswerWriter() {
		return answerWriter;
	}

	public void setAnswerWriter(String answerWriter) {
		this.answerWriter = answerWriter;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Timestamp getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Timestamp answerDate) {
		this.answerDate = answerDate;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public QnAAnswerDto(String answerWriter, String answerContent, int qnaNo) {
		super();
		this.answerWriter = answerWriter;
		this.answerContent = answerContent;
		this.qnaNo = qnaNo;
	}
}
