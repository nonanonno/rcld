import argparse;
import msg_gen.commands;

mixin CLI!GenerateMessagePackages.main!((args, unparsed) {
    return args.onExecute();
});
