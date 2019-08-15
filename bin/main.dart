import 'package:args/args.dart';

main(List<String> arguments) {
  
  ArgParser parser = new ArgParser();
  ArgResults args;

  try {
    parser.addFlag('verbose', negatable: false, abbr: 'v');
    parser.addOption(
      'action',
      abbr: 'a',
      allowed: ['install', 'create'],
      help: 'O que você deseja fazer hoje?',
      allowedHelp: {
        'install': 'Instalar um novo projeto SuitUp',
        'create': 'Criar um novo componente SuitUp'
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

    // print(parser.options.keys);

    // for (var name in parser.options.keys) {
    //   print(name.toString()+": "+args[name].toString());
    // };
    

  } on FormatException catch (e) {

    // Colorize errorMsg = Colorize(e.message);
    // errorMsg.magenta();

    // print(errorMsg.toString()+"\n");
    print(e.message+"\n");
    print(parser.usage);

  } catch (e) {
    print(e);
  }
}

