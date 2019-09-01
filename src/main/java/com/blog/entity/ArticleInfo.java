package com.blog.entity;

import java.util.Date;

public class ArticleInfo {
	
	private String id;
	private String title;
	private String content;
	private String contentText;
	private String cover;
	private int viewCount;
	private String typeId;
	// 1正常 0回收站
	private int status; 
	private String updateTime;
	
	// 文章分类名称
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContentText() {
		return contentText;
	}
	public void setContentText(String contentText) {
		this.contentText = contentText;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	@Override
	public String toString() {
		return "ArticleInfo [id=" + id + ", title=" + title + ", content=" + content + ", contentText=" + contentText
				+ ", cover=" + cover + ", viewCount=" + viewCount + ", typeId=" + typeId + ", status=" + status
				+ ", updateTime=" + updateTime + "]";
	}
	
	
}
