package beans;

public class Bankerpojo {

	private int id;
	private String pwd;
	private String bid;
	private int status;
	
	public Bankerpojo()
	{
		
	}
	
	public int getId()
	{
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBid()
	{
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
