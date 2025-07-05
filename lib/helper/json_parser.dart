class JsonParser {
  static int getInt(Map<String, dynamic> map, String key) {
    try {
      if (map.containsKey(key)) {
        if (map[key] == null) {
          return 0;
        }
        return map[key];
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  static double getDouble(Map<String, dynamic> map, String key) {
    try {
      if (map.containsKey(key)) {
        if (map[key] == null) {
          return 0.0;
        }
        return map[key];
      } else {
        return 0.0;
      }
    } catch (e) {
      return 0.0;
    }
  }

  static String getString(Map<String, dynamic> map, String key) {
    try {
      if (map.containsKey(key)) {
        if (map[key] == null) {
          return "";
        }
        return map[key];
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  static bool getBool(Map<String, dynamic> map, String key) {
    try {
      if (map.containsKey(key)) {
        if (map[key] == null) {
          return false;
        }
        return map[key];
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static List getList(Map<String, dynamic> map, String key) {
    try {
      if (map.containsKey(key)) {
        if (map[key] == null) {
          return [];
        }
        return map[key];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Map<String, dynamic> getMap(Map<String, dynamic> map, String key) {
    try {
      if (map.containsKey(key)) {
        if (map[key] == null) {
          return Map();
        }
        return map[key];
      } else {
        return Map();
      }
    } catch (e) {
      return Map();
    }
  }
}
