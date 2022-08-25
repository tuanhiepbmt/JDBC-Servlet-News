package model;

public class NewsModel extends AbstractModel{
	private String title;
	private String thumbnail;
	private String shortdescripsion;
	private Long categoryId;
	private String content;
	private CategoryModel category;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getShortdescripsion() {
		return shortdescripsion;
	}
	public void setShortdescripsion(String shortdescripsion) {
		this.shortdescripsion = shortdescripsion;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public CategoryModel getCategory() {
		return category;
	}
	public void setCategory(CategoryModel category) {
		this.category = category;
	}
}
