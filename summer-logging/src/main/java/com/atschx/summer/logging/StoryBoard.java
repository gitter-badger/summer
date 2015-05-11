package com.atschx.summer.logging;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class StoryBoard {

	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	public void recordStory() {
	
		logger.info("who?");

	}
}
