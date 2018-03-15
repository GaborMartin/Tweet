package com.codecool.web.service;

import com.codecool.web.model.Tweet;

import java.util.ArrayList;
import java.util.List;

public final class TweetService {
    private List<Tweet> tweets;

    public TweetService() {
        tweets = new ArrayList<>();
    }

    public List<Tweet> getTweets() {
        return tweets;
    }
}
