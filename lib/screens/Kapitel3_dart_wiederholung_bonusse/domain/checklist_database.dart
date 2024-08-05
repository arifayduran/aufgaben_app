class ChecklistDatabase {
  static Map<String, bool> checklistDatabase = {
    "Task 1": false,
    "Task 2": true,
    "Task 3": false,
    "Task 4": true
  };

  static void addItem(String item) {
    checklistDatabase[item] = false;
  }

  static void removeItem(String item) {
    checklistDatabase.remove(item);
  }
}
