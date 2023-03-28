abstract class OrderEvents {}

class GetPublicOrdersForLawyerEvent extends OrderEvents {}

class GetOwnOrdersForLawyerEvent extends OrderEvents {}

class GetPrivateOrdersForLawyerEvent extends OrderEvents {}

class GetRequestsOrdersForLawyerEvent extends OrderEvents {}

class UpdateOrdersForLawyerEvent extends OrderEvents {}

class AddOrderFeedbackForLawyerEvent extends OrderEvents {}

class CreateClientOrderEvent extends OrderEvents {}

class GetAllClientOderEvent extends OrderEvents {}

class GetClientOrderRequestEvent extends OrderEvents {}

class AcceptClientOrderEvent extends OrderEvents {}

class UpdateCLientOrderStatusEvent extends OrderEvents {}

class AddClientFeedbackEvent extends OrderEvents {}
