package task.model;

import java.util.Date; // Import the Date class if not already imported

public class DoctorSlot {
    private int slotDoctId;
    private Date slotDate;
    private String slotFrom;
    private String slotTo;
    private String slotStatus;
    private int slotCount;

    // Default constructor
    public DoctorSlot() {
    }

    public int getSlotDoctId() {
        return slotDoctId;
    }

    public void setSlotDoctId(int slotDoctId) {
        this.slotDoctId = slotDoctId;
    }

    public Date getSlotDate() {
        return slotDate;
    }

    public void setSlotDate(Date slotDate) {
        this.slotDate = slotDate;
    }

    public String getSlotFrom() {
        return slotFrom;
    }

    public void setSlotFrom(String slotFrom) {
        this.slotFrom = slotFrom;
    }

    public String getSlotTo() {
        return slotTo;
    }

    public void setSlotTo(String slotTo) {
        this.slotTo = slotTo;
    }

    public String getSlotStatus() {
        return slotStatus;
    }

    public void setSlotStatus(String slotStatus) {
        this.slotStatus = slotStatus;
    }

    public int getSlotCount() {
        return slotCount;
    }

    public void setSlotCount(int slotCount) {
        this.slotCount = slotCount;
    }

    @Override
    public String toString() {
        return "DoctorSlot{" +
                "slotDoctId=" + slotDoctId +
                ", slotDate=" + slotDate +
                ", slotFrom='" + slotFrom + '\'' +
                ", slotTo='" + slotTo + '\'' +
                ", slotStatus='" + slotStatus + '\'' +
                ", slotCount=" + slotCount +
                '}';
    }
}
