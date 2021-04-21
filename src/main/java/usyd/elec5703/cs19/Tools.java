package usyd.elec5703.cs19;

public class Tools {
	
	
	public String arrayToString(String[] arr ) {
		String s = "";
		for (int i = 0; i < arr.length-1; i++) {
			s = s+arr[i] +",";
		}
		s = s+arr[arr.length-1];
		
		return s;
		
	}
	
//	public static void main(String[] args) {
//		Tools tools =  new Tools();
//		System.out.println(tools.arrayToString(new String[]{"a","b","v"}));
//	}

}
