package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.SampleConnectDB;

@WebServlet("/SampleServlet")
public class SampleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SampleConnectDB connector = new SampleConnectDB();
        Boolean isConnected = connector.tryConnect();
        request.setAttribute("isConnected", isConnected);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/sample.jsp");
        dispatcher.forward(request, response);
    }
}
