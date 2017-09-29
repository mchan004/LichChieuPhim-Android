package com.dvmaytinh.thanhtu.lichchieuphim;

/**
 * Created by thanhtulexuan on 12/3/16.
 */

public class ItemComment {
    private int id;
    private String Name;
    private String Datetime;
    private String Rate;
    private String Comment;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getDatetime() {
        return Datetime;
    }

    public void setDatetime(String datetime) {
        Datetime = datetime;
    }

    public String getRate() {
        return Rate;
    }

    public void setRate(String rate) {
        Rate = rate;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String comment) {
        Comment = comment;
    }

}
