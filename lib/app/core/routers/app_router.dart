import 'package:doctor_hunt/app/features/appointment/presentation/screens/appointment_screen1.dart';
import 'package:doctor_hunt/app/features/appointment/presentation/screens/appointment_screen2.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/signup_screen.dart';
import 'package:doctor_hunt/app/features/book/presentation/screens/book_screen.dart';
import 'package:doctor_hunt/app/features/favoirte/presentation/screens/favorite_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/find_doctor_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/select_time_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:doctor_hunt/app/features/message/presentation/screens/message_screen.dart';
import 'package:doctor_hunt/app/features/splash&onboarding/presentation/screens/choose_role_screen.dart';
import 'package:doctor_hunt/app/features/splash&onboarding/presentation/screens/on_boarding_screen.dart';
import 'package:doctor_hunt/app/features/splash&onboarding/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const chooseRole = '/chooseRole';
  static const login = '/login';
  static const signUp = '/signUp';
  static const home = '/home';
  static const findDoctor = '/findDoctor';
  static const appointment1 = '/appointment1';
  static const appointment2 = '/appointment2';
  static const book = '/book';
  static const favorite = '/favorite';
  static const message = '/message';
  static const doctorDetails = '/doctorDetails';
  static const selectTime = '/selectTime';
  static const bottomWidget = '/bottomWidget';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onBoarding,
        builder: (context, state) =>  OnBoardingScreen(),
      ),
      GoRoute(
        path: chooseRole,
        builder: (context, state) => const ChooseRoleScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: bottomWidget,
        builder: (context, state) => const BottomNavigationBarWidget(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: findDoctor,
        builder: (context, state) => const FindDoctorsScreen(),
      ),
      GoRoute(
        path: appointment1,
        builder: (context, state) =>  AppointmentScreen1(),
      ),
      GoRoute(
        path: appointment2,
        builder: (context, state) => const AppointmentScreen2(),
      ),
      GoRoute(
        path: book,
        builder: (context, state) => const BookScreen(),
      ),
      GoRoute(
        path: favorite,
        builder: (context, state) =>  FavoriteScreen(),
      ),
      GoRoute(
        path: message,
        builder: (context, state) => const MessageScreen(),
      ),
      GoRoute(
        path: doctorDetails,
        builder: (context, state) => const DoctorDetailsScreen(),
      ),
      GoRoute(
        path: selectTime,
        builder: (context, state) => const SelectTimeScreen(),
      ),
    ],
  );
}
