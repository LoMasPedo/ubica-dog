import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen
  {
    '8t8y1smb': {
      'es': 'Ingreso',
      'en': '',
    },
    '2j0vqb32': {
      'es': 'Home',
      'en': '',
    },
  },
  // Rutas
  {
    'ebnzopla': {
      'es': 'Rutas',
      'en': '',
    },
    'r12b4azv': {
      'es': 'Buscar...',
      'en': '',
    },
  },
  // Home
  {
    'c7vvrgfa': {
      'es': 'Rutas',
      'en': '',
    },
  },
  // EditProfile
  {
    'leqdsljr': {
      'es': 'Update Account Information',
      'en': '',
    },
    'qbgx2kiw': {
      'es': 'Full Name',
      'en': '',
    },
    '1l4z9c1g': {
      'es': 'Please enter your full name...',
      'en': '',
    },
    '8i9yalso': {
      'es': 'Your email...',
      'en': '',
    },
    'o8ssf8ng': {
      'es': 'Save Changes',
      'en': '',
    },
    'r2k3yw54': {
      'es': 'Please fill in a valid email address...',
      'en': '',
    },
    'ywkftdec': {
      'es': 'Please fill in a valid email address...',
      'en': '',
    },
    'dphv7rx3': {
      'es': 'Edit Profile',
      'en': '',
    },
    'rzn6hywi': {
      'es': 'Home',
      'en': '',
    },
  },
  // MyProfile
  {
    'n268lwyd': {
      'es': 'Welcome',
      'en': '',
    },
    'qclrafwc': {
      'es': 'Account Information',
      'en': '',
    },
    '4w2v4vjv': {
      'es': 'Edit Profile',
      'en': '',
    },
    'oeerggax': {
      'es': 'Change Password',
      'en': '',
    },
    'v1smoxqa': {
      'es': 'Administrar Usuarios',
      'en': '',
    },
    '7a89if4c': {
      'es': 'Prueba ubicación',
      'en': '',
    },
    '2von566c': {
      'es': 'Switch to Dark Mode',
      'en': '',
    },
    '99zjepyd': {
      'es': 'Switch to Light Mode',
      'en': '',
    },
    '8ptv8syw': {
      'es': 'Log Out',
      'en': '',
    },
    'jtz1rpek': {
      'es': 'App Version v0.0',
      'en': '',
    },
  },
  // ChangePassword
  {
    '0bpy6y3l': {
      'es':
          'Enter your email and we will send a reset password link to your email for you to update it.',
      'en': '',
    },
    'znq238jf': {
      'es': 'Email address here...',
      'en': '',
    },
    '4gkwanpb': {
      'es': 'We will send a link to your email...',
      'en': '',
    },
    'evd9u46w': {
      'es': 'Send Link',
      'en': '',
    },
    'cra0won2': {
      'es': 'Please fill in a new password..',
      'en': '',
    },
    'ey5p0qnx': {
      'es': 'Change Password',
      'en': '',
    },
    '56wgdwzw': {
      'es': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'hb9t4gcx': {
      'es': 'Bienvenidos',
      'en': '',
    },
    'ncqoa3s0': {
      'es': 'Email',
      'en': '',
    },
    '6b6sidvr': {
      'es': 'Password',
      'en': '',
    },
    '6jps2zdu': {
      'es': 'Ingresar',
      'en': '',
    },
    'ucmr8lw6': {
      'es': 'Or sign up with',
      'en': '',
    },
    '4zz0svgv': {
      'es': 'Continue with Google',
      'en': '',
    },
    'j2hziztz': {
      'es': 'Home',
      'en': '',
    },
  },
  // Register
  {
    'lx2e6z4z': {
      'es': 'Nombre completo',
      'en': '',
    },
    'yl0x2ol3': {
      'es': 'Número de documento',
      'en': '',
    },
    '0273gok7': {
      'es': 'Número de celular',
      'en': '',
    },
    'k0kbqs92': {
      'es': 'Correo electrónico',
      'en': '',
    },
    'plzr4gsy': {
      'es': 'Administrador',
      'en': '',
    },
    'ikb8uon9': {
      'es': 'Cliente',
      'en': '',
    },
    '6hor4i1l': {
      'es': 'Conductor',
      'en': '',
    },
    'w57flid1': {
      'es': 'Selecciona el rol',
      'en': '',
    },
    'ir9y3klh': {
      'es': 'Search for an item...',
      'en': '',
    },
    'w4f6s731': {
      'es': 'Asignar contraseña',
      'en': '',
    },
    'kauu4fkv': {
      'es': 'Confirmar contraseña',
      'en': '',
    },
    'hcibdycn': {
      'es': 'Registrar',
      'en': '',
    },
    'v3ypmxo5': {
      'es': 'Registro de usuarios',
      'en': '',
    },
    '8mog06md': {
      'es': 'Home',
      'en': '',
    },
  },
  // AdminUsers
  {
    '0nk8b7ia': {
      'es': 'Administradores',
      'en': '',
    },
    'bsqpym0l': {
      'es': 'Clientes',
      'en': '',
    },
    '287n9fyk': {
      'es': 'Conductores',
      'en': '',
    },
    'v84dubh2': {
      'es': 'Administrar usuarios',
      'en': '',
    },
  },
  // CreateAdmin
  {
    '8z3bt3j2': {
      'es': 'Nombre completo',
      'en': '',
    },
    '81jcmxwh': {
      'es': 'Número de celular',
      'en': '',
    },
    'lidc5bvm': {
      'es': 'Correo electrónico',
      'en': '',
    },
    'dklw24du': {
      'es': 'Cargo',
      'en': '',
    },
    'a9o16sxy': {
      'es': 'Asignar contraseña',
      'en': '',
    },
    '39d2rwyn': {
      'es': 'Confirmar contraseña',
      'en': '',
    },
    'fr1a7vbo': {
      'es': 'Registrar',
      'en': '',
    },
    '8orh7ubt': {
      'es': 'Crear usuario administrador',
      'en': '',
    },
  },
  // CreateCustomer
  {
    'nprqogl0': {
      'es': 'Nombre completo',
      'en': '',
    },
    '86etbito': {
      'es': 'Número de celular',
      'en': '',
    },
    'yi6yx6t3': {
      'es': 'Correo electrónico',
      'en': '',
    },
    'zersqeed': {
      'es': 'Dirección',
      'en': '',
    },
    '16idbct0': {
      'es': 'Asignar contraseña',
      'en': '',
    },
    's96m4qu1': {
      'es': 'Confirmar contraseña',
      'en': '',
    },
    'de9hsjsp': {
      'es': 'Registrar',
      'en': '',
    },
    'zmotodox': {
      'es': 'Crear cliente',
      'en': '',
    },
  },
  // SearchPets
  {
    'hulovj8g': {
      'es': 'Buscar...',
      'en': '',
    },
    '1enpunj0': {
      'es': 'Buscar Mascotas',
      'en': '',
    },
    'nair4nof': {
      'es': 'Home',
      'en': '',
    },
  },
  // SearchUsers
  {
    'qpswm8lf': {
      'es': 'Buscar...',
      'en': '',
    },
    'y0957g4e': {
      'es': 'Buscar usuarios',
      'en': '',
    },
    '6vn7ahg1': {
      'es': 'Home',
      'en': '',
    },
  },
  // EditUsers
  {
    'm2f5eow1': {
      'es': 'Actualizar nombre completo',
      'en': '',
    },
    'tx3dioqf': {
      'es': 'Correo electrónico',
      'en': '',
    },
    'unamj4ly': {
      'es': 'Actualizar número de documento',
      'en': '',
    },
    '52lh6wzv': {
      'es': 'Actualizar número de celular',
      'en': '',
    },
    '5zeme3gm': {
      'es': 'Actualizar direccion',
      'en': '',
    },
    'tb4018y6': {
      'es': '',
      'en': '',
    },
    'e1jmw6hz': {
      'es': 'Confirmar direccion en el mapa',
      'en': '',
    },
    'm6yxxlaa': {
      'es': 'Mascotas',
      'en': '',
    },
    'gulsdjjp': {
      'es': 'Actualizar',
      'en': '',
    },
    'q1uybd9w': {
      'es': 'Actualizar usuarios',
      'en': '',
    },
    'qovyey8a': {
      'es': 'Home',
      'en': '',
    },
  },
  // ElegirDireccion
  {
    '1njq0qsd': {
      'es': 'Button',
      'en': '',
    },
    '5kh2kw37': {
      'es': 'Select Location',
      'en': '',
    },
    'ul44vq6x': {
      'es': 'Confirmar viaje',
      'en': '',
    },
    'newmxjjl': {
      'es': 'Rutas',
      'en': '',
    },
  },
  // EditUserCustomer
  {
    '4v2rf02m': {
      'es': 'Actualizar nombre completo',
      'en': '',
    },
    'jz0ir10u': {
      'es': 'Correo electrónico',
      'en': '',
    },
    '6gg24hz5': {
      'es': 'Actualizar número de documento',
      'en': '',
    },
    '0giatmon': {
      'es': 'Actualizar número de celular',
      'en': '',
    },
    'o7nf8xtd': {
      'es': 'Actualizar direccion',
      'en': '',
    },
    'bh4h742v': {
      'es': '',
      'en': '',
    },
    'sm7680jh': {
      'es': 'Confirmar direccion en el mapa',
      'en': '',
    },
    '5yge4baz': {
      'es': 'Actualizar',
      'en': '',
    },
    'q53rv6nt': {
      'es': 'Actualizar usuarios',
      'en': '',
    },
    'hwut7q63': {
      'es': 'Home',
      'en': '',
    },
  },
  // EditPets
  {
    '22i53ggx': {
      'es': 'Actualizar nombre mascota',
      'en': '',
    },
    'qvmz787c': {
      'es': 'Perro',
      'en': '',
    },
    'nkdvvi7z': {
      'es': 'Gato',
      'en': '',
    },
    '7irttehz': {
      'es': 'Otro',
      'en': '',
    },
    '17j6welx': {
      'es': '',
      'en': '',
    },
    'ofcuw26e': {
      'es': 'Search for an item...',
      'en': '',
    },
    'u1x90rnf': {
      'es': 'Raza',
      'en': '',
    },
    'eiwqt413': {
      'es': 'Descripción',
      'en': '',
    },
    'hdxltzas': {
      'es': 'Fecha nacimiento',
      'en': '',
    },
    'ffdciz6y': {
      'es': 'Actualizar',
      'en': '',
    },
    'mg73v350': {
      'es': 'Actualizar datos mascota',
      'en': '',
    },
    'yjun9abr': {
      'es': 'Home',
      'en': '',
    },
  },
  // EditRutes
  {
    '9l0warq2': {
      'es': 'Home',
      'en': '',
    },
  },
  // SearchRutes
  {
    'li5upjlv': {
      'es': 'Buscar...',
      'en': '',
    },
    'in0kjvkr': {
      'es': 'Buscar rutas',
      'en': '',
    },
    '5zy2wc11': {
      'es': 'Home',
      'en': '',
    },
  },
  // emptyList_tasks
  {
    'qk8pv8e1': {
      'es': 'You don\'t have any tasks',
      'en': '',
    },
    'fl2f93a4': {
      'es': 'Create tasks by tapping the button below.',
      'en': '',
    },
    '90w77puj': {
      'es': 'Create Task',
      'en': '',
    },
  },
  // CreateTask_new
  {
    'i032acvp': {
      'es': 'Add Task',
      'en': '',
    },
    '9pkcmh21': {
      'es': 'Fill out the details below to add a new task.',
      'en': '',
    },
    'a5rja0p4': {
      'es': 'Task Name',
      'en': '',
    },
    'abaccfox': {
      'es': 'Enter your task here....',
      'en': '',
    },
    '32b8lj4e': {
      'es': 'Details',
      'en': '',
    },
    'dmy6ulsq': {
      'es': 'Enter a description here...',
      'en': '',
    },
    '4el4a0wf': {
      'es': 'Cancel',
      'en': '',
    },
    '6ziywgz1': {
      'es': 'Create Task',
      'en': '',
    },
  },
  // RegisterCheck
  {
    'hlbpawjm': {
      'es': '¡Usuario registrado exitosamente!',
      'en': '',
    },
    'zncjb5gp': {
      'es': 'Ingresar',
      'en': '',
    },
  },
  // Modal17EditProfile
  {
    '29fhcm2o': {
      'es': 'Edit Profile',
      'en': '',
    },
    'gp3l544j': {
      'es': 'Below are your profile details',
      'en': '',
    },
    'jnl60pta': {
      'es': 'Change Photo',
      'en': '',
    },
    'fq78ev23': {
      'es': 'Your Name',
      'en': '',
    },
    'b9igk314': {
      'es': 'Your Name',
      'en': '',
    },
    'hrmffio9': {
      'es': 'Admin',
      'en': '',
    },
    'txk91tdg': {
      'es': 'Manager',
      'en': '',
    },
    '74m0rwyn': {
      'es': 'Editor',
      'en': '',
    },
    'b4qsu48f': {
      'es': 'Viewer',
      'en': '',
    },
    '6f92vuky': {
      'es': 'Please select...',
      'en': '',
    },
    'r0vkm0nv': {
      'es': 'Search for an item...',
      'en': '',
    },
    'd845l80o': {
      'es': 'The email associated with this account is:',
      'en': '',
    },
    '6aqenxyf': {
      'es': 'casper@ghostbusters.com',
      'en': '',
    },
    'y9h8ez37': {
      'es': 'Created On:',
      'en': '',
    },
    'nwprd0ym': {
      'es': 'July 12th, 2023',
      'en': '',
    },
    'q6z0g1kh': {
      'es': 'Last Active:',
      'en': '',
    },
    'km0c3fly': {
      'es': 'Just Now',
      'en': '',
    },
    '3d1ocpe6': {
      'es': 'Cancel',
      'en': '',
    },
    'kcm9jo3e': {
      'es': 'Save Changes',
      'en': '',
    },
  },
  // Alerta
  {
    '1ywkafy3': {
      'es': 'Se registro correctamente',
      'en': '',
    },
    'cvexxqdd': {
      'es': 'Cancel',
      'en': '',
    },
  },
  // CreatePets
  {
    'ql8gbeyc': {
      'es': 'Agregar mascota',
      'en': '',
    },
    'u9sl2ede': {
      'es': 'Nombre mascota',
      'en': '',
    },
    'tghhvf7v': {
      'es': 'Perro',
      'en': '',
    },
    'i58l9hay': {
      'es': 'Gato',
      'en': '',
    },
    'vmmdogpn': {
      'es': 'Otro',
      'en': '',
    },
    'wvbmw0ph': {
      'es': 'Selecciona el tipo de mascota...',
      'en': '',
    },
    'ix9cypfi': {
      'es': 'Search for an item...',
      'en': '',
    },
    'rb977edc': {
      'es': 'Raza',
      'en': '',
    },
    '0siazqgl': {
      'es': 'Descripción de la mascota...',
      'en': '',
    },
    'plbm0r5v': {
      'es': 'Fecha nacimiento mascota',
      'en': '',
    },
    'gos1zjus': {
      'es': 'Fecha nacimiento',
      'en': '',
    },
    'e5u7tnc2': {
      'es': 'Cancelar',
      'en': '',
    },
    '95koxhhm': {
      'es': 'Agregar mascota',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'cx8wczup': {
      'es': '',
      'en': '',
    },
    'f71wyjg6': {
      'es': '',
      'en': '',
    },
    'zfbcem4l': {
      'es': 'Para poder observar las rutas necesitamos tu ubicacion',
      'en': '',
    },
    'rut48ncv': {
      'es': '',
      'en': '',
    },
    'pxsqpdtk': {
      'es': '',
      'en': '',
    },
    '7oep4lwa': {
      'es': '',
      'en': '',
    },
    'k600q8e1': {
      'es': '',
      'en': '',
    },
    'azckrjhi': {
      'es': '',
      'en': '',
    },
    'v37fd687': {
      'es': '',
      'en': '',
    },
    'xubblu7n': {
      'es': '',
      'en': '',
    },
    '4z6kp3ct': {
      'es': '',
      'en': '',
    },
    's694z9nd': {
      'es': '',
      'en': '',
    },
    'y270xxar': {
      'es': '',
      'en': '',
    },
    'qf7uknf9': {
      'es': '',
      'en': '',
    },
    'efz6es1a': {
      'es': '',
      'en': '',
    },
    'e8y43kjs': {
      'es': '',
      'en': '',
    },
    'y550opxu': {
      'es': '',
      'en': '',
    },
    'o0hrmsf6': {
      'es': '',
      'en': '',
    },
    '30bn2wei': {
      'es': '',
      'en': '',
    },
    'glg8cotw': {
      'es': '',
      'en': '',
    },
    '3j3jxd42': {
      'es': '',
      'en': '',
    },
    '3nxl9ic0': {
      'es': '',
      'en': '',
    },
    '3rf26y4e': {
      'es': '',
      'en': '',
    },
    'oz6om9lh': {
      'es': '',
      'en': '',
    },
    'pwo20j0w': {
      'es': '',
      'en': '',
    },
    'whbidp9y': {
      'es': '',
      'en': '',
    },
    '0w1l5k2j': {
      'es': '',
      'en': '',
    },
    '9dr3qk3a': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
