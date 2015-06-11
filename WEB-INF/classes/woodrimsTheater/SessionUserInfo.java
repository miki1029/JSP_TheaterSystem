package woodrimsTheater;

public class SessionUserInfo {
    private String id;
    private String name;
    private String gradeID;

    public SessionUserInfo(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public SessionUserInfo(String id, String name, String gradeID) {
        this(id, name);
        this.gradeID = gradeID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGradeID() {
        return gradeID;
    }

    public void setGradeID(String gradeID) {
        this.gradeID = gradeID;
    }
}
