<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tweetcool</title>
    <link rel="stylesheet" href="tweet.css">
    <meta charset="UTF-8">
</head>
<body>

<ul class="navbar">
    <li><a href="index.html">Home</a>
    <li><a href="tweet">Tweets</a>
</ul>

<br><h2>Choose a filtering option:</h2><br>
<form action="#">
  <select name="Options">
    <option value="limit">Limit</option>
    <option value="offset">Offset</option>
    <option value="poster">Poster</option>
    <option value="from">From</option>
  </select>
  <br><br>
  <input type="text" name="filtervalue"<br>
  <input type="submit" value="Send!">
</form>

<br><h2>Tweets:</h2><br>
<table>
    <tr>
         <td><h4><p>Post ID&ensp;</p></td>
         <td><h4><p>Poster&ensp;</p></td>
         <td><h4><p>Post&ensp;</p></td>
         <td><h4><p>Time&ensp;</p></td>
    </tr>
    <c:forEach items="${tweets}" var="tweet">
    <tr>
        <td><c:out value = "${tweet.id}"/><p></td>
        <td><c:out value = "${tweet.poster}"/><p></td>
        <td><c:out value = "${tweet.post}"/><p></td>
        <td><c:out value = "${tweet.timestamp}"/><p></td>
    </tr>
    </c:forEach>
</table>

<a href="index.html">Go back</a>
</body>
</html>
