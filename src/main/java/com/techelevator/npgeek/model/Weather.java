package com.techelevator.npgeek.model;

public class Weather {
	
	private String parkCode;
	private int fiveDayForecastValue;
	private int low;
	private int high;
	private String forecast;
	private double celsiusHigh;
	private double celsiusLow;
	
	public String getParkCode() {
		return parkCode;
	}
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}
	public int getFiveDayForecastValue() {
		return fiveDayForecastValue;
	}
	public void setFiveDayForecastValue(int fiveDayForecastValue) {
		this.fiveDayForecastValue = fiveDayForecastValue;
	}
	public int getLow() {
		return low;
	}
	public double getLowCelsius() {
		celsiusLow = (low - 32) * (5/9);
		return celsiusLow;
	}
	public void setLow(int low) {
		this.low = low;
	}
	public void setLowCelsius(double low) {
		this.low = (int)celsiusLow;
	}
	public int getHigh() {
		return high;
	}
	public double getHighCelsius() {
		celsiusHigh = (high - 32) * (5/9);
		return celsiusHigh;
	}
	public void setHigh(int high) {
		this.high = high;
	}
	public void setHighCelsius(double high) {
		double temp = (double)high;
		double celsiusHigh = ((temp - 32) * (5/9));
		this.celsiusHigh = celsiusHigh;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}

}
