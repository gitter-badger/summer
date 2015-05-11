package com.atschx.summer.logging;

import org.junit.Test;

public class SummerLoggerTest {

	@Test
	public final void testDebug() {
		for (int i = 0; i < 6; i++) {
			SummerLogger.debug("测试"+i);
		}
		try {
			if(1/0 == 0){
			}
		} catch (Exception e) {
			SummerLogger.error(e.toString(), e);
		}
		StoryBoard storyBoard = new StoryBoard();
		storyBoard.recordStory();
	}

}
