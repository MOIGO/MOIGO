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
	
	private String searchingKey="";
	private boolean chk;
	private String opt;
	
	
	
	public PageInfo(int startPage, int endPage, int maxPage, int limit, int currentPage, int listCount, int startRow,
			int endRow, String searchingKey,String opt, boolean chk) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.limit = limit;
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.startRow = startRow;
		this.endRow = endRow;		
		this.searchingKey = searchingKey;
		this.opt = opt;
		this.chk=chk;
	}
	
	
	public String getOpt() {
		return opt;
	}


	public void setOpt(String opt) {
		this.opt = opt;
	}


	public boolean isChk() {
		return chk;
	}


	public void setChk(boolean chk) {
		this.chk = chk;
	}


	public String getSearchingKey() {
		return searchingKey;
	}
	public void setSearchingKey(String searchingKey) {
		this.searchingKey = searchingKey;
	}
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
				+ endRow + ", searchingKey=" + searchingKey + ", chk=" + chk + ", opt=" + opt + "]";
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
	
	public PageInfo(int currPage,int listCount,int limit){
		this.currentPage = currPage;
		this.listCount = listCount;
		this.limit = limit;
		
		//총 게시글 수에 대한 페이지 계산
		//ex)목록의 수가 123개라면 페이지 수는 13개가 된다.
		//10으로 나누어 떨어지지 않은 게시글도 하나의 페이지가 되어야 한다.
		//소수점 자리를 올리기 위해서 0.9를 더하고 (int)형으로 형변환하여 자른다.
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		//현재 화면에 표시할 페이지 갯수
		//첫 페이지의 번호
		//한 화면에 10개의 페이지를 표시하고 싶다.
		startPage = (((int)((double)currentPage / limit+0.9))-1)*limit+1;
		
		//한 화면에 표시할 마지막 페이지 번호
		endPage = startPage + limit-1;
		
		//만약에 1,2,3,4,5,6,7,8,9,10을 보여주려고 한다면
		//하지만 7페이지 밖에 없을때 
		if(maxPage<endPage){
			endPage=maxPage;
		}
		
		startRow  =(currentPage-1)*limit+1;
		endRow = startRow+(limit-1);
	}

	
}
