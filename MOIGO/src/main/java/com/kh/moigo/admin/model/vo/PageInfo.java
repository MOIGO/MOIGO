package com.kh.moigo.admin.model.vo;



public class PageInfo implements java.io.Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 2767495166449571836L;
	
	
	private int startPage; // 한번에 표시될 게시글들의 시작 페이지
	private int endPage;  // 한번에 표시될 게시글들의 마지막 페이지
	private int maxPage;   // 전체 페이지의 마지막 페이지 
	private int limit;       // 한 페이지당 게시글 수
	private int currentPage; // 현재 페이지
	private int listCount;
	private int startRow;
	private int endRow;
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	@Override
	public String toString() {
		return "PageInfo [startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage + ", limit=" + limit
				+ ", currentPage=" + currentPage + ", listCount=" + listCount + ", startRow=" + startRow + ", endRow="
				+ endRow + "]";
	}
	
	
	public PageInfo(int currentPage, int listCount, int limit, int startPage, int endPage, int maxPage, int startRow,
			int endRow) {
	
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.limit = limit;
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.startRow = startRow;
		this.endRow = endRow;
	}
	
	public PageInfo() {
		super();
	}
	public void setPageInfo(int currPage,int listCount,int limit){
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage
		 = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		endPage
		 = startPage + limit - 1;
		
		if( maxPage < endPage){
			endPage = maxPage;
		}
	
		startRow = ((currentPage-1)*limit)+1;
		endRow = startRow+(limit-1);
		
	}
	
}
