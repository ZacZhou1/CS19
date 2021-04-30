package usyd.elec5703.cs19.utils;

import java.math.BigDecimal;

public class DoubleScale {
	
	public Double doubleScale(Double num) {
		BigDecimal b = new BigDecimal(num);
		Double numDouble  = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		return numDouble;
	}

}
