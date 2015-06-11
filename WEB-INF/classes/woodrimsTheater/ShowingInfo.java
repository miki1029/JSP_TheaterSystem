package woodrimsTheater;

public class ShowingInfo {
    private int showingID;
    private String movieName;
    private String startTime;
    private String endTime;
    private String theaterType;
    private int roomNumber;

    public ShowingInfo() {
    }

    public ShowingInfo(int showingID, String movieName,
                       String startTime, String endTime,
                       String theaterType, int roomNumber) {
        this.showingID = showingID;
        this.movieName = movieName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.theaterType = theaterType;
        this.roomNumber = roomNumber;
    }

    public int getShowingID() {
        return showingID;
    }
    public void setShowingID(int showingID) { this.showingID = showingID; }

    public String getMovieName() {
        return movieName;
    }
    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getStartTime() {
        return startTime;
    }
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getTheaterType() {
        return theaterType;
    }
    public void setTheaterType(String theaterType) {
        this.theaterType = theaterType;
    }

    public int getRoomNumber() {
        return roomNumber;
    }
    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomName() { return theaterType + " " + roomNumber + "관"; }
}
