package paging;


public interface Pageble {
	Integer getPage();
	Integer getLimit();
	Integer getOffset();
	String getSortName();
	String getSortBy();
}
