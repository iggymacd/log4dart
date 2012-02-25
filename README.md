Log4Dart
========
**Log4Dart** is a logger for Dart inspired by [Slf4J][slf4j]. 

The logger and its appender are interface and thus supports multiple implementations. Currently it shipws with the following implementations:

  * **ConsoleAppender** a appender that logs to the console
  * **LoggerImpl** a simple logger implementation with diagnostic support

The logger accessed through  the **LoggerFactory** class as demonstrated below

```
// Setup a logger builder function for the application
// this is the function invoked by the logger factory
// when asked for a logger
LoggerFactory.configureBuilder((name) => new LoggerImpl(name, debugEnabled:true)); 

// Get logger inside application code
Logger logger = LoggerFactory.getLogger("name");
```

The logger supports nested diagnostic contexts which can be used to
track application state like this

```
logger.putContext("context-name", "context-message");
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

[slf4j]: http://www.slf4j.org/