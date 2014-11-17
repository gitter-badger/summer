/**
 * Copyright (c) 2012-2013,Epic-HUST Technology（Wuhan）Co.,Ltd. All Rights Reserved.
 */
package com.richeninfo.summer.logging;

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
public class Slf4jLogDelegator implements LogDelegator
{
	/**
	 * mestar平台内部控制用于开发调试时使用的logger.
	 */
	private final Logger mestarLogger = LoggerFactory.getLogger("mestar.logger");
	public Logger getMestarLogger()
	{
	       return mestarLogger;
	 }
	/**
	 * mestar错误信息记录的Logger
	 */
	private final Logger mestarErrorLogger = LoggerFactory.getLogger("mestar.error");
	public Logger getMestarErrorLogger()
	{
	       return mestarErrorLogger;
	 }
	
	/**
	 * mestar错误信息记录的Logger
	 */
	private final Logger mestarScheduleLogger = LoggerFactory.getLogger("mestar.schedule");
	public Logger getMestarScheduleLogger()
	{
	       return mestarScheduleLogger;
	 }
	 /**
     * 录制界面操作用到的Log
     */
    private final Logger recLogger = LoggerFactory.getLogger("mestar.rec");
    public Logger getRecLogger()
    {
        return recLogger;
    }
	public boolean isRecEnabled()
	{
		return recLogger.isErrorEnabled();
	}

	/**
	 * 用于输出简单调试信息.
	 */
	@Override
	public void debug(String msg)
	{
		mestarLogger.debug(msg);
	}
	@Override
	public boolean isLoggingEnabled()
	{
		return mestarLogger.isErrorEnabled();
	}
	/**
	 * 对应error级别.
	 */
	@Override
	public void error(String msg, Throwable t)
	{
		mestarLogger.error(msg, t);
	}
	/**
	 * 对应error级别.
	 */
	@Override
	public void error(String msg)
	{
		mestarLogger.error(msg);
	}
	/**
	 * 对应info级别.
	 */
	@Override
	public void info(String msg)
	{
		mestarLogger.info(msg);
	}

}
