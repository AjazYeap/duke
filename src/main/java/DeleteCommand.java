import java.util.ArrayList;

public class DeleteCommand extends Command{

    protected int numbertodelete;
    public DeleteCommand(String passed, int numberpassed)
    {
        super(passed);
        numbertodelete= numberpassed;
    }
    @Override
    public boolean isExit() {
        return false;
    }

    @Override
    public void execute(ArrayList<Task> tasklist, UI ui, fileaccess f) {
        UI.showDelete();
        tasklist.remove(numbertodelete-1);
    }
}
