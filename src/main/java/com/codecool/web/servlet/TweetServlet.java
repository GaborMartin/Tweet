package com.codecool.web.servlet;

import com.codecool.web.model.Tweet;
import com.codecool.web.service.TweetService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/tweet")
public class TweetServlet extends HttpServlet {

    private static TweetService ts = new TweetService();
    private List<Tweet> tweets = ts.getTweets();

    public TweetService getTs() {
        return ts;
    }

    public List<Tweet> getTweets() {
        return tweets;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("tweets", tweets);
        req.getRequestDispatcher("tweet.jsp").forward(req, resp);
    }
}
