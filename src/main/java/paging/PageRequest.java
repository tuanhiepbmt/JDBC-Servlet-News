package paging;


public class PageRequest implements Pageble{
	private Integer page;
	private Integer limit;
	private String sortName;
	private String sortBy;
	public PageRequest(Integer page, Integer limit, String sortName, String sortBy) {
		this.page=page;
		this.limit=limit;
		this.sortName=sortName;
		this.sortBy=sortBy;
	}
	@Override
	public Integer getPage() {
		return this.page;
	}

	@Override
	public Integer getLimit() {
		return this.limit;
	}

	@Override
	public Integer getOffset() {
		return (this.page-1) *this.limit;
	}

	@Override
	public String getSortName() {
		// TODO Auto-generated method stub
		return this.sortName;
	}
	@Override
	public String getSortBy() {
		// TODO Auto-generated method stub
		return this.sortBy;
	}
	
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

}
