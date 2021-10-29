package com.infotran.springboot._init;

import java.util.Date;
import java.util.TimeZone;

public class DateDemo {

	public static void main(String[] args) {
		TimeZone tz = TimeZone.getTimeZone("GMT-8");
		TimeZone.setDefault(tz);
		
		Date d1 = new Date();
		System.out.println("現在時間：" + d1);
		Date d0 = new Date(0);
		System.out.println("時間原點：" + d0);
		Date dmax = new Date(Long.MAX_VALUE);
		System.out.println("時間終點：" + dmax);
	}
}
