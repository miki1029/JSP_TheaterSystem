package woodrimsTheater;

public class ReserveInfo {
    private int ticketID;
    private int seatRow;
    private int seatColumn;
    private ShowingInfo showingInfo;

    public ReserveInfo() {
    }

    public ReserveInfo(int ticketID, int seatRow, int seatColumn,
                       int showingID, String movieName,
                       String startTime, String endTime,
                       String theaterType, int roomNumber) {
        this.ticketID = ticketID;
        this.seatRow = seatRow;
        this.seatColumn = seatColumn;
        showingInfo = new ShowingInfo(showingID, movieName,
                startTime, endTime, theaterType, roomNumber);
    }

    public ReserveInfo(int ticketID, int seatRow, int seatColumn,
                       ShowingInfo showingInfo) {
        this.ticketID = ticketID;
        this.seatRow = seatRow;
        this.seatColumn = seatColumn;
        this.showingInfo = showingInfo;
    }

    public int getTicketID() {
        return ticketID;
    }
    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
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

    // showingInfo
    public int getShowingID() {
        return showingInfo.getShowingID();
    }
    public void setShowingID(int showingID) { showingInfo.setShowingID(showingID); }

    public String getMovieName() {
        return showingInfo.getMovieName();
    }
    public void setMovieName(String movieName) {
        showingInfo.setMovieName(movieName);
    }

    public String getStartTime() {
        return showingInfo.getStartTime();
    }
    public void setStartTime(String startTime) {
        showingInfo.setStartTime(startTime);
    }

    public String getEndTime() {
        return showingInfo.getEndTime();
    }
    public void setEndTime(String endTime) {
        showingInfo.setEndTime(endTime);
    }

    public String getTheaterType() {
        return showingInfo.getTheaterType();
    }
    public void setTheaterType(String theaterType) {
        showingInfo.setTheaterType(theaterType);
    }

    public int getRoomNumber() {
        return showingInfo.getRoomNumber();
    }
    public void setRoomNumber(int roomNumber) {
        showingInfo.setRoomNumber(roomNumber);
    }

    public String getRoomName() { return showingInfo.getRoomName(); }
}
