/**
 * A logger implementation that logs to the console
 */
class LoggerImpl implements Logger {
   static Map<String, Logger> _loggerCache;
  
   final Appender _appender;
   final bool debugEnabled;
   final bool errorEnabled;
   final bool infoEnabled;
   final bool warnEnabled;
   final String name;
   Map<String, String> _context;
   
   LoggerImpl(this.name, [this.debugEnabled=false, this.errorEnabled=true, this.infoEnabled=false, this.warnEnabled=true]) : _appender = new ConsoleAppender() { 
     _context = new LinkedHashMap();
   }
   
   /**
    * If logger associated with name does not already exists then call ifAbsent to create and return it
    */
   factory LoggerImpl.putIfAbsent(String name, Logger ifAbsent()) {
     if(_loggerCache == null) {
       _loggerCache = new Map<String, Logger>();
     }
     if(!_loggerCache.containsKey(name)) {
       _loggerCache[name] = ifAbsent();
     }
     
     Logger logger = _loggerCache[name];
     Expect.isNotNull(logger);
     return logger;
   }

   debug(String message) {
     if(debugEnabled) _append("DEBUG", message);
   }
   
   debugFormat(String format, List args) {
     if(debugEnabled) debug(_format(format, args));
   }
   
   error(String message) {
     if(errorEnabled) _append("ERROR", message);
   }
   
   errorFormat(String format, List args) {
     if(errorEnabled) error(_format(format, args));
   }
   
   info(String message) {
     if(infoEnabled) _append("INFO", message);
   }
   
   infoFormat(String format, List args) {
     if(infoEnabled) info(_format(format, args));
   }
   
   warn(String message) {
     if(warnEnabled) _append("WARN", message);
   }
   
   warnFormat(String format, List args) {
     if(warnEnabled) warn(_format(format, args));
   }
   
   void clearContext() => _context.clear();
   
   String getContect(String key) => _context[key];
   
   void putContext(String key, String val) {
     _context[key] = val;
   }
   
   void removeContext(String key) {
     _context.remove(key);
   }
   
   void _append(String level, String message) {
     String ctx = "";
     _context.forEach(f(k,v) => ctx += "$v:");
     // TODO format
     _appender.doAppend("[$level] $name [$ctx] $message");
   }
   
   String _format(String format, List args) {
     throw new UnsupportedOperationException("implement sprintf");
   }
}
