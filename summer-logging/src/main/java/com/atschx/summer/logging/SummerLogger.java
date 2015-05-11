package com.atschx.summer.logging;

/**
 * SummerLogger.
 */
public final class SummerLogger {

	private static LogDelegator delegator = new Slf4jLogDelegator();

	public static void debug(String msg) {
		delegator.debug(msg);
	}
	
	public static void error(String msg,Throwable t) {
		delegator.error(msg,t);
	}

}
