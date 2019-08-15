import 'package:args/args.dart';
import 'package:colorize/colorize.dart';
import 'package:suitupmanager/ControllerCreate.dart';
import 'package:suitupmanager/DbtableCreate.dart';
import 'package:suitupmanager/FormCreate.dart';
import 'package:suitupmanager/Install.dart';
import 'package:suitupmanager/ModuleCreate.dart';

main(List<String> arguments) {
  
  ArgParser parser = new ArgParser();
  ArgResults args;

  try {
    parser.addFlag('verbose', negatable: false, abbr: 'v');
    parser.addOption(
      'action',
      abbr: 'a',
      allowed: ['install', 'controller', 'module', 'form', 'dbtable'],
      help: 'O que você deseja fazer hoje?',
      allowedHelp: {
        'install': 'Instalar um novo projeto SuitUp',
        'controller': 'Criar um novo controlador',
        'module': 'Criar um novo modulo',
        'form': 'Criar um novo form',
        'dbtable': 'Criar um novo dbtable',
      },
    );

    parser.addOption('controller', abbr: 'c', help: 'Indica qual controlador será criado ou modificado', defaultsTo: 'index');
    parser.addOption('module', abbr: 'm', help: 'O nome do módulo a ser criado/modificado', defaultsTo: 'default');
    parser.addOption('form', abbr: 'f', help: 'Cria um novo formulário');
    parser.addOption('dbtable', help: 'Cria estrutura básica para integração com banco de dados (Business e Gateways)');

    args = parser.parse(arguments);

    if (args['action'] == null) {
      throw FormatException('Por favor informe a ação que pretende realizar');
    }

    if (args['action'] == 'install') {
      
      Install install = Install();
      install.run();

    } else if (args['action'] == 'controller') {

      ControllerCreate controller = ControllerCreate();
      controller.run();

    } else if (args['action'] == 'module') {

      ModuleCreate module = ModuleCreate();
      module.run();

    } else if (args['action'] == 'form') {

      FormCreate form = FormCreate();
      form.run();

    } else if (args['action'] == 'dbtable') {

      DbtableCreate dbtable = DbtableCreate();
      dbtable.run();
      
    }
    // print(parser.options.keys);

    // for (var name in parser.options.keys) {
    //   print(name.toString()+": "+args[name].toString());
    // };
    

  } on FormatException catch (e) {

    Colorize errorMsg = Colorize(e.message);
    errorMsg.yellow();

    print(errorMsg.toString()+"\n");
    print(parser.usage);

  } catch (e) {
    print(e);
  }
}

