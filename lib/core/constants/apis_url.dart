class ApiUrls {
  // TODO : CHANGE BASE URL TO YOUR BASE URL HERE
  // static const String baseUrl = 'http://192.168.1.110:8000/api';

  static const String baseUrl = 'https://senior.alhasanshnnar.com/api';

  // TODO : ADD YOUR APIS ENDPOINTS HERE
  static const String addBio = '$baseUrl/addBio';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String createPost = '$baseUrl/post';
  static const String getPosts = '$baseUrl/post';
  static const String addComment = '$baseUrl/addComment/';
  static const String addLike = '$baseUrl/post/';
  static const String getSupervisors = '$baseUrl/supervisor';
  static const String getPostComments = '$baseUrl/post/';
  static const String getStudentTasks = '$baseUrl/task/student';
  static const String getBlogs = '$baseUrl/announcements';
  static const String completeSubTask = '$baseUrl/complete/subtask';
  static const String deleteSubTask = '$baseUrl/delete/subtask/';

  static const String getEngineers = '$baseUrl/engineer';
  static const String getStudents = '$baseUrl/users';
  static const String getStudentByID = '$baseUrl/get/student/';
  static const String getStudentProfile = '$baseUrl/profile';
  static const String sendInvitationFromLeaderToSupervisor =
      '$baseUrl/send/supervisorRequest';
  static const String sendInvitationFromLeaderToEngineer =
      '$baseUrl/send/engineerRequest';
  static const String getProposals = '$baseUrl/univercityProposal';
  static const String createTeam = '$baseUrl/team';
  static const String getTeams = '$baseUrl/get/teams';
  static const String getTeamMembers = '$baseUrl/team/members';
  static const String getTeamById = '$baseUrl/get/team/';
  static const String createTask = '$baseUrl/create/task';
  static const String createSubTask = '$baseUrl/create/subtask';
  static const String deleteTask = '$baseUrl/delete/task/';
  static const String sendJoinRequestToTeam = '$baseUrl/send/team/joinRequest';
  static const String getTasks = '$baseUrl/get/tasks';
  static const String getTaskByID = '$baseUrl/get/task/';
  static const String sendInvitationFromLeaderToStudent =
      '$baseUrl/send/team/invitation';
  static const String rejectStudentInTeamRequest =
      '$baseUrl/reject/joinRequest';
  static const String approveStudentInTeamRequest =
      '$baseUrl/approve/joinRequest';
  static const String approveStudentTeamJoinRequest =
      '$baseUrl/approve/invitation';
  static const String rejectStudentTeamJoinRequest =
      '$baseUrl/reject/invitation';
  static const String getStudentTeamJoinRequest = '$baseUrl/invitations';
  static const String uploadProposal = '$baseUrl/proposalRequest';
  static const String getTeamJoinRequest = '$baseUrl/joinRequests';
  static const String acceptTeamJoinRequest = '$baseUrl/approve/joinRequest';
}
