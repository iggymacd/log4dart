class LoggerFactory {
  static Map<String, Logger> _loggerCache;
  static LoggerFactory _instance;
  static var loggerBuilder;
  
  /**
   * Assign a builder to this factory, a builder is a function that takes a name and returns a logger
   */
  static configureBuilder(Logger builder(String)) {
    loggerBuilder = builder;
  }
  
  LoggerFactory._internal();
  
  static Logger getLogger(String name) {
    if(_loggerCache == null) {
      _loggerCache = new Map<String, Logger>();
    }
    if(!_loggerCache.containsKey(name)) {
      _loggerCache[name] = loggerBuilder(name);
    }
    
    Logger logger = _loggerCache[name];
    Expect.isNotNull(logger);
    return logger;
  }
}
