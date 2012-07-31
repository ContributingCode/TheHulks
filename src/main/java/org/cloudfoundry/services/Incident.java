package org.cloudfoundry.services;

import org.springframework.data.annotation.Id;

public class Incident {

	@Id private String id;
	private Integer cause;
	private Double latitude;
	private Double longitude;
	private String description;

	public Incident() {
	}

	public Incident(Integer cause, Double latitude, Double longitude, String description) {
		super();
		this.cause=cause;
		this.latitude=latitude;
		this.longitude=longitude;
		this.description=description;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public Integer getCause() {
		return cause;
	}
	public void setCause(Integer a) {
		this.cause = a;
	}

	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double a){
		latitude=a;
	}
	

	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double a){
		longitude = a;
	}
	
	public String getDescription(){
		return description;
	}
	public void setDescription(String a){
		this.description=a;
	}
	
	@Override
	public String toString() {
		return "Incident [id=" + id + ", cause=" + cause + ", latitude="+latitude+", longitude=" + longitude + ", description="+description+"]";
	}
	
}
