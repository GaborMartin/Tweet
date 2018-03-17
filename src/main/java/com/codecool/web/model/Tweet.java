package com.codecool.web.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class Tweet {
    private int id;
    private String poster;
    private String post;
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH");
    private String timestamp;
    private static final Random r = new Random();

    public Tweet(String poster, String post) {
        this.id = r.nextInt(1000-100) + 100;
        this.poster = poster;
        this.post = post;
        timestamp = sdf.format(new Timestamp(System.currentTimeMillis()));
    }

    public int getId() {
        return id;
    }

    public String getPoster() {
        return poster;
    }

    public String getPost() {
        return post;
    }

    public String getTimestamp() {
        return timestamp;
    }

    @Override
    public String toString() {
        return "Id: " + id + " Poster: " + poster + " Post: " + post + " Time: " + timestamp;
    }
}
