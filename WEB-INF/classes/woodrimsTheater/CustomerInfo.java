package woodrimsTheater;

import java.sql.Date;

public class CustomerInfo {
    private String id;
    private String password;
    private String name;
    private String sex;
    private Date birthDate;
    private String email;
    private String phoneNumber;
    private Date registerDate;
    private String gradeName;
    private int point;

    public CustomerInfo(String id, String password,
                        String name, String sex,
                        Date birthDate, String email,
                        String phoneNumber, Date registerDate,
                        String gradeName, int point) {
        this.id = id.trim();
        this.password = password.trim();
        this.name = name.trim();
        this.sex = sex.trim();
        this.birthDate = birthDate;
        this.email = email.trim();
        this.phoneNumber = phoneNumber.trim();
        this.registerDate = registerDate;
        this.gradeName = gradeName.trim();
        this.point = point;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
