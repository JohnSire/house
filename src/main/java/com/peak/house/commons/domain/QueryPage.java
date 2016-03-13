package com.peak.house.commons.domain;

public class QueryPage {
	
	public static int defaultSize = 5;
	
	private Integer current;//当前页 * 页面大小
	
	private Integer pageNum; //当前页码

	private Integer pageSize;//页面大小
    
    

	public QueryPage() {
		pageSize = defaultSize;
		pageNum = 1;
	}

	
	public Integer getCurrent() {
		current = (pageNum-1) * pageSize;
		return current;
	}

	public void setCurrent(Integer current) {
		this.current = current;
	}
	
	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		if(pageNum ==null || pageNum < 0 || pageNum == 0)
		{
			pageNum =1;
		}
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
    
    
}
