package com.atschx.summer.commons.utils;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.atschx.summer.commons.utils.StringHelper;

/**
 * StringHelperTest.
 * 
 * @author Albert
 * @since 2013年9月10日 下午10:07:46 Albert .
 */
public class StringHelperTest {
	@Test
	public final void testIsEmpty() {
		StringHelper stringHelper = new StringHelper();
		stringHelper.toString();

		assertEquals(true, StringHelper.isEmpty(null));
		assertEquals(true, StringHelper.isEmpty(""));
		assertEquals(true, StringHelper.isEmpty("  "));
		assertEquals(true, StringHelper.isEmpty("null"));
		assertEquals(true, StringHelper.isEmpty("NULL"));
		assertEquals(false, StringHelper.isEmpty("albert.sun@epichust.com"));
	}

	@Test
	public final void testIsNotBlank() {
		assertEquals(false, StringHelper.isNotBlank(null));
		assertEquals(false, StringHelper.isNotBlank(""));
		assertEquals(false, StringHelper.isNotBlank(" "));
		assertEquals(true, StringHelper.isNotBlank("bob"));
		assertEquals(true, StringHelper.isNotBlank(" bob"));
	}
}