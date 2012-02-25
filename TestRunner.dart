class TestRunner {
  Logger logger;
  
  TestRunner(): logger = LoggerFactory.getLogger("TestRunner") {
    logger.debug("a debug message");
    // TODO test that logging contexts works accross loggers  
  }
}
