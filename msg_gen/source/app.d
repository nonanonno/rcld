import jcli;
import msg_gen.commands;

int main(string[] args)
{
    auto executor = new CommandLineInterface!(msg_gen.commands);
    return executor.parseAndExecute(args);
}
