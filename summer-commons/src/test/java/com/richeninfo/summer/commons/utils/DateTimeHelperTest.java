package com.richeninfo.summer.commons.utils;

import org.junit.Assert;
import org.junit.Test;

public class DateTimeHelperTest {
	@Test
	public final void testDateCompare() {
		// 1970-01-01T00:00:00Z
		Assert.assertEquals(false, DateTimeHelper.isAfter(
				"2013-12-01T17:01:20Z", "2013-12-01T17:01:20Z"));
		Assert.assertEquals(true, DateTimeHelper.isAfter(
				"2013-12-01T17:01:23Z", "2013-12-01T17:01:20Z"));

		Assert.assertEquals(true,
				DateTimeHelper.isAfter("2013-12-01", "2013-01-01"));
		Assert.assertEquals(false,
				DateTimeHelper.isBefore("2013-12-01", "2013-01-01"));

		Assert.assertEquals(false,
				DateTimeHelper.isAfter("2013-12-01", "2014-01-01"));
		Assert.assertEquals(true,
				DateTimeHelper.isBefore("2013-12-01", "2014-01-01"));
	}

	@Test
	public final void testJodaDateTimeToStringMethod() {
		// MestarLogger.println(DateTimeHelper.getTodayDateTimeStr("yyyy.MM.dd G 'at' HH:mm:ss z"));
		// MestarLogger.println(DateTimeHelper.getTodayDateTimeStr("EEE, MMM d, ''yy"));
		// MestarLogger.println(DateTimeHelper.getTodayDateTimeStr("yyyy-MM-dd'T'HH:mm:ss.SSSZ"));
		// MestarLogger.println(DateTimeHelper.getTodayDateTimeStr("yyyy-MM-dd hh:mm:ss.SSS"));
		//
		// MestarLogger.println(DateTimeHelper.getTodayDateTimeStrWithOffset("yyyy-MM-dd hh:mm:ss"
		// ,-1));
		// MestarLogger.println(DateTimeHelper.getTodayDateTimeStrWithOffset("yyyy-MM-dd hh:mm:ss"
		// ,1));
		//
		// MestarLogger.println(DateTimeHelper.getTodayDateTimeStrWithOffset("yyyy-MM-dd"
		// ,-2));
		// MestarLogger.println(DateTimeHelper.getTodayDateTimeStrWithOffset("yyyy-MM-dd"
		// ,1));
	}
}
