package usyd.elec5703.cs19.domain;

public class QuestionnaireList {
	String id;
	String questionnaireid;
	String descriptions;
	String values;
	String username;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuestionnaireid() {
		return questionnaireid;
	}
	public void setQuestionnaireid(String questionnaireid) {
		this.questionnaireid = questionnaireid;
	}
	public String getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	public String getValues() {
		return values;
	}
	public void setValues(String values) {
		this.values = values;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public QuestionnaireList(String id, String questionnaireid, String descriptions, String values) {
		super();
		this.id = id;
		this.questionnaireid = questionnaireid;
		this.descriptions = descriptions;
		this.values = values;
	}
	public QuestionnaireList() {
		super();
	}
	
	
	
	public QuestionnaireList(String id, String questionnaireid, String descriptions, String values, String username) {
		super();
		this.id = id;
		this.questionnaireid = questionnaireid;
		this.descriptions = descriptions;
		this.values = values;
		this.username = username;
	}
	@Override
	public String toString() {
		return "QuestionnaireList [id=" + id + ", questionnaireid=" + questionnaireid + ", descriptions=" + descriptions
				+ ", values=" + values + "]";
	}
	

}
