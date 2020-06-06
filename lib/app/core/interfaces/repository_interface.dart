abstract class IRepository {
  Future delete(String id);
  Future list();
  Future add(dynamic model);
  Future update(dynamic model);
  Future get(String id);
}
