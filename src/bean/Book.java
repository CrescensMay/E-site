package bean;

import java.io.InputStream;

public class Book {
    private int id;
    private String title;
    private String author;
    private int year;
    private String month;
    private int day;
    private String publisher;
    private int coverSize;
    private int imgSize;
    private InputStream cover;
    private InputStream file;
    private String date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getCoverSize() {
        return coverSize;
    }

    public void setCoverSize(int coverSize) {
        this.coverSize = coverSize;
    }

    public int getImgSize() {
        return imgSize;
    }

    public void setImgSize(int imgSize) {
        this.imgSize = imgSize;
    }


    public InputStream getCover() {
        return cover;
    }

    public void setCover(InputStream cover) {
        this.cover = cover;
    }

    public InputStream getFile() {
        return file;
    }

    public void setFile(InputStream file) {
        this.file = file;
    }

    public String getDate(){
        return date;
    }
    public void setDate(String date){
        this.date = date;
    }

}
