<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Sample page</title>
    </head>
    <body>
        <h1>jspのサンプルページです</h1>
        <% if ((boolean) request.getAttribute("isConnected")) {%>
            <p>これが表示されている場合，DBに正常に接続されました</p>
        <% } else { %>
            <p>これが表示されている場合，DBに接続できていません</p>
        <% } %>
    </body>
</html>
