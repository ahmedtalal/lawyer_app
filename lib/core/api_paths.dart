// ignore_for_file: constant_identifier_names

const String BASE_URL = "https://www.en-saf.com/api/";
const String LOGIN_REQUEST_PATH = "login";
const String LOGIN_OPT_REQUEST_PATH = "send-login-otp";
const String REGISTER_REQUEST_PATH = "register";
const String ALL_MAJOR_REQUEST_PATH = "majors";
const String ALL_SUB_MAJOR_REQUEST_PATH = "sub-majors";
const String LOGOUT_REQUEST_PATH = "logout";
const String GET_ALL_FEEDBACKS_REQUEST_PATH = "feedback";
const String ADD_FEEDBACK_REQUESt_PATH = "feedback";
const String GET_ALL_COMMENTS_REQUEST_PATH = "comments";
const String ADD_COMMENT_REQUEST_PATH = "comment";
const String ADD_CERTIFICATE_REQUEST_PATH = "lawyer/certification";
const String GET_CERTIFICATES_REQUEST_PATH = "lawyer/certifications";
const String DELETE_CERTIFICATE_REQUEST_PATH = "lawyer/certification/";
const String UPDATE_PROFILE_REQUEST_PATH = "profile";
const String GET_PROFILE_REQUEST_PATH = "profile";
const String GET_LAWYER_PUBLIC_ORDERS_REQUEST_PATH = "lawyer/public-orders";
const String GET_LAWYER_OWN_ORDERS_REQUEST_PATH = "lawyer/orders";
const String GET_LAWYER_private_ORDERS_REQUEST_PATH = "lawyer/private-orders";
const String POST_LAWYER_ORDERS_REQUEST_PATH = "lawyer/request-order";
const String GET_ALL_REQUEST_LAWYER_ORDERS_REQUEST_PATH =
    "lawyer/requests-to-orders";
const String UPDATE_LAWYER_ORDER_REQUEST_PATH = "lawyer/order/";
const String ADD_LAWYER_ORDER_FEEDBACK_REQUEST_PATH = "lawyer/order/feedback";
const String CREATE_CLIENT_ORDER_REQUEST_PATH = "order";
const String GET_ALL_CLIENT_ORDERS_REQUEST_PATH = "client/orders";
const String GET_CLIENT_ORDER_REQUESTS_REQUEST_PATH = "client/order/";
const String ACCEPT_REQUESTS_FOR_CLIENTS_REQUEST_PATH = "client/order/request/";
const String UPDATE_CLIENT_ORDER_STATUS_REQUEST_PATH = "client/order/";
const String ADD_CLIENT_FEED_BACK_REQUEST_PATH = "client/order/feedback";
const String GET_ALL_PLANS_REQUEST_PATH = "plans";
const String GET_ALL_WALLET_REQUEST_PATH = "wallet";
const String GET_ALL_TRANSACTIONS_REQUEST_PATH = "transactions";
const String GET_ALL_LAWYERS_REQUEST_PATH = "lawyer/all?";
const String GET_ALL_statistics_REQUEST_PATH = "client/statistics";
const String GET_ALL_FAVORITES_REQUEST_PATH = "favorites";
const String ADD_TO_FAVORITE_REQUEST_PATH = "favorites";
const String DELETE_FAVORITE_REQUEST_PATH = "favorites/";
const String SEND_MESSAGE_REQUEST_PATH = "chat/message";
const String SEND_MESSAGE_TO_ADMIN_REQUEST_PATH = "chat/message-to-admin";
  String getAllClientOrdersRequest(int orderId) =>
"order/$orderId/requests";