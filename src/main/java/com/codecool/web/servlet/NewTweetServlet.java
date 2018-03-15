package com.codecool.web.servlet;

import com.codecool.web.model.Tweet;
import com.codecool.web.service.TweetService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/NewTweetServlet")
public class NewTweetServlet extends HttpServlet {
    TweetServlet ts = new TweetServlet();
    TweetService service = ts.getTs();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<Tweet> tweets = service.getTweets();
        PrintWriter pw = resp.getWriter();
        String poster = req.getParameter("poster");
        String message = req.getParameter("message");
        if (poster != null && message != null) {
            Tweet newTweet = new Tweet(poster, message);
            tweets.add(newTweet);
            String htmlResponse = "<html>\n" +
                "    <meta charset=\"UTF-8\">\n";
            htmlResponse += "<h2>Poster: " + poster;
            htmlResponse += "<br>Post: " + message + "</br>";
            htmlResponse += "</html>";
            pw.println(htmlResponse);
            resp.sendRedirect("index.html");
        }

        String htmlResponse = "<html> <head>\n" +
            "    <meta charset=\"UTF-8\">\n" +
            "  </head>";
        htmlResponse += "<h2>Error! Poster or message is missing!";
        pw.println(htmlResponse);

    }
}
