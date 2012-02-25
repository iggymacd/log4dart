#library("qalqo:common:log:test");

#import('../LogLib.dart');

class LogTest {
  Logger _logger;
  
  LogTest(): _logger = LoggerFactory.getLogger("TestRunner") {
    _logger.debug("a debug message");
    // TODO test that logging contexts works accross loggers  
  }
}

main() {
  LoggerFactory.configureBuilder((name) => new LoggerImpl(name, debugEnabled:true)); 
  // TODO demonstrate how the name of the log can be used to log differently 
  new LogTest();
}

