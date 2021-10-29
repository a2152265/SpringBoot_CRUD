package com.infotran.springboot._init;

import java.util.Arrays;
import java.util.TimeZone;

public class ShowTimeZoneIds {

	public static void main(String[] args) {
		String[] tzs = TimeZone.getAvailableIDs();
		Arrays.sort(tzs);
		for(String s: tzs) {
			System.out.println(s);
		}
//		Collections.sort();		
//		List<BoyFriend>
	}

}
