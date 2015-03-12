##编码规范

此规范仅限于证券研发产品部，规范参照Summer及Diamond代码编写规范.

>##规范目的
* 统一代码风格
* 降低程序员沟通成本
* 持续集成
* etc.
 
#基本规定

##日志记录
* 应用类：统一使用XXXXLogger进行日志记录
> 方便后期针对应用进行分析
* 控件类：统一使用UILogger进行日志记录
> UI控件类属于基础组件部分,日志记录的目的一般是为了直接跟踪查找UI相关的调试信息
* 框架类：统一采用slf4J的记录方式
> 为提高代码执行效率，底层代码不追踪到具体的方法行