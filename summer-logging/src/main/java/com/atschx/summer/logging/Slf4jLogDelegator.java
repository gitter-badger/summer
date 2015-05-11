package com.atschx.summer.logging;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 基于slf4j实现日志委托接口.
 * 
 * Delegates logging events to the the Simple Logging Facade for Java (slf4j).
 * 
 * @author Albert
 * @version Slf4jLogDelegator.java, v 0.1 2013-4-7 下午1:23:36 Albert .
 */
public class Slf4jLogDelegator implements LogDelegator {
	/**
	 * mestar平台内部控制用于开发调试时使用的logger.
	 */
	private final Logger summerLogger = LoggerFactory
			.getLogger("summer.logger");

	public Logger getMestarLogger() {
		return summerLogger;
	}


	@Override
	public void debug(String msg) {
		summerLogger.debug(msg);
	}

	@Override
	public void error(String msg, Throwable t) {
		summerLogger.error(msg, t);
	}

	@Override
	public void error(String msg) {
		summerLogger.error(msg);
	}

	@Override
	public void info(String msg) {
		summerLogger.info(msg);
	}

}
