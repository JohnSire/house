package com.peak.house.commons.domain;

import java.util.List;

/**
 * 返回带有list的结果bean
 */
public class DataGridResultInfo {

    private ResultInfo resultInfo;

    private int total;//总页数

    private List list;

    private int pageNum;

    private int pageSize;

    public DataGridResultInfo(){
    	
    }
    
    public DataGridResultInfo(ResultInfo resultInfo){
        this.resultInfo = resultInfo;
    }

    public ResultInfo getResultInfo() {
        return resultInfo;
    }

    public void setResultInfo(ResultInfo resultInfo) {
        this.resultInfo = resultInfo;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
