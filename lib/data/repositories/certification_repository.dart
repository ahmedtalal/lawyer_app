import 'package:hokok/data/models/certification_model.dart';
import 'package:hokok/data/services/api/certifications_api_services.dart';
import 'package:hokok/domain/interfaces/i_certification_interface.dart';

class CertificationRepository implements ICertificationInterface {
  static CertificationRepository? _certificationRepository;
  CertificationRepository._internal();
  static CertificationRepository instance() {
    if (_certificationRepository == null) {
      return _certificationRepository = CertificationRepository._internal();
    }
    return _certificationRepository!;
  }

  @override
  Future<Map<String, dynamic>> addLawyerCertification(model) async {
    return await CertificationsAPiServices.instance()
        .addLawyerCertificationSer(model);
  }

  @override
  Future<Map<String, dynamic>> deleteLawyerCertification(model) async {
    return await CertificationsAPiServices.instance()
        .deleteLawyerCertificationSer(model);
  }

  @override
  Future<List<CertificationInfoModel>> getLawyerCertifications() async {
    return await CertificationsAPiServices.instance()
        .getAllLawyerCertificationsSer();
  }
}
