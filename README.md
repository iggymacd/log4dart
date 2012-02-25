Log4Dart
========
**Log4Dart** is a logger for Dart inspired by Slf4J. The logger itself
is a interface and thus supports multiple implementations.

The same goes for the appenders, currently the following appenders
exists:

  1. **ConsoleAppender** a appender that logs to the console.

The logger is used like this

  1. Setup once pr application: ``LoggerFactory.putIfAbsent("name", new LoggerImpl("name", debugEnabled:true));
  1. Get logger in application: ``Logger logger = LoggerFactory.getLogger("name");

The logger supports nested diagnostic contexts which can be used to
track application state like this

 ```
 logger.putContext("context-name", "context-message");
 logger.debug("handling $expr");
 try {
  // log messages from now gets added a context-message
  :
  logger.debug("something important happend");
 } finally {
   // stop logging with context-message
   logger.removeContext("context-name");
 }
 ```

TODO
----
Some missing stuff (feel free to add more):

  1. Implement a file appender
  1. Create a Dart version of **sprintf** and use it for implementing the formatters 
  1. Figure out how best to configure the log output format
  1. When reflection arrives in Dart add ability to show the class/line where the log message originated

feel free to send in patched for these (or other features you miss).

License
-------
BSD License (Same as Dart itself). See LICENSE file.  
