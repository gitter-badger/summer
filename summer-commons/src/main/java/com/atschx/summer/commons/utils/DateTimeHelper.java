package com.atschx.summer.commons.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

/**
 * 基于Joda的日期帮助类.
 * @author Albert
 */
public abstract class DateTimeHelper {
	/**
	 * 给定的两个日期比较其大小. 注意：当前仅支持两种格式1970-01-01和1970-01-01T00:00:00Z
	 * 
	 * @param orgDateStr
	 *            被比较的日期对象
	 * @param refDateStr
	 *            参照的日期对象
	 * @return true 如果被比较的对象在参照日期对象之后时
	 */
	public static boolean isAfter(String orgDateStr, String refDateStr) {
		DateTime orgDateStrDateTime = new DateTime(orgDateStr);
		DateTime refDateStrDateTime = new DateTime(refDateStr);
		return orgDateStrDateTime.isAfter(refDateStrDateTime);
	}

	/**
	 * 请参考{@link #isAfter(String, String)}
	 */
	public static boolean isBefore(String orgDateStr, String refDateStr) {
		return !isAfter(orgDateStr, refDateStr);
	}

	/**
	 * 将符合指定格式的日期字符串转换成Date.
	 * 
	 * @param dateStr
	 *            需要转换的字符串对象
	 * @param pattern
	 *            需转换成的日期格式
	 */
	public static Date stringToDate(String dateStr, String pattern) {
		return DateTimeFormat.forPattern(pattern).parseDateTime(dateStr)
				.toDate();
	}

	/**
	 * 将Date格式化成指定格式的字符串
	 * 
	 * @param date
	 *            需要转换的日期对象
	 * @param pattern
	 *            需转换成的日期格式
	 * @return
	 */
	public static String dateToString(Date date, String pattern) {
		DateTime dateTime = new DateTime(date);
		return dateTime.toString();
	}

	/**
	 * 获取指定日期格式表达式的当天日期字符串.
	 * 
	 * @param pattern
	 *            SimpleDateFormat支持的表达式格式
	 * @return 符合格式的当天调用时刻的字符串
	 * @see SimpleDateFormat
	 */
	public static String getTodayDateTimeStr(String pattern) {
		DateTime dateTime = new DateTime();
		return dateTime.toString(pattern);
	}

	/**
	 * 获取指定日期格式表达式的以当天为基准偏移之后的日期字符串.
	 * 
	 * @param pattern
	 * @param offset
	 *            日期偏移量 负数向前，正数向后.
	 * @return
	 */
	public static String getTodayDateTimeStrWithOffset(String pattern,
			int offset) {
		DateTime dateTime = new DateTime();
		return dateTime.plusDays(offset).toString(pattern);
	}
}
