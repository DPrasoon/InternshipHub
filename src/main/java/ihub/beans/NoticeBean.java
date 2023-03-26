package ihub.beans;

import java.sql.Date;

public class NoticeBean {
	
	private int noticeid;
	private String providerid, noticetopic, noticecontents;
	private Date date;
	public int getNoticeid() {
		return noticeid;
	}
	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}
	public String getProviderid() {
		return providerid;
	}
	public void setProviderid(String providerid) {
		this.providerid = providerid;
	}
	public String getNoticetopic() {
		return noticetopic;
	}
	public void setNoticetopic(String noticetopic) {
		this.noticetopic = noticetopic;
	}
	public String getNoticecontents() {
		return noticecontents;
	}
	public void setNoticecontents(String noticecontents) {
		this.noticecontents = noticecontents;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public NoticeBean(int noticeid, String providerid, String noticetopic, String noticecontents, Date date) {
		super();
		this.noticeid = noticeid;
		this.providerid = providerid;
		this.noticetopic = noticetopic;
		this.noticecontents = noticecontents;
		this.date = date;
	}
	public NoticeBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
