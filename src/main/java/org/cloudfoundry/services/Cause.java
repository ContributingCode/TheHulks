package org.cloudfoundry.services;

public class Cause{
	private int id;
	private String title;

	public Cause(int id,String title){
		this.id=id;
		this.title=title;
	}
	
	public int getId(){return id;}
	public String getTitle(){return title;}
}