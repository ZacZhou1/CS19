package usyd.elec5703.cs19.domain;

public class Data {
	
	private String idString;
	private String psychometricSpace;
	private String numericSpace;
	private String algorithm;

	public String getIdString() {
		return idString;
	}
	public void setIdString(String idString) {
		this.idString = idString;
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
	
	
	public String getAlgorithm() {
		return algorithm;
	}
	public void setAlgorithm(String algorithm) {
		this.algorithm = algorithm;
	}
	public Data() {
		super();
	}
	public Data(String idString, String psychometricSpace, String numericSpace) {
		super();
		this.idString = idString;
		this.psychometricSpace = psychometricSpace;
		this.numericSpace = numericSpace;
	}
	public Data(String idString, String psychometricSpace, String numericSpace, String algorithm) {
		super();
		this.idString = idString;
		this.psychometricSpace = psychometricSpace;
		this.numericSpace = numericSpace;
		this.algorithm = algorithm;
	}

}
