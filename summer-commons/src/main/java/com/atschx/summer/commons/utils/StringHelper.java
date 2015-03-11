package com.atschx.summer.commons.utils;

/**
 * 字符串工具类。
 * <p>
 * StringHelper主要提供针对字符串操作的工具函数，使用者通过各函数的使用场景酌情使用。
 * </p>
 * 
 * @author Albert
 */
public class StringHelper
{
	/**
	 * 字符串是否为空
	 * <p>
	 * 关于字符串是否为空，StringHelper作者的认识，希望调用处酌情考虑。<br>
	 * &gt;&gt;1.字符串实例为<code>null</code><br>
	 * &gt;&gt;2.空字符串("")或("  "中间若干个空格)<br>
	 * &gt;&gt;3.字符串为("null")或（"NULL"）<code>null</code><br>
	 * </p>
	 * 
	 * @since 2013年9月10日 下午8:48:39 Albert
	 * @param str
	 *            需要判断的字符串
	 * @return 传入的字符串为空，返回true（真），否则返回false（假）
	 */
	public static boolean isEmpty(String str)
	{
		boolean flag = false;

		// 短路与的方式处理，提高程序效率.
		if (null == str || "".equals(str) || "".equals(str.trim()) || "null".equalsIgnoreCase(str))
		{
			flag = true;
		}

		return flag;
	}

	/**
	 * <p>
	 * Checks if a String is not empty (""), not null and not whitespace only.
	 * </p>
	 * 
	 * <pre>
	 * StringHelper.isNotBlank(null)      = false
	 * StringHelper.isNotBlank("")        = false
	 * StringHelper.isNotBlank(" ")       = false
	 * StringHelper.isNotBlank("bob")     = true
	 * StringHelper.isNotBlank("  bob  ") = true
	 * </pre>
	 * 
	 * @param str
	 *            the String to check, may be null
	 * @return <code>true</code> if the String is not empty and not null and not
	 *         whitespace
	 * @since 2.0
	 */
	public static boolean isNotBlank(String str)
	{
		return !isBlank(str);
	}

	/**
	 * <p>
	 * Checks if a String is whitespace, empty ("") or null.
	 * </p>
	 * 
	 * <pre>
	 * StringHelper.isBlank(null)      = true
	 * StringHelper.isBlank("")        = true
	 * StringHelper.isBlank(" ")       = true
	 * StringHelper.isBlank("bob")     = false
	 * StringHelper.isBlank("  bob  ") = false
	 * </pre>
	 * 
	 * @param str
	 *            the String to check, may be null
	 * @return <code>true</code> if the String is null, empty or whitespace
	 * @since 2.0
	 */
	public static boolean isBlank(String str)
	{
		int strLen;
		if (str == null || (strLen = str.length()) == 0)
		{
			return true;
		}
		for (int i = 0; i < strLen; i++)
		{
			if ((Character.isWhitespace(str.charAt(i)) == false))
			{
				return false;
			}
		}
		return true;
	}
}
