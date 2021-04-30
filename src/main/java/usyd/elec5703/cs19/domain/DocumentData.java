package usyd.elec5703.cs19.domain;

public class DocumentData {
	private String idString;
	private String userName;
	private String psychometricSpace;
	private String numericSpace;
	private String mappingAlgorithm;

	public String getIdString() {
		return idString;
	}

	public void setIdString(String idString) {
		this.idString = idString;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPsychometricSpace() {
		return psychometricSpace;
	}

	public void setPsychometricSpace(String psychometricSpace) {
		this.psychometricSpace = psychometricSpace;
	}

	public String getNumericSpace() {
		return numericSpace;
	}

	public void setNumericSpace(String numericSpace) {
		this.numericSpace = numericSpace;
	}

	public String getMappingAlgorithm() {
		return mappingAlgorithm;
	}

	public void setMappingAlgorithm(String mappingAlgorithm) {
		this.mappingAlgorithm = mappingAlgorithm;
	}
	
	

	public DocumentData() {
		super();
	}

	public DocumentData(String idString, String userName, String psychometricSpace, String numericSpace,
			String mappingAlgorithm) {
		super();
		this.idString = idString;
		this.userName = userName;
		this.psychometricSpace = psychometricSpace;
		this.numericSpace = numericSpace;
		this.mappingAlgorithm = mappingAlgorithm;
	}

	@Override
	public String toString() {
		return "DocumentData [idString=" + idString + ", userName=" + userName + ", psychometricSpace="
				+ psychometricSpace + ", numericSpace=" + numericSpace + ", mappingAlgorithm=" + mappingAlgorithm + "]";
	}

}
