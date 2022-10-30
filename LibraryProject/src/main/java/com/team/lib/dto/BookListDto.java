package com.team.lib.dto;

public class BookListDto {

	private int bookId;
	private String bookTitle;
	private String bookOriTitle;
	private String writer;
	private String bookType;
	private String publisher;
	private String form;
	private String isbn;
	private String img;
	private String bookContent;
	private String bookWriter;
	private String bookIndex;
	private String genre;
	private String year;
	private int recommend;
	private int bestseller;
	
	private String type;
	private String keyword;
	
	// top-menu의 검색창
	private String mainkeyword;
	
	// 소장자료 검색
	private String srchtype1;
	private String srchtype2;
	private String srchtype3;
	private String srchkeyword1;
	private String srchkeyword2;
	private String srchkeyword3;
	
	private String[] genreList;



	public BookListDto() {
		super();
	}
	
	public BookListDto(int bookId, String bookTitle, String bookOriTitle, String writer, String bookType,
			String publisher, String form, String isbn, String img, String bookContent, String bookWriter,
			String bookIndex, String genre, String year, int recommend, int bestseller, String type, String keyword,
			String mainkeyword, String srchtype1, String srchtype2, String srchtype3, String srchkeyword1,
			String srchkeyword2, String srchkeyword3, String[] genreList) {
		super();
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.bookOriTitle = bookOriTitle;
		this.writer = writer;
		this.bookType = bookType;
		this.publisher = publisher;
		this.form = form;
		this.isbn = isbn;
		this.img = img;
		this.bookContent = bookContent;
		this.bookWriter = bookWriter;
		this.bookIndex = bookIndex;
		this.genre = genre;
		this.year = year;
		this.recommend = recommend;
		this.bestseller = bestseller;
		this.type = type;
		this.keyword = keyword;
		this.mainkeyword = mainkeyword;
		this.srchtype1 = srchtype1;
		this.srchtype2 = srchtype2;
		this.srchtype3 = srchtype3;
		this.srchkeyword1 = srchkeyword1;
		this.srchkeyword2 = srchkeyword2;
		this.srchkeyword3 = srchkeyword3;
		this.genreList = genreList;
	}

	// 소장 자료 검색창 
	public BookListDto(int bookId, String bookTitle, String bookOriTitle, String writer, String bookType,
			String publisher, String form, String isbn, String img, String bookContent, String bookWriter,
			String bookIndex, String genre, String year, int recommend, int bestseller, String type, String keyword,
			String mainkeyword, String srchtype1, String srchtype2, String srchtype3, String srchkeyword1,
			String srchkeyword2, String srchkeyword3) {
		super();
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.bookOriTitle = bookOriTitle;
		this.writer = writer;
		this.bookType = bookType;
		this.publisher = publisher;
		this.form = form;
		this.isbn = isbn;
		this.img = img;
		this.bookContent = bookContent;
		this.bookWriter = bookWriter;
		this.bookIndex = bookIndex;
		this.genre = genre;
		this.year = year;
		this.recommend = recommend;
		this.bestseller = bestseller;
		this.type = type;
		this.keyword = keyword;
		this.mainkeyword = mainkeyword;
		this.srchtype1 = srchtype1;
		this.srchtype2 = srchtype2;
		this.srchtype3 = srchtype3;
		this.srchkeyword1 = srchkeyword1;
		this.srchkeyword2 = srchkeyword2;
		this.srchkeyword3 = srchkeyword3;
	}


	// top-menu의 검색창을 위한 생성자
	public BookListDto(int bookId, String bookTitle, String bookOriTitle, String writer, String bookType,
			String publisher, String form, String isbn, String img, String bookContent, String bookWriter,
			String bookIndex, String genre, String year, int recommend, int bestseller, String type, String keyword,
			String mainkeyword) {
		super();
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.bookOriTitle = bookOriTitle;
		this.writer = writer;
		this.bookType = bookType;
		this.publisher = publisher;
		this.form = form;
		this.isbn = isbn;
		this.img = img;
		this.bookContent = bookContent;
		this.bookWriter = bookWriter;
		this.bookIndex = bookIndex;
		this.genre = genre;
		this.year = year;
		this.recommend = recommend;
		this.bestseller = bestseller;
		this.type = type;
		this.keyword = keyword;
		this.mainkeyword = mainkeyword;
	}



	public BookListDto(int bookId, String bookTitle, String bookOriTitle, String writer, String bookType,
			String publisher, String form, String isbn, String img, String bookContent, String bookWriter,
			String bookIndex, String genre, String year, int recommend, int bestseller) {
		super();
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.bookOriTitle = bookOriTitle;
		this.writer = writer;
		this.bookType = bookType;
		this.publisher = publisher;
		this.form = form;
		this.isbn = isbn;
		this.img = img;
		this.bookContent = bookContent;
		this.bookWriter = bookWriter;
		this.bookIndex = bookIndex;
		this.genre = genre;
		this.year = year;
		this.recommend = recommend;
		this.bestseller = bestseller;
	}

	public BookListDto(int bookId) {
		super();
		this.bookId = bookId;
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

	public String getBookOriTitle() {
		return bookOriTitle;
	}

	public void setBookOriTitle(String bookOriTitle) {
		this.bookOriTitle = bookOriTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBookType() {
		return bookType;
	}

	public void setBookType(String bookType) {
		this.bookType = bookType;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getBookContent() {
		return bookContent;
	}

	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public String getBookIndex() {
		return bookIndex;
	}

	public void setBookIndex(String bookIndex) {
		this.bookIndex = bookIndex;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getBestseller() {
		return bestseller;
	}

	public void setBestseller(int bestseller) {
		this.bestseller = bestseller;
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

	// top-menu의 검색창 이용
	public String getMainkeyword() {
		return mainkeyword;
	}


	public void setMainkeyword(String mainkeyword) {
		this.mainkeyword = mainkeyword;
	}


	// 소장자료 검색창의 검색창 이용
	public String getSrchkeyword1() {
		return srchkeyword1;
	}


	public void setSrchkeyword1(String srchkeyword1) {
		this.srchkeyword1 = srchkeyword1;
	}


	public String getSrchkeyword2() {
		return srchkeyword2;
	}


	public void setSrchkeyword2(String srchkeyword2) {
		this.srchkeyword2 = srchkeyword2;
	}


	public String getSrchkeyword3() {
		return srchkeyword3;
	}

	
	public void setSrchkeyword3(String srchkeyword3) {
		this.srchkeyword3 = srchkeyword3;
	}

	
	public String getSrchtype1() {
		return srchtype1;
	}

	
	public void setSrchtype1(String srchtype1) {
		this.srchtype1 = srchtype1;
	}
	

	public String getSrchtype2() {
		return srchtype2;
	}

	
	public void setSrchtype2(String srchtype2) {
		this.srchtype2 = srchtype2;
	}

	
	public String getSrchtype3() {
		return srchtype3;
	}

	
	public void setSrchtype3(String srchtype3) {
		this.srchtype3 = srchtype3;
	}
	

	public String[] getGenreList() {
		return genreList;
	}

	public void setGenreList(String[] genreList) {
		this.genreList = genreList;
	}

	
	


}
