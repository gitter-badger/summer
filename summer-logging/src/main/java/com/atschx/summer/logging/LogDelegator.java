package com.atschx.summer.logging;


/**
 * Delegates exception events to a logger.
 * 
 * @author Albert
 * @version LogDelegator.java, v 0.1 2013-4-7 下午1:19:22 Albert .
 */
public interface LogDelegator
{

	/**
	 * 捕获异常之后的默认日志处理.
	 */
	public void error(String msg, Throwable t);

	/**
	 * 捕获异常之后的默认日志处理.
	 */
	public void error(String msg);
	/**
	 * 记录业务相关的正常日志信息.
	 * 
	 * @param mesage
	 *           message to log.
	 */
	public void info(String mesage);

	/**
	 * 用于程序调试日志.代替System.out系列
	 * 
	 * @param msg
	 *            message to log.
	 */
	public void debug(String msg);

}
