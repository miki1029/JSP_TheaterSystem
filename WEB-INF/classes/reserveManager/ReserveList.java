package reserveManager;

public class ReserveList {
    private int ticketID;
    private String movieName;
    private int roomNumber;
    private String theaterType;
    private int seatRow;
    private int seatColumn;
    private String startTime;
    private String endTime;
    private int showingID;

    public ReserveList() {
    }

    public ReserveList(int ticketID, String movieName, int roomNumber,
                       String theaterType, int seatRow, int seatColumn,
                       String startTime, String endTime, int showingID) {
        this.ticketID = ticketID;
        this.movieName = movieName;
        this.roomNumber = roomNumber;
        this.theaterType = theaterType;
        this.seatRow = seatRow;
        this.seatColumn = seatColumn;
        this.startTime = startTime;
        this.endTime = endTime;
        this.showingID = showingID;
    }

    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getTheaterType() {
        return theaterType;
    }

    public void setTheaterType(String theaterType) {
        this.theaterType = theaterType;
    }

    public int getSeatRow() {
        return seatRow;
    }

    public void setSeatRow(int seatRow) {
        this.seatRow = seatRow;
    }

    public int getSeatColumn() {
        return seatColumn;
    }

    public void setSeatColumn(int seatColumn) {
        this.seatColumn = seatColumn;
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

    public int getShowingID() {
        return showingID;
    }

    public void setShowingID(int showingID) {
        this.showingID = showingID;
    }
}
