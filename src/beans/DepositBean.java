package beans;

public class DepositBean {
	private int amount, duration;

	public int getAmount() {
		System.out.println("getAmount()");
		return amount;
	}

	public void setAmount(int amount) {
		System.out.println("setAmount()");
		this.amount = amount;
	}

	public int getDuration() {
		System.out.println("getDuration()");
		return duration;
	}

	public void setDuration(int duration) {
		System.out.println("setDuration()");
		this.duration = duration;
	}

	// property interest 
	public int getInterest() {
		System.out.println("getInterest()");
		if ( duration < 36)
			 return (int) Math.round(amount * 0.07);
		else
			 return (int) Math.round(amount * 0.09);
	}
	
	

}
