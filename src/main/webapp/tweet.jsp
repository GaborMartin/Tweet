<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.Timestamp"%>
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
<center><br><h2>Choose a filtering option:</h2></center>
<center>Click submit to see tweets!</center>
<form action="#">
  <br><select name="Options">
    <option value="default">Default</option>
    <option value="limit">Limit</option>
    <option value="offset">Offset</option>
    <option value="poster">Poster</option>
    <option value="from">From</option>
  </select>
  <br><br>
  <input type="text" name="filtervalue"<br>
  <input type="submit" value="Submit!">
</form>

<%
String chosenOption = request.getParameter("Options");
String filterValue = request.getParameter("filtervalue");
%>

<center><br><h2>Tweets:</h2><br></center>
<center><table>
    <tr>
         <td><h4><p>Post ID&ensp;</p></td>
         <td><h4><p>Poster&ensp;</p></td>
         <td><h4><p>Post&ensp;</p></td>
         <td><h4><p>Time&ensp;</p></td>
    </tr>

    <c:set var="chosenOption" value="<%=chosenOption %>"/>
    <c:set var="filterValue" value="<%=filterValue %>"/>

    <c:if test="${(chosenOption == 'limit')}">
    <%int endIndex = Integer.parseInt(filterValue) - 1;%>
    <c:set var="endIndex" value="<%=endIndex%>"/>
    <c:forEach items="${tweets}" end="${endIndex}" var="tweet">
    <tr>
        <td><c:out value = "${tweet.id}"/><p></td>
        <td><c:out value = "${tweet.poster}"/><p></td>
        <td><c:out value = "${tweet.post}"/><p></td>
        <td><c:out value = "${tweet.timestamp}"/><p></td>
    </tr>
    </c:forEach>
    </c:if>

    <c:if test="${(chosenOption == 'offset')}">
    <%int startIndex = Integer.parseInt(filterValue) - 1;%>
    <c:set var="startIndex" value="<%=startIndex%>"/>
    <c:forEach items="${tweets}" begin="${startIndex}" var="tweet">
    <tr>
        <td><c:out value = "${tweet.id}"/><p></td>
        <td><c:out value = "${tweet.poster}"/><p></td>
        <td><c:out value = "${tweet.post}"/><p></td>
        <td><c:out value = "${tweet.timestamp}"/><p></td>
    </tr>
    </c:forEach>
    </c:if>

    <c:if test="${(chosenOption == 'default')}">
    <c:forEach items="${tweets}" var="tweet">
    <tr>
        <td><c:out value = "${tweet.id}"/><p></td>
        <td><c:out value = "${tweet.poster}"/><p></td>
        <td><c:out value = "${tweet.post}"/><p></td>
        <td><c:out value = "${tweet.timestamp}"/><p></td>
    </tr>
    </c:forEach>
    </c:if>
    <c:if test="${(chosenOption == 'poster')}">
    <c:forEach items="${tweets}" var="tweet">
        <c:if test="${(filterValue == tweet.poster)}">
            <tr>
                <td><c:out value = "${tweet.id}"/><p></td>
                <td><c:out value = "${tweet.poster}"/><p></td>
                <td><c:out value = "${tweet.post}"/><p></td>
                <td><c:out value = "${tweet.timestamp}"/><p></td>
            </tr>
        </c:if>
    </c:forEach>
    </c:if>
    <c:if test="${(chosenOption == 'from')}">
        <%
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.ss");
        Date givenDate = dateFormat.parse(filterValue);
        Timestamp filterTimestamp = new java.sql.Timestamp(givenDate.getTime());
        %>
        <c:set var="filterDate" value="<%=filterTimestamp%>"/>
        <c:forEach items="${tweets}" var="tweet">
            <c:set var="tweetTimeAsString" value="<%=tweet.timestamp%>"/>
            <%
            Date tweetTimeAsDate = dateFormat.parse((String)pageContext.getAttribute("tweetTimeAsString"));
            Timestamp tweetTimestamp = new java.sql.Timestamp(tweetDate.getTime());
            %>
            <c:if test="${(TweetTimestamp >= filterTimestamp)}">
                <tr>
                    <td><c:out value = "${tweet.id}"/><p></td>
                    <td><c:out value = "${tweet.poster}"/><p></td>
                    <td><c:out value = "${tweet.post}"/><p></td>
                    <td><c:out value = "${tweet.timestamp}"/><p></td>
                </tr>
            </c:if>
        </c:forEach>
    </c:if>
</table></center>

<center><a href="index.html">Go back</a></center>
</body>
</html>
