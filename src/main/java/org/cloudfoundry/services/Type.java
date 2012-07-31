package org.cloudfoundry.services;

public class Type{
	private int id;
	private String title;

	public Type(int id,String title){
		this.id=id;
		this.title=title;
	}
	
	public int getId(){return id;}
	public String getTitle(){return title;}
}