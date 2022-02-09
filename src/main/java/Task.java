public class Task {
    protected String description;
    protected boolean isDone;

    public Task(String description)
    {
        this.description = description;
        this.isDone = false;
    }

    public String getStatus()
    {
        return (isDone ? "X" : " ");
    }
    public void setDone()
    {
        this.isDone = true;
    }
    public void setunDone()
    {
        this.isDone = false;
    }
}
