# City Church Notification System (Jakarta EE)

## Project Overview
A Jakarta EE enterprise application being developed for the ITEJA3-33 module. 
The system provides real-time notifications to church members using Servlets, WebSockets, and JMS.

## Technical Stack
- **Server:** GlassFish 8.0.0
- **Backend:** Jakarta EE 10 (Servlets, WebSockets, JMS)
- **Frontend:** JSP, HTML, CSS
- **Build Tool:** Maven
- **Java Version:** JDK 21
- **Data Storage:** In-memory (HashMaps/Collections)

## Features (In Development)
- [x] Enterprise Project Structure Setup
- [x] User Registration Servlet (In-memory storage)
- [ ] User Login Servlet & Session Management
- [ ] WebSocket Endpoint for Real-time Notifications
- [ ] JMS Configuration for Message Persistence
- [ ] Role-based Access Control (Church Leaders vs Members)

## Developer Setup
1. Open the project in NetBeans 30.
2. Ensure GlassFish 8.0.0 is installed and configured.
3. Right-click the project and select "Run".
4. The application will deploy to `http://localhost:8080/CityChurchNotificationSystem`.

## Author
Kamogelo Phale
