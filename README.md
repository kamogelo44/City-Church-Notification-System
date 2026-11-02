# City Church Notification System (Jakarta EE)

## Project Overview
A Jakarta EE enterprise application built for the ITEJA3-33 module. The system provides real-time notifications to church members using Servlets, WebSockets, and JMS (Java Message Service). 

The core problem this application solves is reliable, real-time communication. Instead of members constantly refreshing the page (HTTP polling), this application uses WebSockets to push instant announcements to all connected users the moment a Church Leader posts them. If a user is offline, JMS ensures the message is persisted in a queue and delivered safely.

## Technical Stack
- **Server:** GlassFish 8.0.0
- **Backend:** Jakarta EE 10 (Servlets, WebSockets, JMS, Message-Driven Beans)
- **Frontend:** JSP, HTML, CSS, JavaScript
- **Build Tool:** Maven
- **Java Version:** JDK 21
- **Data Storage:** In-memory (`HashMap` for Users, `ArrayList` for Notification History)

## Architecture & Data Flow
This application bridges two distinct enterprise patterns: **Point-to-Point Messaging** and **Real-Time Push Communication**.

1. A user with the `LEADER` role submits a notification.
2. The `NotificationServlet` validates the session and sends the message to the JMS Queue (`jms/ChurchNotificationQueue`).
3. The `NotificationMessageReceiver` (a Message-Driven Bean) asynchronously picks up the message from the queue.
4. The MDB calls the `NotificationWebSocket` to broadcast the message to all currently connected clients.
5. Frontend clients receive the message instantly via JavaScript and render it without a page reload.

## Features
- [x] **User Registration:** In-memory storage with duplicate username validation.
- [x] **Authentication:** Login Servlet with HTTP Session management.
- [x] **Role-Based Access Control (RBAC):** Protects the notification center. Only users with the `LEADER` role can access it (validated via Server-Side 302 Redirects and Session checks).
- [x] **Real-Time WebSockets:** Full-duplex communication pushes announcements to all connected browsers instantly.
- [x] **JMS Message Persistence:** Reliable message queuing ensures notifications aren't lost if a user is temporarily disconnected.
- [x] **Asynchronous UI:** AJAX/Fetch API form submission prevents page reloads, keeping the WebSocket connection alive while broadcasting.

## Demo Screenshots

### 1. User Login & Registration
*Clean, centered card layout for user authentication.*

<p align="center">
  <img src="https://github.com/user-attachments/assets/7c989bea-5b5f-4685-b8c9-e993d4b8455d" width="45%" alt="Login Page" />
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/6c8056a9-f4ef-4d45-a6d8-b40ae58e19e6" width="45%" alt="Registration Page" />
</p>

<br>

### 2. Home Dashboard
*Displays logged-in user state using HttpSession.*

<p align="center">
  <img src="https://github.com/user-attachments/assets/fda25c01-39b4-429a-8bbf-b376705af220" width="80%" alt="Home Dashboard" />
</p>

<br>

### 3. Role-Based Access Control (RBAC)
*If a standard "Member" attempts to access the Notification Center, the server blocks them via a 302 Redirect.*

<p align="center">
  <img src="https://github.com/user-attachments/assets/4c6ed795-f553-4327-9ee9-372997a23766" width="80%" alt="RBAC Redirect" />
</p>

<br>

### 4. Leader Notification Center
*Only Church Leaders can access this page to post announcements. The message history is rendered here, and new messages appear in real-time.*

<p align="center">
  <img src="https://github.com/user-attachments/assets/80fad64f-1d26-4e12-a727-10c4ba2132ad" width="80%" alt="Notification Center" />
</p>

<br>

## Developer Setup

### Prerequisites
- JDK 21
- Apache Maven
- GlassFish 8.0.0
- NetBeans 30 (or any IDE with Jakarta EE support)

### Configuration
Before running the application, ensure the following JMS resources are configured in your GlassFish Admin Console:
- **Connection Factory:** `jms/_defaultConnectionFactory` (Default)
- **Destination Resource:** Queue with JNDI name `jms/ChurchNotificationQueue`

### Running the Project
1. Clone this repository.
2. Open the project in NetBeans.
3. Clean and Build the project to resolve Maven dependencies.
4. Deploy and run on GlassFish.
5. Access the application at: `http://localhost:8080/CityChurchNotificationSystem`

## Author
**Kamogelo Phale**
