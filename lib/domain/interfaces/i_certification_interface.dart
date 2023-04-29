abstract class ICertificationInterface{
  Future<dynamic> addLawyerCertification(var model);
  Future<dynamic> getLawyerCertifications();
  Future<dynamic> deleteLawyerCertification(var model);
}