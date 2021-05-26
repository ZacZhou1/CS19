package usyd.elec5703.cs19.domain;

public class Questionnaire {
	String id;
	String theme;
	String minvalue;
	String maxvalue;
	String descriptionnumber;
	String descriptions;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getMinvalue() {
		return minvalue;
	}
	public void setMinvalue(String minvalue) {
		this.minvalue = minvalue;
	}
	public String getMaxvalue() {
		return maxvalue;
	}
	public void setMaxvalue(String maxvalue) {
		this.maxvalue = maxvalue;
	}
	public String getDescriptionnumber() {
		return descriptionnumber;
	}
	public void setDescriptionnumber(String descriptionnumber) {
		this.descriptionnumber = descriptionnumber;
	}
	public String getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	
	
	public Questionnaire() {
		super();
	}
	public Questionnaire(String id, String theme, String minvalue, String maxvalue, String descriptionnumber,
			String descriptions) {
		super();
		this.id = id;
		this.theme = theme;
		this.minvalue = minvalue;
		this.maxvalue = maxvalue;
		this.descriptionnumber = descriptionnumber;
		this.descriptions = descriptions;
	}
	@Override
	public String toString() {
		return "Questionnaire [id=" + id + ", theme=" + theme + ", minvalue=" + minvalue + ", maxvalue=" + maxvalue
				+ ", descriptionnumber=" + descriptionnumber + ", descriptions=" + descriptions + "]";
	}
	
	
	
	

}
