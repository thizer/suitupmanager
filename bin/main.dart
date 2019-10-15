import 'package:args/args.dart';
import 'package:colorize/colorize.dart';
import 'package:suitupmanager/NewComponent.dart';
import 'package:suitupmanager/Install.dart';

main(List<String> arguments) {
  ArgParser parser = ArgParser();
  ArgResults args;

  try {
    parser.addFlag('verbose', abbr: 'v', negatable: false);
    parser.addFlag('help', abbr: 'h', negatable: false);
    parser.addFlag('install', abbr: 'i', help: 'Install a brand new Suitup project', negatable: false, defaultsTo: false);

    parser.addFlag('new', abbr: 'n', help: 'Creates a new component inside a project', negatable: false, defaultsTo: false);
    parser.addOption('controller', abbr: 'c', help: 'Indica qual controlador será criado ou modificado', defaultsTo: 'index');
    parser.addOption('module', abbr: 'm', help: 'O nome do módulo a ser criado/modificado', defaultsTo: 'default');
    parser.addOption('form', abbr: 'f', help: 'Cria um novo formulário');
    parser.addOption('dbtable', help: 'Cria estrutura básica para integração com banco de dados (Business e Gateways)');

    args = parser.parse(arguments);

    // Check if parameters are ok
    if ((args['install'] == false && args['new'] == false) || (args['install'] == true && args['new'] == true)) {
      throw FormatException('We can\'t understand what you looking for...');
    }

    if (args['install']) {
      Install install = Install();
      install.run();
    }

    if (args['new']) {
      NewComponent newComponent = NewComponent(args['controller'], args['module'], args['form'], args['dbtable']);
      newComponent.controller().module().form().dbtable();
    }
    //
  } on FormatException catch (e) {
    Colorize errorMsg = Colorize(e.message);
    errorMsg.yellow();
    print(errorMsg.toString() + "\n");

    print(parser.usage);
  } catch (e) {
    print(e);
  }
}
