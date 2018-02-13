package bean;

import java.io.InputStream;

public class Forum {
    private String comment;
    private String date;
    private InputStream postFile;
    private int fileSize;

    public int getFileSize() {
        return fileSize;
    }

    public void setFileSize(int fileSize) {
        this.fileSize = fileSize;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public InputStream getPostFile() {
        return postFile;
    }

    public void setPostFile(InputStream postFile) {
        this.postFile = postFile;
    }
}
